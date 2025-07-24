void *palloc(int size);
enum COMPAT_MODE{MODE};
bool ecpg_check_PQresult (PGresult *results, int lineno, PGconn *	connection,	enum COMPAT_MODE compat);
typedef struct {}PGresult;
typedef struct {}PGconn;
void usePGresult(PGresult *res);

int main(){
  PGresult *res = palloc(sizeof(PGresult));
  PGconn *conn = palloc(sizeof(PGconn));
  ret = ecpg_check_PQresult(res, 0, conn, MODE); 
  if (res)
    usePGresult(res); 
}

