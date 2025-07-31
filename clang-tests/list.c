#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Simple array-based list (PostgreSQL-style)
typedef struct {
    void **elements;
    int length;
    int capacity;
} List;

// Create a new list
List* list_create() {
    List *list = malloc(sizeof(List));
    list->capacity = 4;
    list->elements = malloc(sizeof(void*) * list->capacity);
    list->length = 0;
    return list;
}

// Add element to end of list
void list_append(List *list, void *element) {
    if (list->length >= list->capacity) {
        list->capacity *= 2;
        list->elements = realloc(list->elements, sizeof(void*) * list->capacity);
    }
    list->elements[list->length++] = element;
}

// Get first element (like PostgreSQL's linitial)
void* list_first(List *list) {
    if (list->length == 0) return NULL;
    return list->elements[0];
}

// Delete first element and shift array left (like PostgreSQL's list_delete)
void list_delete_first(List *list) {
    if (list->length == 0) return;
    
    // Shift all elements left by one position
    for (int i = 0; i < list->length - 1; i++) {
        list->elements[i] = list->elements[i + 1];
    }
    list->length--;
    
    // If list becomes empty, we could set it to NULL, but we'll keep the empty array
}

// Check if list is empty
int list_is_empty(List *list) {
    return list == NULL || list->length == 0;
}

// Free the list structure
void list_free(List *list) {
    if (list) {
        free(list->elements);
        free(list);
    }
}

// Simulate an item that removes itself from the list when freed
typedef struct {
    int id;
    List **owner_list;  // Pointer to the list that owns this item
} Item;

Item* item_create(int id, List **owner_list) {
    Item *item = malloc(sizeof(Item));
    item->id = id;
    item->owner_list = owner_list;
    return item;
}

// This simulates FreeExprContext - it removes itself from the owner list
void item_free(Item *item) {
    printf("Freeing item %d\n", item->id);
    
    // Remove self from owner list (this is the key safety mechanism)
    List *list = *(item->owner_list);
    if (list && list->length > 0 && list->elements[0] == item) {
        list_delete_first(list);
        // If list becomes empty, we could set *owner_list = NULL
        if (list->length == 0) {
            list_free(list);
            *(item->owner_list) = NULL;
        }
    }
    
    free(item);
}

int main() {
    printf("=== SAFE PATTERN (PostgreSQL-style) ===\n");
    
    List *safe_list = list_create();
    
    // Add some items that know about their owner list
    list_append(safe_list, item_create(1, &safe_list));
    list_append(safe_list, item_create(2, &safe_list));
    list_append(safe_list, item_create(3, &safe_list));
    
    printf("Initial list length: %d\n", safe_list->length);
    
    // PostgreSQL-style safe loop
    while (!list_is_empty(safe_list)) {
        Item *first_item = (Item*)list_first(safe_list);  // Re-evaluate each time
        printf("Processing item %d, list length: %d\n", first_item->id, safe_list->length);
        item_free(first_item);  // This removes itself from the list
        // safe_list is now updated, so next iteration gets the new first element
    }
    
    printf("Final list pointer: %s\n", safe_list == NULL ? "NULL" : "not NULL");
    
    printf("\n=== UNSAFE PATTERN (what NOT to do) ===\n");
    
    List *unsafe_list = list_create();
    list_append(unsafe_list, item_create(10, &unsafe_list));
    list_append(unsafe_list, item_create(20, &unsafe_list));
    list_append(unsafe_list, item_create(30, &unsafe_list));
    
    // UNSAFE: Get pointer to first element before loop
    void **first_element_ptr = &unsafe_list->elements[0];  // This becomes stale!
    
    printf("Initial list length: %d\n", unsafe_list->length);
    
    int iterations = 0;
    while (!list_is_empty(unsafe_list) && iterations < 5) {  // Safety limit
        Item *item = (Item*)(*first_element_ptr);  // Using stale pointer!
        printf("Trying to process item %d, list length: %d\n", item->id, unsafe_list->length);
        
        // This will modify the array, making first_element_ptr point to wrong memory
        item_free(item);
        
        // first_element_ptr still points to unsafe_list->elements[0], but the array shifted!
        // So *first_element_ptr now points to what used to be the second element
        
        iterations++;
        printf("After free, what first_element_ptr points to now has id: %d\n", 
               unsafe_list->length > 0 ? ((Item*)(*first_element_ptr))->id : -999);
    }
    
    // Clean up remaining items safely
    while (!list_is_empty(unsafe_list)) {
        Item *item = (Item*)list_first(unsafe_list);
        item_free(item);
    }
    
    return 0;
}
