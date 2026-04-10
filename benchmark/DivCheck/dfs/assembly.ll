; ModuleID = 'DivCheck.bc'
source_filename = "DivCheck.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"/tmp/klee_src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1, !dbg !8
@.str.2 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1, !dbg !13

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @klee_make_symbolic(ptr noundef %x, i64 noundef 4, ptr noundef @.str)
  %0 = load i32, ptr %x, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %x, align 4
  %int_cast_to_i64 = zext i32 %1 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %div = sdiv i32 10, %1, !klee.check.div !29
  store i32 %div, ptr %y, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_div_zero_check(i64 noundef %z) #2 !dbg !30 {
entry:
  %z.addr = alloca i64, align 8
  store i64 %z, ptr %z.addr, align 8
  call void @llvm.dbg.declare(metadata ptr %z.addr, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load i64, ptr %z.addr, align 8, !dbg !37
  %cmp = icmp eq i64 %0, 0, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @klee_report_error(ptr noundef @.str.3, i32 noundef 14, ptr noundef @.str.1, ptr noundef @.str.2) #5, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  ret void, !dbg !42
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: noreturn
declare void @klee_report_error(ptr noundef, i32 noundef, ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }

!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25, !25}
!llvm.dbg.cu = !{!26}

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
!26 = distinct !DICompileUnit(language: DW_LANG_C89, file: !27, producer: "clang version 16.0.6 (https://github.com/llvm/llvm-project.git 7cbf1a2591520c2491aa35339f227775f4d3adf6)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !28, splitDebugInlining: false, nameTableKind: None)
!27 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/tmp/klee_build160stp_z3/runtime/Intrinsic", checksumkind: CSK_MD5, checksum: "ac97458b4bebcea5cefe50ebb216db13")
!28 = !{!0, !8, !13}
!29 = !{!"True"}
!30 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2, file: !2, line: 12, type: !31, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !26, retainedNodes: !34)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !33}
!33 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!34 = !{}
!35 = !DILocalVariable(name: "z", arg: 1, scope: !30, file: !2, line: 12, type: !33)
!36 = !DILocation(line: 12, column: 36, scope: !30)
!37 = !DILocation(line: 13, column: 7, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !2, line: 13, column: 7)
!39 = !DILocation(line: 13, column: 9, scope: !38)
!40 = !DILocation(line: 13, column: 7, scope: !30)
!41 = !DILocation(line: 14, column: 5, scope: !38)
!42 = !DILocation(line: 15, column: 1, scope: !30)
