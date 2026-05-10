; ModuleID = 'Juliet.bc'
source_filename = "Juliet.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.benchmark_bad.arr1 = private unnamed_addr constant [6 x i32] [i32 10, i32 20, i32 30, i32 40, i32 50, i32 60], align 16
@__const.benchmark_bad.arr2 = private unnamed_addr constant [4 x i32] [i32 1, i32 3, i32 5, i32 7], align 16
@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"unlikely\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"deep safe path\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"Juliet.c\00", align 1
@__PRETTY_FUNCTION__.benchmark_bad = private unnamed_addr constant [21 x i8] c"void benchmark_bad()\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.10 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@__const.goodG2B.arr = private unnamed_addr constant [6 x i32] [i32 10, i32 20, i32 30, i32 40, i32 50, i32 60], align 16
@.str.14 = private unnamed_addr constant [27 x i8] c"ERROR: Index out-of-bounds\00", align 1
@__const.goodB2G.arr1 = private unnamed_addr constant [6 x i32] [i32 10, i32 20, i32 30, i32 40, i32 50, i32 60], align 16
@__const.goodB2G.arr2 = private unnamed_addr constant [4 x i32] [i32 1, i32 3, i32 5, i32 7], align 16
@.str.15 = private unnamed_addr constant [36 x i8] c"ERROR: Pointer offset out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @benchmark_bad() #0 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %arr1 = alloca [6 x i32], align 16
  %arr2 = alloca [4 x i32], align 16
  %p = alloca ptr, align 8
  %idx = alloca i32, align 4
  %val = alloca i32, align 4
  %val43 = alloca i32, align 4
  %q = alloca ptr, align 8
  %off = alloca i32, align 4
  %val2 = alloca i32, align 4
  %val270 = alloca i32, align 4
  %0 = call ptr @memcpy(ptr %arr1, ptr @__const.benchmark_bad.arr1, i64 24)
  %1 = call ptr @memcpy(ptr %arr2, ptr @__const.benchmark_bad.arr2, i64 16)
  call void @klee_make_symbolic(ptr noundef %a, i64 noundef 4, ptr noundef @.str)
  call void @klee_make_symbolic(ptr noundef %b, i64 noundef 4, ptr noundef @.str.1)
  call void @klee_make_symbolic(ptr noundef %c, i64 noundef 4, ptr noundef @.str.2)
  call void @klee_make_symbolic(ptr noundef %d, i64 noundef 4, ptr noundef @.str.3)
  %2 = load i32, ptr %a, align 4
  %cmp = icmp sgt i32 %2, -20
  br i1 %cmp, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, ptr %a, align 4
  %cmp1 = icmp slt i32 %3, 20
  br i1 %cmp1, label %if.then, label %if.end7

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, ptr %b, align 4
  %5 = load i32, ptr %c, align 4
  %xor = xor i32 %4, %5
  %cmp2 = icmp ne i32 %xor, 1234
  br i1 %cmp2, label %if.then3, label %if.end6

if.then3:                                         ; preds = %if.then
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %b, align 4
  %add = add nsw i32 %6, %7
  %8 = load i32, ptr %c, align 4
  %sub = sub nsw i32 %add, %8
  %cmp4 = icmp eq i32 %sub, 999
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then3
  call void @printLine(ptr noundef @.str.4)
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then3
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %land.lhs.true, %entry
  %9 = load i32, ptr %a, align 4
  %cmp8 = icmp sgt i32 %9, 5
  br i1 %cmp8, label %if.then9, label %if.end22

if.then9:                                         ; preds = %if.end7
  %10 = load i32, ptr %b, align 4
  %cmp10 = icmp sgt i32 %10, 10
  br i1 %cmp10, label %if.then11, label %if.end21

if.then11:                                        ; preds = %if.then9
  %11 = load i32, ptr %c, align 4
  %cmp12 = icmp sgt i32 %11, 15
  br i1 %cmp12, label %if.then13, label %if.end20

if.then13:                                        ; preds = %if.then11
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %b, align 4
  %add14 = add nsw i32 %12, %13
  %14 = load i32, ptr %c, align 4
  %add15 = add nsw i32 %add14, %14
  %15 = load i32, ptr %d, align 4
  %add16 = add nsw i32 %add15, %15
  %rem = srem i32 %add16, 9
  %cmp17 = icmp eq i32 %rem, 0
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.then13
  call void @printLine(ptr noundef @.str.5)
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.then13
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.then11
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then9
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.end7
  %16 = load i32, ptr %a, align 4
  %cmp23 = icmp sge i32 %16, 0
  br i1 %cmp23, label %land.lhs.true24, label %if.end52

