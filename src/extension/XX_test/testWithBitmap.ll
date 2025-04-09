; ModuleID = 'testWithBitmap.c'
source_filename = "testWithBitmap.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Pg_magic_struct = type { i32, i32, i32, i32, i32, i32, [32 x i8] }
%struct.Pg_finfo_record = type { i32 }
%struct.Bitmapset = type { i32, i32, [0 x i64] }

@.str = private unnamed_addr constant [38 x i8] c"negative bitmapset member not allowed\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"testWithBitmap.c\00", align 1
@__func__.bms_del_member = private unnamed_addr constant [15 x i8] c"bms_del_member\00", align 1
@__func__.bms_add_range = private unnamed_addr constant [14 x i8] c"bms_add_range\00", align 1
@__func__.bms_add_member = private unnamed_addr constant [15 x i8] c"bms_add_member\00", align 1
@Pg_magic_func.Pg_magic_data = internal constant %struct.Pg_magic_struct { i32 56, i32 1600, i32 100, i32 32, i32 64, i32 1, [32 x i8] c"PostgreSQL\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 4
@pg_finfo_bms_test.my_finfo = internal constant %struct.Pg_finfo_record { i32 1 }, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @bms_del_member(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %21

11:                                               ; preds = %2
  br label %12

12:                                               ; preds = %11
  br i1 true, label %13, label %15

13:                                               ; preds = %12
  %14 = call zeroext i1 @errstart_cold(i32 noundef 21, ptr noundef null) #4
  br i1 %14, label %17, label %19

15:                                               ; preds = %12
  %16 = call zeroext i1 @errstart(i32 noundef 21, ptr noundef null)
  br i1 %16, label %17, label %19

17:                                               ; preds = %15, %13
  %18 = call i32 (ptr, ...) @errmsg_internal(ptr noundef @.str)
  call void @errfinish(ptr noundef @.str.1, i32 noundef 58, ptr noundef @__func__.bms_del_member)
  br label %19

19:                                               ; preds = %17, %15, %13
  call void @abort() #5
  unreachable

20:                                               ; No predecessors!
  br label %21

21:                                               ; preds = %20, %2
  %22 = load ptr, ptr %4, align 8
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  store ptr null, ptr %3, align 8
  br label %54

25:                                               ; preds = %21
  %26 = load i32, ptr %5, align 4
  %27 = sdiv i32 %26, 64
  store i32 %27, ptr %6, align 4
  %28 = load i32, ptr %5, align 4
  %29 = srem i32 %28, 64
  store i32 %29, ptr %7, align 4
  %30 = load i32, ptr %6, align 4
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds nuw %struct.Bitmapset, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = icmp slt i32 %30, %33
  br i1 %34, label %35, label %47

35:                                               ; preds = %25
  %36 = load i32, ptr %7, align 4
  %37 = zext i32 %36 to i64
  %38 = shl i64 1, %37
  %39 = xor i64 %38, -1
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds nuw %struct.Bitmapset, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %6, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [0 x i64], ptr %41, i64 0, i64 %43
  %45 = load i64, ptr %44, align 8
  %46 = and i64 %45, %39
  store i64 %46, ptr %44, align 8
  br label %47

47:                                               ; preds = %35, %25
  %48 = load ptr, ptr %4, align 8
  %49 = call zeroext i1 @bms_is_empty_internal(ptr noundef %48)
  br i1 %49, label %50, label %52

50:                                               ; preds = %47
  %51 = load ptr, ptr %4, align 8
  call void @pfree(ptr noundef %51)
  store ptr null, ptr %3, align 8
  br label %54

52:                                               ; preds = %47
  %53 = load ptr, ptr %4, align 8
  store ptr %53, ptr %3, align 8
  br label %54

54:                                               ; preds = %52, %50, %24
  %55 = load ptr, ptr %3, align 8
  ret ptr %55
}

; Function Attrs: cold
declare zeroext i1 @errstart_cold(i32 noundef, ptr noundef) #1

declare zeroext i1 @errstart(i32 noundef, ptr noundef) #2

declare i32 @errmsg_internal(ptr noundef, ...) #2

declare void @errfinish(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i1 @bms_is_empty_internal(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Bitmapset, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  store i32 %9, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %25, %1
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %28

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.Bitmapset, ptr %15, i32 0, i32 2
  %17 = load i32, ptr %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [0 x i64], ptr %16, i64 0, i64 %18
  %20 = load i64, ptr %19, align 8
  store i64 %20, ptr %6, align 8
  %21 = load i64, ptr %6, align 8
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %14
  store i1 false, ptr %2, align 1
  br label %29

24:                                               ; preds = %14
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  br label %10, !llvm.loop !6

28:                                               ; preds = %10
  store i1 true, ptr %2, align 1
  br label %29

29:                                               ; preds = %28, %23
  %30 = load i1, ptr %2, align 1
  ret i1 %30
}

declare void @pfree(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @bms_add_members(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %15

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = call ptr @bms_copy(ptr noundef %13)
  store ptr %14, ptr %3, align 8
  br label %68

15:                                               ; preds = %2
  %16 = load ptr, ptr %5, align 8
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = load ptr, ptr %4, align 8
  store ptr %19, ptr %3, align 8
  br label %68

20:                                               ; preds = %15
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.Bitmapset, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.Bitmapset, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %32

28:                                               ; preds = %20
  %29 = load ptr, ptr %5, align 8
  %30 = call ptr @bms_copy(ptr noundef %29)
  store ptr %30, ptr %6, align 8
  %31 = load ptr, ptr %4, align 8
  store ptr %31, ptr %7, align 8
  br label %35

32:                                               ; preds = %20
  %33 = load ptr, ptr %4, align 8
  store ptr %33, ptr %6, align 8
  %34 = load ptr, ptr %5, align 8
  store ptr %34, ptr %7, align 8
  br label %35

35:                                               ; preds = %32, %28
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr inbounds nuw %struct.Bitmapset, ptr %36, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  store i32 %38, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %39

39:                                               ; preds = %57, %35
  %40 = load i32, ptr %9, align 4
  %41 = load i32, ptr %8, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %60

43:                                               ; preds = %39
  %44 = load ptr, ptr %7, align 8
  %45 = getelementptr inbounds nuw %struct.Bitmapset, ptr %44, i32 0, i32 2
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [0 x i64], ptr %45, i64 0, i64 %47
  %49 = load i64, ptr %48, align 8
  %50 = load ptr, ptr %6, align 8
  %51 = getelementptr inbounds nuw %struct.Bitmapset, ptr %50, i32 0, i32 2
  %52 = load i32, ptr %9, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [0 x i64], ptr %51, i64 0, i64 %53
  %55 = load i64, ptr %54, align 8
  %56 = or i64 %55, %49
  store i64 %56, ptr %54, align 8
  br label %57

57:                                               ; preds = %43
  %58 = load i32, ptr %9, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %9, align 4
  br label %39, !llvm.loop !8

60:                                               ; preds = %39
  %61 = load ptr, ptr %6, align 8
  %62 = load ptr, ptr %4, align 8
  %63 = icmp ne ptr %61, %62
  br i1 %63, label %64, label %66

64:                                               ; preds = %60
  %65 = load ptr, ptr %4, align 8
  call void @pfree(ptr noundef %65)
  br label %66

66:                                               ; preds = %64, %60
  %67 = load ptr, ptr %6, align 8
  store ptr %67, ptr %3, align 8
  br label %68

68:                                               ; preds = %66, %18, %12
  %69 = load ptr, ptr %3, align 8
  ret ptr %69
}

declare ptr @bms_copy(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @bms_add_range(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %3
  %20 = load ptr, ptr %5, align 8
  store ptr %20, ptr %4, align 8
  br label %158

21:                                               ; preds = %3
  %22 = load i32, ptr %6, align 4
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %24, label %34

24:                                               ; preds = %21
  br label %25

25:                                               ; preds = %24
  br i1 true, label %26, label %28

26:                                               ; preds = %25
  %27 = call zeroext i1 @errstart_cold(i32 noundef 21, ptr noundef null) #4
  br i1 %27, label %30, label %32

28:                                               ; preds = %25
  %29 = call zeroext i1 @errstart(i32 noundef 21, ptr noundef null)
  br i1 %29, label %30, label %32

30:                                               ; preds = %28, %26
  %31 = call i32 (ptr, ...) @errmsg_internal(ptr noundef @.str)
  call void @errfinish(ptr noundef @.str.1, i32 noundef 121, ptr noundef @__func__.bms_add_range)
  br label %32

32:                                               ; preds = %30, %28, %26
  call void @abort() #5
  unreachable

33:                                               ; No predecessors!
  br label %34

34:                                               ; preds = %33, %21
  %35 = load i32, ptr %7, align 4
  %36 = sdiv i32 %35, 64
  store i32 %36, ptr %10, align 4
  %37 = load ptr, ptr %5, align 8
  %38 = icmp eq ptr %37, null
  br i1 %38, label %39, label %52

39:                                               ; preds = %34
  %40 = load i32, ptr %10, align 4
  %41 = add nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = mul i64 %42, 8
  %44 = add i64 8, %43
  %45 = call ptr @palloc0(i64 noundef %44)
  store ptr %45, ptr %5, align 8
  %46 = load ptr, ptr %5, align 8
  %47 = getelementptr inbounds nuw %struct.Bitmapset, ptr %46, i32 0, i32 0
  store i32 424, ptr %47, align 8
  %48 = load i32, ptr %10, align 4
  %49 = add nsw i32 %48, 1
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds nuw %struct.Bitmapset, ptr %50, i32 0, i32 1
  store i32 %49, ptr %51, align 4
  br label %91

52:                                               ; preds = %34
  %53 = load i32, ptr %10, align 4
  %54 = load ptr, ptr %5, align 8
  %55 = getelementptr inbounds nuw %struct.Bitmapset, ptr %54, i32 0, i32 1
  %56 = load i32, ptr %55, align 4
  %57 = icmp sge i32 %53, %56
  br i1 %57, label %58, label %90

58:                                               ; preds = %52
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds nuw %struct.Bitmapset, ptr %59, i32 0, i32 1
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %14, align 4
  %62 = load ptr, ptr %5, align 8
  %63 = load i32, ptr %10, align 4
  %64 = add nsw i32 %63, 1
  %65 = sext i32 %64 to i64
  %66 = mul i64 %65, 8
  %67 = add i64 8, %66
  %68 = call ptr @repalloc(ptr noundef %62, i64 noundef %67)
  store ptr %68, ptr %5, align 8
  %69 = load i32, ptr %10, align 4
  %70 = add nsw i32 %69, 1
  %71 = load ptr, ptr %5, align 8
  %72 = getelementptr inbounds nuw %struct.Bitmapset, ptr %71, i32 0, i32 1
  store i32 %70, ptr %72, align 4
  %73 = load i32, ptr %14, align 4
  store i32 %73, ptr %15, align 4
  br label %74

74:                                               ; preds = %86, %58
  %75 = load i32, ptr %15, align 4
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds nuw %struct.Bitmapset, ptr %76, i32 0, i32 1
  %78 = load i32, ptr %77, align 4
  %79 = icmp slt i32 %75, %78
  br i1 %79, label %80, label %89

80:                                               ; preds = %74
  %81 = load ptr, ptr %5, align 8
  %82 = getelementptr inbounds nuw %struct.Bitmapset, ptr %81, i32 0, i32 2
  %83 = load i32, ptr %15, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [0 x i64], ptr %82, i64 0, i64 %84
  store i64 0, ptr %85, align 8
  br label %86

86:                                               ; preds = %80
  %87 = load i32, ptr %15, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr %15, align 4
  br label %74, !llvm.loop !9

89:                                               ; preds = %74
  br label %90

90:                                               ; preds = %89, %52
  br label %91

91:                                               ; preds = %90, %39
  %92 = load i32, ptr %6, align 4
  %93 = sdiv i32 %92, 64
  store i32 %93, ptr %8, align 4
  store i32 %93, ptr %12, align 4
  %94 = load i32, ptr %6, align 4
  %95 = srem i32 %94, 64
  store i32 %95, ptr %9, align 4
  %96 = load i32, ptr %7, align 4
  %97 = srem i32 %96, 64
  %98 = add nsw i32 %97, 1
  %99 = sub nsw i32 64, %98
  store i32 %99, ptr %11, align 4
  %100 = load i32, ptr %8, align 4
  %101 = load i32, ptr %10, align 4
  %102 = icmp eq i32 %100, %101
  br i1 %102, label %103, label %120

103:                                              ; preds = %91
  %104 = load i32, ptr %9, align 4
  %105 = zext i32 %104 to i64
  %106 = shl i64 1, %105
  %107 = sub i64 %106, 1
  %108 = xor i64 %107, -1
  %109 = load i32, ptr %11, align 4
  %110 = zext i32 %109 to i64
  %111 = lshr i64 -1, %110
  %112 = and i64 %108, %111
  %113 = load ptr, ptr %5, align 8
  %114 = getelementptr inbounds nuw %struct.Bitmapset, ptr %113, i32 0, i32 2
  %115 = load i32, ptr %8, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [0 x i64], ptr %114, i64 0, i64 %116
  %118 = load i64, ptr %117, align 8
  %119 = or i64 %118, %112
  store i64 %119, ptr %117, align 8
  br label %156

120:                                              ; preds = %91
  %121 = load i32, ptr %9, align 4
  %122 = zext i32 %121 to i64
  %123 = shl i64 1, %122
  %124 = sub i64 %123, 1
  %125 = xor i64 %124, -1
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds nuw %struct.Bitmapset, ptr %126, i32 0, i32 2
  %128 = load i32, ptr %12, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, ptr %12, align 4
  %130 = sext i32 %128 to i64
  %131 = getelementptr inbounds [0 x i64], ptr %127, i64 0, i64 %130
  %132 = load i64, ptr %131, align 8
  %133 = or i64 %132, %125
  store i64 %133, ptr %131, align 8
  br label %134

134:                                              ; preds = %138, %120
  %135 = load i32, ptr %12, align 4
  %136 = load i32, ptr %10, align 4
  %137 = icmp slt i32 %135, %136
  br i1 %137, label %138, label %145

138:                                              ; preds = %134
  %139 = load ptr, ptr %5, align 8
  %140 = getelementptr inbounds nuw %struct.Bitmapset, ptr %139, i32 0, i32 2
  %141 = load i32, ptr %12, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, ptr %12, align 4
  %143 = sext i32 %141 to i64
  %144 = getelementptr inbounds [0 x i64], ptr %140, i64 0, i64 %143
  store i64 -1, ptr %144, align 8
  br label %134, !llvm.loop !10

145:                                              ; preds = %134
  %146 = load i32, ptr %11, align 4
  %147 = zext i32 %146 to i64
  %148 = lshr i64 -1, %147
  %149 = load ptr, ptr %5, align 8
  %150 = getelementptr inbounds nuw %struct.Bitmapset, ptr %149, i32 0, i32 2
  %151 = load i32, ptr %10, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [0 x i64], ptr %150, i64 0, i64 %152
  %154 = load i64, ptr %153, align 8
  %155 = or i64 %154, %148
  store i64 %155, ptr %153, align 8
  br label %156

156:                                              ; preds = %145, %103
  %157 = load ptr, ptr %5, align 8
  store ptr %157, ptr %4, align 8
  br label %158

158:                                              ; preds = %156, %19
  %159 = load ptr, ptr %4, align 8
  ret ptr %159
}

declare ptr @palloc0(i64 noundef) #2

declare ptr @repalloc(ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @bms_int_members(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %78

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = load ptr, ptr %4, align 8
  call void @pfree(ptr noundef %15)
  store ptr null, ptr %3, align 8
  br label %78

16:                                               ; preds = %11
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds nuw %struct.Bitmapset, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.Bitmapset, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %28

24:                                               ; preds = %16
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds nuw %struct.Bitmapset, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  br label %32

28:                                               ; preds = %16
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.Bitmapset, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  br label %32

32:                                               ; preds = %28, %24
  %33 = phi i32 [ %27, %24 ], [ %31, %28 ]
  store i32 %33, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %34

34:                                               ; preds = %52, %32
  %35 = load i32, ptr %7, align 4
  %36 = load i32, ptr %6, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %55

38:                                               ; preds = %34
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.Bitmapset, ptr %39, i32 0, i32 2
  %41 = load i32, ptr %7, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [0 x i64], ptr %40, i64 0, i64 %42
  %44 = load i64, ptr %43, align 8
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds nuw %struct.Bitmapset, ptr %45, i32 0, i32 2
  %47 = load i32, ptr %7, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [0 x i64], ptr %46, i64 0, i64 %48
  %50 = load i64, ptr %49, align 8
  %51 = and i64 %50, %44
  store i64 %51, ptr %49, align 8
  br label %52

52:                                               ; preds = %38
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %7, align 4
  br label %34, !llvm.loop !11

55:                                               ; preds = %34
  br label %56

56:                                               ; preds = %68, %55
  %57 = load i32, ptr %7, align 4
  %58 = load ptr, ptr %4, align 8
  %59 = getelementptr inbounds nuw %struct.Bitmapset, ptr %58, i32 0, i32 1
  %60 = load i32, ptr %59, align 4
  %61 = icmp slt i32 %57, %60
  br i1 %61, label %62, label %71

62:                                               ; preds = %56
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds nuw %struct.Bitmapset, ptr %63, i32 0, i32 2
  %65 = load i32, ptr %7, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [0 x i64], ptr %64, i64 0, i64 %66
  store i64 0, ptr %67, align 8
  br label %68

68:                                               ; preds = %62
  %69 = load i32, ptr %7, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %7, align 4
  br label %56, !llvm.loop !12

71:                                               ; preds = %56
  %72 = load ptr, ptr %4, align 8
  %73 = call zeroext i1 @bms_is_empty_internal(ptr noundef %72)
  br i1 %73, label %74, label %76

74:                                               ; preds = %71
  %75 = load ptr, ptr %4, align 8
  call void @pfree(ptr noundef %75)
  store ptr null, ptr %3, align 8
  br label %78

76:                                               ; preds = %71
  %77 = load ptr, ptr %4, align 8
  store ptr %77, ptr %3, align 8
  br label %78

78:                                               ; preds = %76, %74, %14, %10
  %79 = load ptr, ptr %3, align 8
  ret ptr %79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @bms_del_members(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %63

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = load ptr, ptr %4, align 8
  store ptr %15, ptr %3, align 8
  br label %63

16:                                               ; preds = %11
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds nuw %struct.Bitmapset, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.Bitmapset, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %28

24:                                               ; preds = %16
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds nuw %struct.Bitmapset, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  br label %32

28:                                               ; preds = %16
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.Bitmapset, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  br label %32

32:                                               ; preds = %28, %24
  %33 = phi i32 [ %27, %24 ], [ %31, %28 ]
  store i32 %33, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %34

34:                                               ; preds = %53, %32
  %35 = load i32, ptr %7, align 4
  %36 = load i32, ptr %6, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %56

38:                                               ; preds = %34
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.Bitmapset, ptr %39, i32 0, i32 2
  %41 = load i32, ptr %7, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [0 x i64], ptr %40, i64 0, i64 %42
  %44 = load i64, ptr %43, align 8
  %45 = xor i64 %44, -1
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds nuw %struct.Bitmapset, ptr %46, i32 0, i32 2
  %48 = load i32, ptr %7, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [0 x i64], ptr %47, i64 0, i64 %49
  %51 = load i64, ptr %50, align 8
  %52 = and i64 %51, %45
  store i64 %52, ptr %50, align 8
  br label %53

53:                                               ; preds = %38
  %54 = load i32, ptr %7, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %7, align 4
  br label %34, !llvm.loop !13

56:                                               ; preds = %34
  %57 = load ptr, ptr %4, align 8
  %58 = call zeroext i1 @bms_is_empty_internal(ptr noundef %57)
  br i1 %58, label %59, label %61

59:                                               ; preds = %56
  %60 = load ptr, ptr %4, align 8
  call void @pfree(ptr noundef %60)
  store ptr null, ptr %3, align 8
  br label %63

61:                                               ; preds = %56
  %62 = load ptr, ptr %4, align 8
  store ptr %62, ptr %3, align 8
  br label %63

63:                                               ; preds = %61, %59, %14, %10
  %64 = load ptr, ptr %3, align 8
  ret ptr %64
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @bms_join(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  store ptr %13, ptr %3, align 8
  br label %66

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = load ptr, ptr %4, align 8
  store ptr %18, ptr %3, align 8
  br label %66

19:                                               ; preds = %14
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds nuw %struct.Bitmapset, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.Bitmapset, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = icmp slt i32 %22, %25
  br i1 %26, label %27, label %30

27:                                               ; preds = %19
  %28 = load ptr, ptr %5, align 8
  store ptr %28, ptr %6, align 8
  %29 = load ptr, ptr %4, align 8
  store ptr %29, ptr %7, align 8
  br label %33

30:                                               ; preds = %19
  %31 = load ptr, ptr %4, align 8
  store ptr %31, ptr %6, align 8
  %32 = load ptr, ptr %5, align 8
  store ptr %32, ptr %7, align 8
  br label %33

33:                                               ; preds = %30, %27
  %34 = load ptr, ptr %7, align 8
  %35 = getelementptr inbounds nuw %struct.Bitmapset, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 4
  store i32 %36, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %37

37:                                               ; preds = %55, %33
  %38 = load i32, ptr %9, align 4
  %39 = load i32, ptr %8, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %58

41:                                               ; preds = %37
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds nuw %struct.Bitmapset, ptr %42, i32 0, i32 2
  %44 = load i32, ptr %9, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [0 x i64], ptr %43, i64 0, i64 %45
  %47 = load i64, ptr %46, align 8
  %48 = load ptr, ptr %6, align 8
  %49 = getelementptr inbounds nuw %struct.Bitmapset, ptr %48, i32 0, i32 2
  %50 = load i32, ptr %9, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [0 x i64], ptr %49, i64 0, i64 %51
  %53 = load i64, ptr %52, align 8
  %54 = or i64 %53, %47
  store i64 %54, ptr %52, align 8
  br label %55

55:                                               ; preds = %41
  %56 = load i32, ptr %9, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %9, align 4
  br label %37, !llvm.loop !14

58:                                               ; preds = %37
  %59 = load ptr, ptr %7, align 8
  %60 = load ptr, ptr %6, align 8
  %61 = icmp ne ptr %59, %60
  br i1 %61, label %62, label %64

62:                                               ; preds = %58
  %63 = load ptr, ptr %7, align 8
  call void @pfree(ptr noundef %63)
  br label %64

64:                                               ; preds = %62, %58
  %65 = load ptr, ptr %6, align 8
  store ptr %65, ptr %3, align 8
  br label %66

66:                                               ; preds = %64, %17, %12
  %67 = load ptr, ptr %3, align 8
  ret ptr %67
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @bms_add_member(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %23

13:                                               ; preds = %2
  br label %14

14:                                               ; preds = %13
  br i1 true, label %15, label %17

15:                                               ; preds = %14
  %16 = call zeroext i1 @errstart_cold(i32 noundef 21, ptr noundef null) #4
  br i1 %16, label %19, label %21

17:                                               ; preds = %14
  %18 = call zeroext i1 @errstart(i32 noundef 21, ptr noundef null)
  br i1 %18, label %19, label %21

19:                                               ; preds = %17, %15
  %20 = call i32 (ptr, ...) @errmsg_internal(ptr noundef @.str)
  call void @errfinish(ptr noundef @.str.1, i32 noundef 266, ptr noundef @__func__.bms_add_member)
  br label %21

21:                                               ; preds = %19, %17, %15
  call void @abort() #5
  unreachable

22:                                               ; No predecessors!
  br label %23

23:                                               ; preds = %22, %2
  %24 = load ptr, ptr %4, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %29

26:                                               ; preds = %23
  %27 = load i32, ptr %5, align 4
  %28 = call ptr @bms_make_singleton(i32 noundef %27)
  store ptr %28, ptr %3, align 8
  br label %83

29:                                               ; preds = %23
  %30 = load i32, ptr %5, align 4
  %31 = sdiv i32 %30, 64
  store i32 %31, ptr %6, align 4
  %32 = load i32, ptr %5, align 4
  %33 = srem i32 %32, 64
  store i32 %33, ptr %7, align 4
  %34 = load i32, ptr %6, align 4
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds nuw %struct.Bitmapset, ptr %35, i32 0, i32 1
  %37 = load i32, ptr %36, align 4
  %38 = icmp sge i32 %34, %37
  br i1 %38, label %39, label %71

39:                                               ; preds = %29
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds nuw %struct.Bitmapset, ptr %40, i32 0, i32 1
  %42 = load i32, ptr %41, align 4
  store i32 %42, ptr %9, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = mul i64 %46, 8
  %48 = add i64 8, %47
  %49 = call ptr @repalloc(ptr noundef %43, i64 noundef %48)
  store ptr %49, ptr %4, align 8
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, 1
  %52 = load ptr, ptr %4, align 8
  %53 = getelementptr inbounds nuw %struct.Bitmapset, ptr %52, i32 0, i32 1
  store i32 %51, ptr %53, align 4
  %54 = load i32, ptr %9, align 4
  store i32 %54, ptr %10, align 4
  br label %55

55:                                               ; preds = %67, %39
  %56 = load i32, ptr %10, align 4
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds nuw %struct.Bitmapset, ptr %57, i32 0, i32 1
  %59 = load i32, ptr %58, align 4
  %60 = icmp slt i32 %56, %59
  br i1 %60, label %61, label %70

61:                                               ; preds = %55
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds nuw %struct.Bitmapset, ptr %62, i32 0, i32 2
  %64 = load i32, ptr %10, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [0 x i64], ptr %63, i64 0, i64 %65
  store i64 0, ptr %66, align 8
  br label %67

67:                                               ; preds = %61
  %68 = load i32, ptr %10, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %10, align 4
  br label %55, !llvm.loop !15

70:                                               ; preds = %55
  br label %71

71:                                               ; preds = %70, %29
  %72 = load i32, ptr %7, align 4
  %73 = zext i32 %72 to i64
  %74 = shl i64 1, %73
  %75 = load ptr, ptr %4, align 8
  %76 = getelementptr inbounds nuw %struct.Bitmapset, ptr %75, i32 0, i32 2
  %77 = load i32, ptr %6, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [0 x i64], ptr %76, i64 0, i64 %78
  %80 = load i64, ptr %79, align 8
  %81 = or i64 %80, %74
  store i64 %81, ptr %79, align 8
  %82 = load ptr, ptr %4, align 8
  store ptr %82, ptr %3, align 8
  br label %83

83:                                               ; preds = %71, %26
  %84 = load ptr, ptr %3, align 8
  ret ptr %84
}

declare ptr @bms_make_singleton(i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @Pg_magic_func() #0 {
  ret ptr @Pg_magic_func.Pg_magic_data
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @pg_finfo_bms_test() #0 {
  ret ptr @pg_finfo_bms_test.my_finfo
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @bms_test(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %8 = call ptr @bms_make_singleton(i32 noundef 0)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call ptr @bms_add_member(ptr noundef %9, i32 noundef 1)
  %11 = load ptr, ptr %5, align 8
  %12 = call ptr @bms_add_member(ptr noundef %11, i32 noundef 200)
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = call ptr @bms_add_member(ptr noundef %13, i32 noundef 0)
  %15 = load ptr, ptr %5, align 8
  %16 = call ptr @bms_add_member(ptr noundef %15, i32 noundef 128)
  %17 = load ptr, ptr %5, align 8
  %18 = call ptr @bms_add_member(ptr noundef %17, i32 noundef 0)
  %19 = load ptr, ptr %5, align 8
  %20 = call ptr @bms_add_member(ptr noundef %19, i32 noundef 200)
  store ptr %20, ptr %5, align 8
  ret i64 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 20.0.0git (https://github.com/berndreiss/llvm-project d4f604009b44cfea391ae3491bcbb03825106d53)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
