; ModuleID = 'DeepBug.bc'
source_filename = "DeepBug.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"DeepBug.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @klee_make_symbolic(ptr noundef %x, i64 noundef 4, ptr noundef @.str)
  %0 = load i32, ptr %x, align 4
  %cmp = icmp sgt i32 %0, 100
  br i1 %cmp, label %if.then, label %if.end27

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %x, align 4
  %rem = srem i32 %1, 2
  %cmp1 = icmp eq i32 %rem, 0
  br i1 %cmp1, label %if.then2, label %if.end26

if.then2:                                         ; preds = %if.then
  %2 = load i32, ptr %x, align 4
  %rem3 = srem i32 %2, 3
  %cmp4 = icmp eq i32 %rem3, 0
  br i1 %cmp4, label %if.then5, label %if.end25

if.then5:                                         ; preds = %if.then2
  %3 = load i32, ptr %x, align 4
  %rem6 = srem i32 %3, 5
  %cmp7 = icmp eq i32 %rem6, 0
  br i1 %cmp7, label %if.then8, label %if.end24

if.then8:                                         ; preds = %if.then5
  %4 = load i32, ptr %x, align 4
  %rem9 = srem i32 %4, 7
  %cmp10 = icmp eq i32 %rem9, 0
  br i1 %cmp10, label %if.then11, label %if.end23

if.then11:                                        ; preds = %if.then8
  %5 = load i32, ptr %x, align 4
  %rem12 = srem i32 %5, 11
  %cmp13 = icmp eq i32 %rem12, 0
  br i1 %cmp13, label %if.then14, label %if.end22

if.then14:                                        ; preds = %if.then11
  %6 = load i32, ptr %x, align 4
  %rem15 = srem i32 %6, 13
  %cmp16 = icmp eq i32 %rem15, 0
  br i1 %cmp16, label %if.then17, label %if.end21

if.then17:                                        ; preds = %if.then14
  %7 = load i32, ptr %x, align 4
  %rem18 = srem i32 %7, 17
  %cmp19 = icmp eq i32 %rem18, 0
  br i1 %cmp19, label %if.then20, label %if.end

if.then20:                                        ; preds = %if.then17
  call void @__assert_fail(ptr noundef @.str.1, ptr noundef @.str.2, i32 noundef 16, ptr noundef @__PRETTY_FUNCTION__.main) #3
  unreachable

if.end:                                           ; preds = %if.then17
  br label %if.end21

if.end21:                                         ; preds = %if.end, %if.then14
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then11
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then8
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then5
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.then2
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.then
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %entry
  ret i32 0
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