land.lhs.true24:                                  ; preds = %if.end22
  %17 = load i32, ptr %a, align 4
  %cmp25 = icmp slt i32 %17, 6
  br i1 %cmp25, label %if.then26, label %if.end52

if.then26:                                        ; preds = %land.lhs.true24
  %18 = load i32, ptr %a, align 4
  %idxprom = sext i32 %18 to i64
  %arrayidx = getelementptr inbounds [6 x i32], ptr %arr1, i64 0, i64 %idxprom
  store ptr %arrayidx, ptr %p, align 8
  %19 = load i32, ptr %b, align 4
  %cmp27 = icmp sgt i32 %19, 2
  br i1 %cmp27, label %if.then28, label %if.end51

if.then28:                                        ; preds = %if.then26
  %20 = load i32, ptr %c, align 4
  %cmp29 = icmp slt i32 %20, 0
  br i1 %cmp29, label %if.then30, label %if.end50

if.then30:                                        ; preds = %if.then28
  %21 = load i32, ptr %a, align 4
  %22 = load i32, ptr %b, align 4
  %add31 = add nsw i32 %21, %22
  %23 = load i32, ptr %c, align 4
  %sub32 = sub nsw i32 %add31, %23
  %24 = load i32, ptr %d, align 4
  %add33 = add nsw i32 %sub32, %24
  store i32 %add33, ptr %idx, align 4
  %25 = load i32, ptr %idx, align 4
  %cmp34 = icmp sge i32 %25, 0
  br i1 %cmp34, label %land.lhs.true35, label %if.else

land.lhs.true35:                                  ; preds = %if.then30
  %26 = load i32, ptr %idx, align 4
  %cmp36 = icmp slt i32 %26, 6
  br i1 %cmp36, label %if.then37, label %if.else

if.then37:                                        ; preds = %land.lhs.true35
  %27 = load i32, ptr %idx, align 4
  %idxprom38 = sext i32 %27 to i64
  %arrayidx39 = getelementptr inbounds [6 x i32], ptr %arr1, i64 0, i64 %idxprom38
  %28 = load i32, ptr %arrayidx39, align 4
  store i32 %28, ptr %val, align 4
  %29 = load i32, ptr %val, align 4
  call void @printIntLine(i32 noundef %29)
  %30 = load i32, ptr %val, align 4
  %cmp40 = icmp eq i32 %30, 999
  br i1 %cmp40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.then37
  call void @__assert_fail(ptr noundef @.str.6, ptr noundef @.str.7, i32 noundef 58, ptr noundef @__PRETTY_FUNCTION__.benchmark_bad) #6
  unreachable

if.end42:                                         ; preds = %if.then37
  br label %if.end46

if.else:                                          ; preds = %land.lhs.true35, %if.then30
  %31 = load i32, ptr %idx, align 4
  %idxprom44 = sext i32 %31 to i64
  %arrayidx45 = getelementptr inbounds [6 x i32], ptr %arr1, i64 0, i64 %idxprom44
  %32 = load i32, ptr %arrayidx45, align 4
  store i32 %32, ptr %val43, align 4
  %33 = load i32, ptr %val43, align 4
  call void @printIntLine(i32 noundef %33)
  call void @__assert_fail(ptr noundef @.str.6, ptr noundef @.str.7, i32 noundef 64, ptr noundef @__PRETTY_FUNCTION__.benchmark_bad) #6
  unreachable

if.end46:                                         ; preds = %if.end42
  %34 = load ptr, ptr %p, align 8
  %35 = load i32, ptr %34, align 4
  %cmp47 = icmp eq i32 %35, 777
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end46
  call void @__assert_fail(ptr noundef @.str.6, ptr noundef @.str.7, i32 noundef 68, ptr noundef @__PRETTY_FUNCTION__.benchmark_bad) #6
  unreachable

if.end49:                                         ; preds = %if.end46
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then28
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then26
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %land.lhs.true24, %if.end22
  %36 = load i32, ptr %d, align 4
  %cmp53 = icmp sge i32 %36, 0
  br i1 %cmp53, label %land.lhs.true54, label %if.end76

