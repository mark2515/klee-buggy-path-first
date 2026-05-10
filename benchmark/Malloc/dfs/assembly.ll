; ModuleID = 'Malloc.bc'
source_filename = "Malloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"n\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %arr = alloca ptr, align 8
  store i32 0, ptr %retval, align 4
  call void @klee_make_symbolic(ptr noundef %n, i64 noundef 4, ptr noundef @.str)
  %0 = load i32, ptr %n, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end8

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, ptr %n, align 4
  %cmp1 = icmp slt i32 %1, 10
  br i1 %cmp1, label %if.then, label %if.end8

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, ptr %n, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 %conv, 4
  %call = call noalias ptr @malloc(i64 noundef %mul) #4
  store ptr %call, ptr %arr, align 8
  %3 = load ptr, ptr %arr, align 8
  %tobool = icmp ne ptr %3, null
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %4 = load ptr, ptr %arr, align 8
  %arrayidx = getelementptr inbounds i32, ptr %4, i64 0
  store i32 1, ptr %arrayidx, align 4
  %5 = load i32, ptr %n, align 4
  %cmp3 = icmp sgt i32 %5, 5
  br i1 %cmp3, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %6 = load ptr, ptr %arr, align 8
  %arrayidx6 = getelementptr inbounds i32, ptr %6, i64 10
  store i32 42, ptr %arrayidx6, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %7 = load ptr, ptr %arr, align 8
  call void @free(ptr noundef %7) #5
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %land.lhs.true, %entry
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then2
  %8 = load i32, ptr %retval, align 4
  ret i32 %8
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
