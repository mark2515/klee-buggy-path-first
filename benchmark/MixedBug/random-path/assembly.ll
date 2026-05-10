; ModuleID = 'MixedBug.bc'
source_filename = "MixedBug.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@__const.main.arr = private unnamed_addr constant [4 x i32] [i32 1, i32 2, i32 3, i32 4], align 16
@.str.4 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"MixedBug.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.6 = private unnamed_addr constant [54 x i8] c"/tmp/klee_src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1, !dbg !0
@.str.1.7 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1, !dbg !8
@.str.2.8 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1, !dbg !13

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %arr = alloca [4 x i32], align 16
  %p = alloca ptr, align 8
  %idx = alloca i32, align 4
  %val = alloca i32, align 4
  %val49 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @klee_make_symbolic(ptr noundef %a, i64 noundef 4, ptr noundef @.str)
  call void @klee_make_symbolic(ptr noundef %b, i64 noundef 4, ptr noundef @.str.1)
  call void @klee_make_symbolic(ptr noundef %c, i64 noundef 4, ptr noundef @.str.2)
  call void @klee_make_symbolic(ptr noundef %d, i64 noundef 4, ptr noundef @.str.3)
  %0 = call ptr @memcpy(ptr %arr, ptr @__const.main.arr, i64 16)
  %1 = load i32, ptr %a, align 4
  %cmp = icmp sgt i32 %1, 10
  br i1 %cmp, label %if.then, label %if.end27

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %b, align 4
  %cmp1 = icmp sgt i32 %2, 20
  br i1 %cmp1, label %if.then2, label %if.end26

if.then2:                                         ; preds = %if.then
  %3 = load i32, ptr %c, align 4
  %cmp3 = icmp sgt i32 %3, 30
  br i1 %cmp3, label %if.then4, label %if.end25

if.then4:                                         ; preds = %if.then2
  %4 = load i32, ptr %d, align 4
  %cmp5 = icmp sgt i32 %4, 40
  br i1 %cmp5, label %if.then6, label %if.end24

if.then6:                                         ; preds = %if.then4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %b, align 4
  %7 = load i32, ptr %c, align 4
  %mul = mul nsw i32 %6, %7
  %add = add nsw i32 %5, %mul
  %rem = srem i32 %add, 7
  %cmp7 = icmp eq i32 %rem, 0
  br i1 %cmp7, label %if.then8, label %if.end23

if.then8:                                         ; preds = %if.then6
  %8 = load i32, ptr %b, align 4
  %9 = load i32, ptr %d, align 4
  %sub = sub nsw i32 %8, %9
  %rem9 = srem i32 %sub, 5
  %cmp10 = icmp eq i32 %rem9, 0
  br i1 %cmp10, label %if.then11, label %if.end22

if.then11:                                        ; preds = %if.then8
  %10 = load i32, ptr %c, align 4
  %11 = load i32, ptr %d, align 4
  %mul12 = mul nsw i32 %10, %11
  %rem13 = srem i32 %mul12, 3
  %cmp14 = icmp eq i32 %rem13, 0
  br i1 %cmp14, label %if.then15, label %if.end21

if.then15:                                        ; preds = %if.then11
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %b, align 4
  %mul16 = mul nsw i32 %12, %13
  %14 = load i32, ptr %c, align 4
  %mul17 = mul nsw i32 %mul16, %14
  %15 = load i32, ptr %d, align 4
  %mul18 = mul nsw i32 %mul17, %15
  %cmp19 = icmp eq i32 %mul18, 0
  br i1 %cmp19, label %if.then20, label %if.end

if.then20:                                        ; preds = %if.then15
  call void @__assert_fail(ptr noundef @.str.4, ptr noundef @.str.5, i32 noundef 22, ptr noundef @__PRETTY_FUNCTION__.main) #7
  unreachable

if.end:                                           ; preds = %if.then15
  br label %if.end21

if.end21:                                         ; preds = %if.end, %if.then11
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then8
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then6
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then4
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.then2
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.then
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %entry
  %16 = load i32, ptr %a, align 4
  %cmp28 = icmp sge i32 %16, 0
  br i1 %cmp28, label %land.lhs.true, label %if.end59

land.lhs.true:                                    ; preds = %if.end27
  %17 = load i32, ptr %a, align 4
  %cmp29 = icmp slt i32 %17, 10
  br i1 %cmp29, label %if.then30, label %if.end59