land.lhs.true54:                                  ; preds = %if.end52
  %37 = load i32, ptr %d, align 4
  %cmp55 = icmp slt i32 %37, 4
  br i1 %cmp55, label %if.then56, label %if.end76

if.then56:                                        ; preds = %land.lhs.true54
  %38 = load i32, ptr %d, align 4
  %idxprom57 = sext i32 %38 to i64
  %arrayidx58 = getelementptr inbounds [4 x i32], ptr %arr2, i64 0, i64 %idxprom57
  store ptr %arrayidx58, ptr %q, align 8
  %39 = load i32, ptr %a, align 4
  %cmp59 = icmp slt i32 %39, 0
  br i1 %cmp59, label %if.then60, label %if.end75

if.then60:                                        ; preds = %if.then56
  %40 = load i32, ptr %b, align 4
  %cmp61 = icmp sgt i32 %40, 5
  br i1 %cmp61, label %if.then62, label %if.end74

if.then62:                                        ; preds = %if.then60
  %41 = load i32, ptr %b, align 4
  %42 = load i32, ptr %c, align 4
  %add63 = add nsw i32 %41, %42
  %43 = load i32, ptr %d, align 4
  %sub64 = sub nsw i32 %add63, %43
  store i32 %sub64, ptr %off, align 4
  %44 = load i32, ptr %off, align 4
  %cmp65 = icmp sge i32 %44, 0
  br i1 %cmp65, label %land.lhs.true66, label %if.else69

land.lhs.true66:                                  ; preds = %if.then62
  %45 = load i32, ptr %off, align 4
  %cmp67 = icmp slt i32 %45, 4
  br i1 %cmp67, label %if.then68, label %if.else69

if.then68:                                        ; preds = %land.lhs.true66
  %46 = load ptr, ptr %q, align 8
  %47 = load i32, ptr %off, align 4
  %idx.ext = sext i32 %47 to i64
  %add.ptr = getelementptr inbounds i32, ptr %46, i64 %idx.ext
  %48 = load i32, ptr %add.ptr, align 4
  store i32 %48, ptr %val2, align 4
  %49 = load i32, ptr %val2, align 4
  call void @printIntLine(i32 noundef %49)
  br label %if.end73

if.else69:                                        ; preds = %land.lhs.true66, %if.then62
  %50 = load ptr, ptr %q, align 8
  %51 = load i32, ptr %off, align 4
  %idx.ext71 = sext i32 %51 to i64
  %add.ptr72 = getelementptr inbounds i32, ptr %50, i64 %idx.ext71
  %52 = load i32, ptr %add.ptr72, align 4
  store i32 %52, ptr %val270, align 4
  %53 = load i32, ptr %val270, align 4
  call void @printIntLine(i32 noundef %53)
  call void @__assert_fail(ptr noundef @.str.6, ptr noundef @.str.7, i32 noundef 89, ptr noundef @__PRETTY_FUNCTION__.benchmark_bad) #6
  unreachable

if.end73:                                         ; preds = %if.then68
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %if.then60
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %if.then56
  br label %if.end76

