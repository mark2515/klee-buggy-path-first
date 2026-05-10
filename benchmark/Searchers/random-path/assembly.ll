; ModuleID = 'Searchers.bc'
source_filename = "Searchers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"Searchers.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @klee_make_symbolic(ptr noundef %x, i64 noundef 4, ptr noundef @.str)
  %0 = load i32, ptr %x, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %x, align 4
  %cmp1 = icmp sgt i32 %1, 10
  br i1 %cmp1, label %if.then2, label %if.end8

if.then2:                                         ; preds = %if.then
  %2 = load i32, ptr %x, align 4
  %cmp3 = icmp sgt i32 %2, 20
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.then2
  %3 = load i32, ptr %x, align 4
  %cmp5 = icmp sgt i32 %3, 30
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then4
  call void @__assert_fail(ptr noundef @.str.1, ptr noundef @.str.2, i32 noundef 12, ptr noundef @__PRETTY_FUNCTION__.main) #3
  unreachable

if.end:                                           ; preds = %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then2
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %entry
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