if.then30:                                        ; preds = %land.lhs.true
  %18 = load i32, ptr %a, align 4
  %idxprom = sext i32 %18 to i64
  %arrayidx = getelementptr inbounds [4 x i32], ptr %arr, i64 0, i64 %idxprom
  store ptr %arrayidx, ptr %p, align 8
  %19 = load i32, ptr %b, align 4
  %cmp31 = icmp sgt i32 %19, 5
  br i1 %cmp31, label %if.then32, label %if.end58

if.then32:                                        ; preds = %if.then30
  %20 = load i32, ptr %c, align 4
  %cmp33 = icmp eq i32 %20, 100
  br i1 %cmp33, label %if.then34, label %if.end57

if.then34:                                        ; preds = %if.then32
  %21 = load i32, ptr %d, align 4
  %cmp35 = icmp slt i32 %21, 0
  br i1 %cmp35, label %if.then36, label %if.end56

if.then36:                                        ; preds = %if.then34
  %22 = load i32, ptr %a, align 4
  %23 = load i32, ptr %b, align 4
  %add37 = add nsw i32 %22, %23
  %24 = load i32, ptr %c, align 4
  %add38 = add nsw i32 %add37, %24
  %25 = load i32, ptr %d, align 4
  %add39 = add nsw i32 %add38, %25
  store i32 %add39, ptr %idx, align 4
  %26 = load i32, ptr %idx, align 4
  %cmp40 = icmp sge i32 %26, 0
  br i1 %cmp40, label %land.lhs.true41, label %if.else

land.lhs.true41:                                  ; preds = %if.then36
  %27 = load i32, ptr %idx, align 4
  %cmp42 = icmp slt i32 %27, 4
  br i1 %cmp42, label %if.then43, label %if.else

if.then43:                                        ; preds = %land.lhs.true41
  %28 = load i32, ptr %idx, align 4
  %idxprom44 = sext i32 %28 to i64
  %arrayidx45 = getelementptr inbounds [4 x i32], ptr %arr, i64 0, i64 %idxprom44
  %29 = load i32, ptr %arrayidx45, align 4
  store i32 %29, ptr %val, align 4
  %30 = load i32, ptr %val, align 4
  %cmp46 = icmp eq i32 %30, 999
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.then43
  call void @__assert_fail(ptr noundef @.str.4, ptr noundef @.str.5, i32 noundef 44, ptr noundef @__PRETTY_FUNCTION__.main) #7
  unreachable

if.end48:                                         ; preds = %if.then43
  br label %if.end55

if.else:                                          ; preds = %land.lhs.true41, %if.then36
  %31 = load i32, ptr %idx, align 4
  %idxprom50 = sext i32 %31 to i64
  %arrayidx51 = getelementptr inbounds [4 x i32], ptr %arr, i64 0, i64 %idxprom50
  %32 = load i32, ptr %arrayidx51, align 4
  store i32 %32, ptr %val49, align 4
  %33 = load i32, ptr %val49, align 4
  %cmp52 = icmp eq i32 %33, 123
  br i1 %cmp52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.else
  call void @__assert_fail(ptr noundef @.str.4, ptr noundef @.str.5, i32 noundef 49, ptr noundef @__PRETTY_FUNCTION__.main) #7
  unreachable

if.end54:                                         ; preds = %if.else
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.end48
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.then34
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.then32
  br label %if.end58

if.end58:                                         ; preds = %if.end57, %if.then30
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %land.lhs.true, %if.end27
  %34 = load i32, ptr %a, align 4
  %35 = load i32, ptr %b, align 4
  %xor = xor i32 %34, %35
  %cmp60 = icmp sgt i32 %xor, 100
  br i1 %cmp60, label %if.then61, label %if.end82

if.then61:                                        ; preds = %if.end59
  %36 = load i32, ptr %c, align 4
  %37 = load i32, ptr %d, align 4
  %or = or i32 %36, %37
  %cmp62 = icmp slt i32 %or, 50
  br i1 %cmp62, label %if.then63, label %if.end81

if.then63:                                        ; preds = %if.then61
  %38 = load i32, ptr %a, align 4
  %39 = load i32, ptr %c, align 4
  %and = and i32 %38, %39
  %40 = load i32, ptr %b, align 4
  %41 = load i32, ptr %d, align 4
  %and64 = and i32 %40, %41
  %cmp65 = icmp eq i32 %and, %and64
  br i1 %cmp65, label %if.then66, label %if.end80

if.then66:                                        ; preds = %if.then63
  %42 = load i32, ptr %a, align 4
  %43 = load i32, ptr %b, align 4
  %add67 = add nsw i32 %42, %43
  %44 = load i32, ptr %c, align 4
  %add68 = add nsw i32 %add67, %44
  %45 = load i32, ptr %d, align 4
  %add69 = add nsw i32 %add68, %45
  %rem70 = srem i32 %add69, 11
  %cmp71 = icmp eq i32 %rem70, 0
  br i1 %cmp71, label %if.then72, label %if.end79