if.end76:                                         ; preds = %if.end75, %land.lhs.true54, %if.end52
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @printLine(ptr noundef %s) #0 {
entry:
  %s.addr = alloca ptr, align 8
  store ptr %s, ptr %s.addr, align 8
  %0 = load ptr, ptr %s.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %s.addr, align 8
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @printIntLine(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %0)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @benchmark_good() #0 {
entry:
  call void @goodG2B()
  call void @goodB2G()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @printLine(ptr noundef @.str.8)
  call void @benchmark_good()
  call void @printLine(ptr noundef @.str.9)
  call void @printLine(ptr noundef @.str.10)
  call void @benchmark_bad()
  call void @printLine(ptr noundef @.str.11)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 {
entry:
  %arr = alloca [6 x i32], align 16
  %idx = alloca i32, align 4
  %0 = call ptr @memcpy(ptr %arr, ptr @__const.goodG2B.arr, i64 24)
  store i32 3, ptr %idx, align 4
  %1 = load i32, ptr %idx, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, ptr %idx, align 4
  %cmp1 = icmp slt i32 %2, 6
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, ptr %idx, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [6 x i32], ptr %arr, i64 0, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  call void @printIntLine(i32 noundef %4)
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(ptr noundef @.str.14)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodB2G() #0 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %arr1 = alloca [6 x i32], align 16
  %arr2 = alloca [4 x i32], align 16
  %idx = alloca i32, align 4
  %off = alloca i32, align 4
  %0 = call ptr @memcpy(ptr %arr1, ptr @__const.goodB2G.arr1, i64 24)
  %1 = call ptr @memcpy(ptr %arr2, ptr @__const.goodB2G.arr2, i64 16)
  call void @klee_make_symbolic(ptr noundef %a, i64 noundef 4, ptr noundef @.str)
  call void @klee_make_symbolic(ptr noundef %b, i64 noundef 4, ptr noundef @.str.1)
  call void @klee_make_symbolic(ptr noundef %c, i64 noundef 4, ptr noundef @.str.2)
  call void @klee_make_symbolic(ptr noundef %d, i64 noundef 4, ptr noundef @.str.3)
  %2 = load i32, ptr %a, align 4
  %cmp = icmp sge i32 %2, 0
  br i1 %cmp, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, ptr %a, align 4
  %cmp1 = icmp slt i32 %3, 6
  br i1 %cmp1, label %if.then, label %if.end7

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %b, align 4
  %add = add nsw i32 %4, %5
  %6 = load i32, ptr %c, align 4
  %sub = sub nsw i32 %add, %6
  %7 = load i32, ptr %d, align 4
  %add2 = add nsw i32 %sub, %7
  store i32 %add2, ptr %idx, align 4
  %8 = load i32, ptr %idx, align 4
  %cmp3 = icmp sge i32 %8, 0
  br i1 %cmp3, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %if.then
  %9 = load i32, ptr %idx, align 4
  %cmp5 = icmp slt i32 %9, 6
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %land.lhs.true4
  %10 = load i32, ptr %idx, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [6 x i32], ptr %arr1, i64 0, i64 %idxprom
  %11 = load i32, ptr %arrayidx, align 4
  call void @printIntLine(i32 noundef %11)
  br label %if.end

if.else:                                          ; preds = %land.lhs.true4, %if.then
  call void @printLine(ptr noundef @.str.14)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  br label %if.end7

if.end7:                                          ; preds = %if.end, %land.lhs.true, %entry
  %12 = load i32, ptr %d, align 4
  %cmp8 = icmp sge i32 %12, 0
  br i1 %cmp8, label %land.lhs.true9, label %if.end22

land.lhs.true9:                                   ; preds = %if.end7
  %13 = load i32, ptr %d, align 4
  %cmp10 = icmp slt i32 %13, 4
  br i1 %cmp10, label %if.then11, label %if.end22

if.then11:                                        ; preds = %land.lhs.true9
  %14 = load i32, ptr %b, align 4
  %15 = load i32, ptr %c, align 4
  %add12 = add nsw i32 %14, %15
  %16 = load i32, ptr %d, align 4
  %sub13 = sub nsw i32 %add12, %16
  store i32 %sub13, ptr %off, align 4
  %17 = load i32, ptr %off, align 4
  %cmp14 = icmp sge i32 %17, 0
  br i1 %cmp14, label %land.lhs.true15, label %if.else20

land.lhs.true15:                                  ; preds = %if.then11
  %18 = load i32, ptr %off, align 4
  %cmp16 = icmp slt i32 %18, 4
  br i1 %cmp16, label %if.then17, label %if.else20

if.then17:                                        ; preds = %land.lhs.true15
  %19 = load i32, ptr %off, align 4
  %idxprom18 = sext i32 %19 to i64
  %arrayidx19 = getelementptr inbounds [4 x i32], ptr %arr2, i64 0, i64 %idxprom18
  %20 = load i32, ptr %arrayidx19, align 4
  call void @printIntLine(i32 noundef %20)
  br label %if.end21

if.else20:                                        ; preds = %land.lhs.true15, %if.then11
  call void @printLine(ptr noundef @.str.15)
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %if.then17
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %land.lhs.true9, %if.end7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @memcpy(ptr noundef %destaddr, ptr noundef %srcaddr, i64 noundef %len) #4 !dbg !10 {
entry:
  %destaddr.addr = alloca ptr, align 8
  %srcaddr.addr = alloca ptr, align 8
  %len.addr = alloca i64, align 8
  %dest = alloca ptr, align 8
  %src = alloca ptr, align 8
  store ptr %destaddr, ptr %destaddr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %destaddr.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store ptr %srcaddr, ptr %srcaddr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %srcaddr.addr, metadata !23, metadata !DIExpression()), !dbg !24
  store i64 %len, ptr %len.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %len.addr, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata ptr %dest, metadata !27, metadata !DIExpression()), !dbg !30
  %0 = load ptr, ptr %destaddr.addr, align 8, !dbg !31
  store ptr %0, ptr %dest, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata ptr %src, metadata !32, metadata !DIExpression()), !dbg !35
  %1 = load ptr, ptr %srcaddr.addr, align 8, !dbg !36
  store ptr %1, ptr %src, align 8, !dbg !35
  br label %while.cond, !dbg !37

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, ptr %len.addr, align 8, !dbg !38
  %dec = add i64 %2, -1, !dbg !38
  store i64 %dec, ptr %len.addr, align 8, !dbg !38
  %cmp = icmp ugt i64 %2, 0, !dbg !39
  br i1 %cmp, label %while.body, label %while.end, !dbg !37

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr %src, align 8, !dbg !40
  %incdec.ptr = getelementptr inbounds i8, ptr %3, i32 1, !dbg !40
  store ptr %incdec.ptr, ptr %src, align 8, !dbg !40
  %4 = load i8, ptr %3, align 1, !dbg !41
  %5 = load ptr, ptr %dest, align 8, !dbg !42
  %incdec.ptr1 = getelementptr inbounds i8, ptr %5, i32 1, !dbg !42
  store ptr %incdec.ptr1, ptr %dest, align 8, !dbg !42
  store i8 %4, ptr %5, align 1, !dbg !43
  br label %while.cond, !dbg !37, !llvm.loop !44

