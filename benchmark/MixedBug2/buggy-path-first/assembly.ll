; ModuleID = 'MixedBug2.bc'
source_filename = "MixedBug2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"MixedBug2.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %p = alloca ptr, align 8
  %idx = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @klee_make_symbolic(ptr noundef %a, i64 noundef 4, ptr noundef @.str)
  call void @klee_make_symbolic(ptr noundef %b, i64 noundef 4, ptr noundef @.str.1)
  call void @klee_make_symbolic(ptr noundef %c, i64 noundef 4, ptr noundef @.str.2)
  %0 = load i32, ptr %a, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %a, align 4
  %cmp1 = icmp sgt i32 %1, 10
  br i1 %cmp1, label %if.then2, label %if.end8

if.then2:                                         ; preds = %if.then
  %2 = load i32, ptr %a, align 4
  %cmp3 = icmp sgt i32 %2, 20
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.then2
  %3 = load i32, ptr %a, align 4
  %cmp5 = icmp sgt i32 %3, 30
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then4
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then2
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %entry
  %4 = load i32, ptr %b, align 4
  %cmp10 = icmp sgt i32 %4, 50
  br i1 %cmp10, label %if.then11, label %if.end30

if.then11:                                        ; preds = %if.end9
  %call = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %call, ptr %p, align 8
  %5 = load ptr, ptr %p, align 8
  %tobool = icmp ne ptr %5, null
  br i1 %tobool, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.then11
  store i32 0, ptr %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.then11
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %b, align 4
  %add = add nsw i32 %6, %7
  %8 = load i32, ptr %c, align 4
  %add14 = add nsw i32 %add, %8
  %rem = srem i32 %add14, 20
  store i32 %rem, ptr %idx, align 4
  %9 = load i32, ptr %idx, align 4
  %cmp15 = icmp sge i32 %9, 0
  br i1 %cmp15, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end13
  %10 = load i32, ptr %idx, align 4
  %cmp16 = icmp slt i32 %10, 4
  br i1 %cmp16, label %if.then17, label %if.else

if.then17:                                        ; preds = %land.lhs.true
  %11 = load ptr, ptr %p, align 8
  %12 = load i32, ptr %idx, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds i32, ptr %11, i64 %idxprom
  store i32 1, ptr %arrayidx, align 4
  br label %if.end29

if.else:                                          ; preds = %land.lhs.true, %if.end13
  %13 = load i32, ptr %a, align 4
  %14 = load i32, ptr %b, align 4
  %mul = mul nsw i32 %13, %14
  %15 = load i32, ptr %c, align 4
  %add18 = add nsw i32 %mul, %15
  %rem19 = srem i32 %add18, 7
  %cmp20 = icmp eq i32 %rem19, 0
  br i1 %cmp20, label %if.then21, label %if.end28

if.then21:                                        ; preds = %if.else
  %16 = load i32, ptr %b, align 4
  %17 = load i32, ptr %c, align 4
  %sub = sub nsw i32 %16, %17
  %rem22 = srem i32 %sub, 5
  %cmp23 = icmp eq i32 %rem22, 0
  br i1 %cmp23, label %if.then24, label %if.end27

if.then24:                                        ; preds = %if.then21
  %18 = load ptr, ptr %p, align 8
  %19 = load i32, ptr %idx, align 4
  %idxprom25 = sext i32 %19 to i64
  %arrayidx26 = getelementptr inbounds i32, ptr %18, i64 %idxprom25
  store i32 999, ptr %arrayidx26, align 4
  call void @__assert_fail(ptr noundef @.str.3, ptr noundef @.str.4, i32 noundef 45, ptr noundef @__PRETTY_FUNCTION__.main) #6
  unreachable

if.end27:                                         ; preds = %if.then21
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.else
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.then17
  %20 = load ptr, ptr %p, align 8
  call void @free(ptr noundef %20) #7
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.end9
  %21 = load i32, ptr %c, align 4
  %cmp31 = icmp eq i32 %21, 123456
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end30
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end30
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.then12
  %22 = load i32, ptr %retval, align 4
  ret i32 %22
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