if.then72:                                        ; preds = %if.then66
  %46 = load i32, ptr %a, align 4
  %47 = load i32, ptr %d, align 4
  %mul73 = mul nsw i32 %46, %47
  %48 = load i32, ptr %b, align 4
  %49 = load i32, ptr %c, align 4
  %mul74 = mul nsw i32 %48, %49
  %sub75 = sub nsw i32 %mul73, %mul74
  %cmp76 = icmp eq i32 %sub75, 777
  br i1 %cmp76, label %if.then77, label %if.end78

if.then77:                                        ; preds = %if.then72
  br label %if.end78

if.end78:                                         ; preds = %if.then77, %if.then72
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %if.then66
  br label %if.end80

if.end80:                                         ; preds = %if.end79, %if.then63
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %if.then61
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %if.end59
  %50 = load i32, ptr %a, align 4
  %cmp83 = icmp eq i32 %50, 42
  br i1 %cmp83, label %if.then84, label %if.end96

if.then84:                                        ; preds = %if.end82
  %51 = load i32, ptr %b, align 4
  %52 = load i32, ptr %c, align 4
  %cmp85 = icmp eq i32 %51, %52
  br i1 %cmp85, label %if.then86, label %if.end95

if.then86:                                        ; preds = %if.then84
  %53 = load i32, ptr %d, align 4
  %cmp87 = icmp ne i32 %53, 0
  br i1 %cmp87, label %if.then88, label %if.end94

if.then88:                                        ; preds = %if.then86
  %54 = load i32, ptr %a, align 4
  %55 = load i32, ptr %b, align 4
  %add89 = add nsw i32 %54, %55
  %56 = load i32, ptr %d, align 4
  %57 = load i32, ptr %d, align 4
  %sub90 = sub nsw i32 %56, %57
  %int_cast_to_i64 = zext i32 %sub90 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %div = sdiv i32 %add89, %sub90, !klee.check.div !31
  store i32 %div, ptr %x, align 4
  %58 = load i32, ptr %x, align 4
  %cmp91 = icmp eq i32 %58, 1
  br i1 %cmp91, label %if.then92, label %if.end93

if.then92:                                        ; preds = %if.then88
  call void @__assert_fail(ptr noundef @.str.4, ptr noundef @.str.5, i32 noundef 76, ptr noundef @__PRETTY_FUNCTION__.main) #7
  unreachable

if.end93:                                         ; preds = %if.then88
  br label %if.end94

if.end94:                                         ; preds = %if.end93, %if.then86
  br label %if.end95

if.end95:                                         ; preds = %if.end94, %if.then84
  br label %if.end96

if.end96:                                         ; preds = %if.end95, %if.end82
  ret i32 0
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @memcpy(ptr noundef %destaddr, ptr noundef %srcaddr, i64 noundef %len) #4 !dbg !32 {
entry:
  %destaddr.addr = alloca ptr, align 8
  %srcaddr.addr = alloca ptr, align 8
  %len.addr = alloca i64, align 8
  %dest = alloca ptr, align 8
  %src = alloca ptr, align 8
  store ptr %destaddr, ptr %destaddr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %destaddr.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store ptr %srcaddr, ptr %srcaddr.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %srcaddr.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i64 %len, ptr %len.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %len.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %dest, metadata !49, metadata !DIExpression()), !dbg !51
  %0 = load ptr, ptr %destaddr.addr, align 8, !dbg !52
  store ptr %0, ptr %dest, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %src, metadata !53, metadata !DIExpression()), !dbg !55
  %1 = load ptr, ptr %srcaddr.addr, align 8, !dbg !56
  store ptr %1, ptr %src, align 8, !dbg !55
  br label %while.cond, !dbg !57

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, ptr %len.addr, align 8, !dbg !58
  %dec = add i64 %2, -1, !dbg !58
  store i64 %dec, ptr %len.addr, align 8, !dbg !58
  %cmp = icmp ugt i64 %2, 0, !dbg !59
  br i1 %cmp, label %while.body, label %while.end, !dbg !57

while.body:                                       ; preds = %while.cond
  %3 = load ptr, ptr %src, align 8, !dbg !60
  %incdec.ptr = getelementptr inbounds i8, ptr %3, i32 1, !dbg !60
  store ptr %incdec.ptr, ptr %src, align 8, !dbg !60
  %4 = load i8, ptr %3, align 1, !dbg !61
  %5 = load ptr, ptr %dest, align 8, !dbg !62
  %incdec.ptr1 = getelementptr inbounds i8, ptr %5, i32 1, !dbg !62
  store ptr %incdec.ptr1, ptr %dest, align 8, !dbg !62
  store i8 %4, ptr %5, align 1, !dbg !63
  br label %while.cond, !dbg !57, !llvm.loop !64