while.end:                                        ; preds = %while.cond
  %6 = load ptr, ptr %destaddr.addr, align 8, !dbg !46
  ret ptr %6, !dbg !47
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6}
!llvm.ident = !{!7, !7}
!llvm.dbg.cu = !{!8}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 7, !"Dwarf Version", i32 5}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
!8 = distinct !DICompileUnit(language: DW_LANG_C11, file: !9, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!9 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build160stp_z3/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!10 = distinct !DISubprogram(name: "memcpy", scope: !11, file: !11, line: 12, type: !12, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !20)
!11 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!12 = !DISubroutineType(types: !13)
!13 = !{!14, !14, !15, !17}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !19)
!18 = !DIFile(filename: "llvm-160-install_O_D_A/lib/clang/16/include/stddef.h", directory: "/tmp", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!19 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!20 = !{}
!21 = !DILocalVariable(name: "destaddr", arg: 1, scope: !10, file: !11, line: 12, type: !14)
!22 = !DILocation(line: 12, column: 20, scope: !10)
!23 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !10, file: !11, line: 12, type: !15)
!24 = !DILocation(line: 12, column: 42, scope: !10)
!25 = !DILocalVariable(name: "len", arg: 3, scope: !10, file: !11, line: 12, type: !17)
!26 = !DILocation(line: 12, column: 58, scope: !10)
!27 = !DILocalVariable(name: "dest", scope: !10, file: !11, line: 13, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !DILocation(line: 13, column: 9, scope: !10)
!31 = !DILocation(line: 13, column: 16, scope: !10)
!32 = !DILocalVariable(name: "src", scope: !10, file: !11, line: 14, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !29)
!35 = !DILocation(line: 14, column: 15, scope: !10)
!36 = !DILocation(line: 14, column: 21, scope: !10)
!37 = !DILocation(line: 16, column: 3, scope: !10)
!38 = !DILocation(line: 16, column: 13, scope: !10)
!39 = !DILocation(line: 16, column: 16, scope: !10)
!40 = !DILocation(line: 17, column: 19, scope: !10)
!41 = !DILocation(line: 17, column: 15, scope: !10)
!42 = !DILocation(line: 17, column: 10, scope: !10)
!43 = !DILocation(line: 17, column: 13, scope: !10)
!44 = distinct !{!44, !37, !40, !45}
!45 = !{!"llvm.loop.mustprogress"}
!46 = !DILocation(line: 18, column: 10, scope: !10)
!47 = !DILocation(line: 18, column: 3, scope: !10)