while.end:                                        ; preds = %while.cond
  %6 = load ptr, ptr %destaddr.addr, align 8, !dbg !66
  ret ptr %6, !dbg !67
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_div_zero_check(i64 noundef %z) #4 !dbg !68 {
entry:
  %z.addr = alloca i64, align 8
  store i64 %z, ptr %z.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %z.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load i64, ptr %z.addr, align 8, !dbg !74
  %cmp = icmp eq i64 %0, 0, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.6, i32 noundef 14, ptr noundef @.str.1.7, ptr noundef @.str.2.8) #8, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  ret void, !dbg !79
}

; Function Attrs: noreturn
declare void @klee_report_error(ptr noundef, i32 noundef, ptr noundef, ptr noundef) #6

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind }
attributes #8 = { noreturn }

!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25, !25, !25}
!llvm.dbg.cu = !{!26, !28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "klee_src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "ac97458b4bebcea5cefe50ebb216db13")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 432, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 54)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 15)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !15, isLocal: true, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 8)
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 8, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 2}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{!"clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)"}
!26 = distinct !DICompileUnit(language: DW_LANG_C11, file: !27, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!27 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build160stp_z3/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!28 = distinct !DICompileUnit(language: DW_LANG_C89, file: !29, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !30, splitDebugInlining: false, nameTableKind: None)
!29 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/tmp/klee_build160stp_z3/runtime/Intrinsic", checksumkind: CSK_MD5, checksum: "ac97458b4bebcea5cefe50ebb216db13")
!30 = !{!0, !8, !13}
!31 = !{!"True"}
!32 = distinct !DISubprogram(name: "memcpy", scope: !33, file: !33, line: 12, type: !34, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !26, retainedNodes: !42)
!33 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!34 = !DISubroutineType(types: !35)
!35 = !{!36, !36, !37, !39}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "llvm-160-install_O_D_A/lib/clang/16/include/stddef.h", directory: "/tmp", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !{}
!43 = !DILocalVariable(name: "destaddr", arg: 1, scope: !32, file: !33, line: 12, type: !36)
!44 = !DILocation(line: 12, column: 20, scope: !32)
!45 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !32, file: !33, line: 12, type: !37)
!46 = !DILocation(line: 12, column: 42, scope: !32)
!47 = !DILocalVariable(name: "len", arg: 3, scope: !32, file: !33, line: 12, type: !39)
!48 = !DILocation(line: 12, column: 58, scope: !32)
!49 = !DILocalVariable(name: "dest", scope: !32, file: !33, line: 13, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!51 = !DILocation(line: 13, column: 9, scope: !32)
!52 = !DILocation(line: 13, column: 16, scope: !32)
!53 = !DILocalVariable(name: "src", scope: !32, file: !33, line: 14, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocation(line: 14, column: 15, scope: !32)
!56 = !DILocation(line: 14, column: 21, scope: !32)
!57 = !DILocation(line: 16, column: 3, scope: !32)
!58 = !DILocation(line: 16, column: 13, scope: !32)
!59 = !DILocation(line: 16, column: 16, scope: !32)
!60 = !DILocation(line: 17, column: 19, scope: !32)
!61 = !DILocation(line: 17, column: 15, scope: !32)
!62 = !DILocation(line: 17, column: 10, scope: !32)
!63 = !DILocation(line: 17, column: 13, scope: !32)
!64 = distinct !{!64, !57, !60, !65}
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 18, column: 10, scope: !32)
!67 = !DILocation(line: 18, column: 3, scope: !32)
!68 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2, file: !2, line: 12, type: !69, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !42)
!69 = !DISubroutineType(types: !70)
!70 = !{null, !71}
!71 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!72 = !DILocalVariable(name: "z", arg: 1, scope: !68, file: !2, line: 12, type: !71)
!73 = !DILocation(line: 12, column: 36, scope: !68)
!74 = !DILocation(line: 13, column: 7, scope: !75)
!75 = distinct !DILexicalBlock(scope: !68, file: !2, line: 13, column: 7)
!76 = !DILocation(line: 13, column: 9, scope: !75)
!77 = !DILocation(line: 13, column: 7, scope: !68)
!78 = !DILocation(line: 14, column: 5, scope: !75)
!79 = !DILocation(line: 15, column: 1, scope: !68)
