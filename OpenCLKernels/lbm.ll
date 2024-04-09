; ModuleID = './OpenCLKernels/lbm.bc'
source_filename = "parallel_bc"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32"

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #0

; Function Attrs: alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @_pocl_kernel_performStreamCollide_kernel(ptr nocapture noundef readonly align 4 %0, ptr nocapture noundef writeonly align 4 %1, ptr nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #1 !kernel_arg_addr_space !28 !kernel_arg_access_qual !29 !kernel_arg_type !30 !kernel_arg_base_type !30 !kernel_arg_type_qual !31 !kernel_arg_name !32 !pocl_generated !33 {
  %7 = getelementptr inbounds { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %2, i32 0, i32 2
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %2, i32 0, i32 2, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = getelementptr { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %2, i32 0, i32 2, i32 2
  %12 = load i32, ptr %11, align 4
  %add.ptr.i = getelementptr inbounds float, ptr %0, i32 51200
  %mul.i = mul nsw i32 %3, 40
  %mul8.i = mul i32 %4, 1280
  %mul14.i = add i32 %mul.i, -40
  %mul25.i = add i32 %mul.i, 40
  %mul62.i = add i32 %mul8.i, -1280
  %mul73.i = add i32 %mul8.i, 1280
  %add81.i = add i32 %mul8.i, %mul14.i
  %add103.i = add i32 %mul8.i, %mul25.i
  %add.ptr1.i = getelementptr inbounds float, ptr %1, i32 51200
  %umax = call i32 @llvm.umax.i32(i32 %8, i32 1)
  %umax1 = call i32 @llvm.umax.i32(i32 %10, i32 1)
  %umax3 = call i32 @llvm.umax.i32(i32 %12, i32 1)
  br label %pregion_for_entry.pregion_for_init433.i

pregion_for_entry.pregion_for_init433.i:          ; preds = %pregion_for_end430.i, %6
  %_local_id_z.0 = phi i32 [ 0, %6 ], [ %110, %pregion_for_end430.i ]
  br label %pregion_for_entry.pregion_for_init.i

pregion_for_entry.pregion_for_init.i:             ; preds = %pregion_for_end.i, %pregion_for_entry.pregion_for_init433.i
  %_local_id_y.0 = phi i32 [ 0, %pregion_for_entry.pregion_for_init433.i ], [ %111, %pregion_for_end.i ]
  br label %pregion_for_entry.entry.i

pregion_for_entry.entry.i:                        ; preds = %if.end419.r_exit.i, %pregion_for_entry.pregion_for_init.i
  %_local_id_x.0 = phi i32 [ 0, %pregion_for_entry.pregion_for_init.i ], [ %add45.i, %if.end419.r_exit.i ]
  %add5.i = add nsw i32 %_local_id_x.0, %mul.i
  %add9.i = add nsw i32 %add5.i, %mul8.i
  %mul10.i = mul nsw i32 %add9.i, 20
  %arrayidx.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %mul10.i
  %13 = load float, ptr %arrayidx.i, align 4, !tbaa !34, !llvm.access.group !38
  %add15.i = add nsw i32 %_local_id_x.0, %mul14.i
  %add19.i = add nsw i32 %add15.i, %mul8.i
  %mul20.i = mul nsw i32 %add19.i, 20
  %add21.i = or i32 %mul20.i, 1
  %arrayidx22.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add21.i
  %14 = load float, ptr %arrayidx22.i, align 4, !tbaa !34, !llvm.access.group !38
  %add26.i = add nsw i32 %_local_id_x.0, %mul25.i
  %add30.i = add nsw i32 %add26.i, %mul8.i
  %mul31.i = mul nsw i32 %add30.i, 20
  %add32.i = or i32 %mul31.i, 2
  %arrayidx33.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add32.i
  %15 = load float, ptr %arrayidx33.i, align 4, !tbaa !34, !llvm.access.group !38
  %add34.i = add nsw i32 %_local_id_x.0, -1
  %add37.i = add nsw i32 %add34.i, %mul.i
  %add41.i = add nsw i32 %add37.i, %mul8.i
  %mul42.i = mul nsw i32 %add41.i, 20
  %add43.i = or i32 %mul42.i, 3
  %arrayidx44.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add43.i
  %16 = load float, ptr %arrayidx44.i, align 4, !tbaa !34, !llvm.access.group !38
  %add45.i = add nuw nsw i32 %_local_id_x.0, 1
  %add48.i = add nsw i32 %add45.i, %mul.i
  %add52.i = add nsw i32 %add48.i, %mul8.i
  %mul53.i = mul nsw i32 %add52.i, 20
  %add54.i = add nsw i32 %mul53.i, 4
  %arrayidx55.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add54.i
  %17 = load float, ptr %arrayidx55.i, align 4, !tbaa !34, !llvm.access.group !38
  %add63.i = add nsw i32 %add5.i, %mul62.i
  %mul64.i = mul nsw i32 %add63.i, 20
  %add65.i = add nsw i32 %mul64.i, 5
  %arrayidx66.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add65.i
  %18 = load float, ptr %arrayidx66.i, align 4, !tbaa !34, !llvm.access.group !38
  %add74.i = add nsw i32 %add5.i, %mul73.i
  %mul75.i = mul nsw i32 %add74.i, 20
  %add76.i = add nsw i32 %mul75.i, 6
  %arrayidx77.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add76.i
  %19 = load float, ptr %arrayidx77.i, align 4, !tbaa !34, !llvm.access.group !38
  %add85.i = add i32 %add34.i, %add81.i
  %mul86.i = mul nsw i32 %add85.i, 20
  %add87.i = add nsw i32 %mul86.i, 7
  %arrayidx88.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add87.i
  %20 = load float, ptr %arrayidx88.i, align 4, !tbaa !34, !llvm.access.group !38
  %add96.i = add i32 %add45.i, %add81.i
  %mul97.i = mul nsw i32 %add96.i, 20
  %add98.i = add nsw i32 %mul97.i, 8
  %arrayidx99.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add98.i
  %21 = load float, ptr %arrayidx99.i, align 4, !tbaa !34, !llvm.access.group !38
  %add107.i = add i32 %add34.i, %add103.i
  %mul108.i = mul nsw i32 %add107.i, 20
  %add109.i = add nsw i32 %mul108.i, 9
  %arrayidx110.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add109.i
  %22 = load float, ptr %arrayidx110.i, align 4, !tbaa !34, !llvm.access.group !38
  %add118.i = add i32 %add45.i, %add103.i
  %mul119.i = mul nsw i32 %add118.i, 20
  %add120.i = add nsw i32 %mul119.i, 10
  %arrayidx121.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add120.i
  %23 = load float, ptr %arrayidx121.i, align 4, !tbaa !34, !llvm.access.group !38
  %add129.i = add nsw i32 %add15.i, %mul62.i
  %mul130.i = mul nsw i32 %add129.i, 20
  %add131.i = add nsw i32 %mul130.i, 11
  %arrayidx132.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add131.i
  %24 = load float, ptr %arrayidx132.i, align 4, !tbaa !34, !llvm.access.group !38
  %add140.i = add nsw i32 %add15.i, %mul73.i
  %mul141.i = mul nsw i32 %add140.i, 20
  %add142.i = add nsw i32 %mul141.i, 12
  %arrayidx143.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add142.i
  %25 = load float, ptr %arrayidx143.i, align 4, !tbaa !34, !llvm.access.group !38
  %add151.i = add nsw i32 %add26.i, %mul62.i
  %mul152.i = mul nsw i32 %add151.i, 20
  %add153.i = add nsw i32 %mul152.i, 13
  %arrayidx154.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add153.i
  %26 = load float, ptr %arrayidx154.i, align 4, !tbaa !34, !llvm.access.group !38
  %add162.i = add nsw i32 %add26.i, %mul73.i
  %mul163.i = mul nsw i32 %add162.i, 20
  %add164.i = add nsw i32 %mul163.i, 14
  %arrayidx165.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add164.i
  %27 = load float, ptr %arrayidx165.i, align 4, !tbaa !34, !llvm.access.group !38
  %add173.i = add nsw i32 %add37.i, %mul62.i
  %mul174.i = mul nsw i32 %add173.i, 20
  %add175.i = add nsw i32 %mul174.i, 15
  %arrayidx176.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add175.i
  %28 = load float, ptr %arrayidx176.i, align 4, !tbaa !34, !llvm.access.group !38
  %add184.i = add nsw i32 %add37.i, %mul73.i
  %mul185.i = mul nsw i32 %add184.i, 20
  %add186.i = add nsw i32 %mul185.i, 16
  %arrayidx187.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add186.i
  %29 = load float, ptr %arrayidx187.i, align 4, !tbaa !34, !llvm.access.group !38
  %add195.i = add nsw i32 %add48.i, %mul62.i
  %mul196.i = mul nsw i32 %add195.i, 20
  %add197.i = add nsw i32 %mul196.i, 17
  %arrayidx198.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add197.i
  %30 = load float, ptr %arrayidx198.i, align 4, !tbaa !34, !llvm.access.group !38
  %add206.i = add nsw i32 %add48.i, %mul73.i
  %mul207.i = mul nsw i32 %add206.i, 20
  %add208.i = add nsw i32 %mul207.i, 18
  %arrayidx209.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add208.i
  %31 = load float, ptr %arrayidx209.i, align 4, !tbaa !34, !llvm.access.group !38
  %add219.i = add nsw i32 %mul10.i, 19
  %arrayidx220.i = getelementptr inbounds float, ptr %add.ptr.i, i32 %add219.i
  %32 = load i32, ptr %arrayidx220.i, align 4, !tbaa !34, !llvm.access.group !38
  %and.i = and i32 %32, 1
  %tobool.not.i = icmp eq i32 %and.i, 0
  br i1 %tobool.not.i, label %if.else.i, label %if.end419.r_exit.i

if.else.i:                                        ; preds = %pregion_for_entry.entry.i
  %add221.i = fadd float %13, %14
  %add222.i = fadd float %add221.i, %15
  %add223.i = fadd float %add222.i, %16
  %add224.i = fadd float %add223.i, %17
  %add225.i = fadd float %add224.i, %18
  %add226.i = fadd float %add225.i, %19
  %add227.i = fadd float %add226.i, %20
  %add228.i = fadd float %add227.i, %21
  %add229.i = fadd float %add228.i, %22
  %add230.i = fadd float %add229.i, %23
  %add231.i = fadd float %add230.i, %24
  %add232.i = fadd float %add231.i, %25
  %add233.i = fadd float %add232.i, %26
  %add234.i = fadd float %add233.i, %27
  %add235.i = fadd float %add234.i, %28
  %add236.i = fadd float %add235.i, %29
  %add237.i = fadd float %add236.i, %30
  %add238.i = fadd float %add237.i, %31
  %sub.i = fsub float %16, %17
  %add239.i = fadd float %sub.i, %20
  %sub240.i = fsub float %add239.i, %21
  %add241.i = fadd float %sub240.i, %22
  %sub242.i = fsub float %add241.i, %23
  %add243.i = fadd float %sub242.i, %28
  %add244.i = fadd float %add243.i, %29
  %sub245.i = fsub float %add244.i, %30
  %sub246.i = fsub float %sub245.i, %31
  %sub247.i = fsub float %14, %15
  %add248.i = fadd float %sub247.i, %20
  %add249.i = fadd float %add248.i, %21
  %sub250.i = fsub float %add249.i, %22
  %sub251.i = fsub float %sub250.i, %23
  %add252.i = fadd float %sub251.i, %24
  %add253.i = fadd float %add252.i, %25
  %sub254.i = fsub float %add253.i, %26
  %sub255.i = fsub float %sub254.i, %27
  %sub256.i = fsub float %18, %19
  %add257.i = fadd float %sub256.i, %24
  %sub258.i = fsub float %add257.i, %25
  %add259.i = fadd float %sub258.i, %26
  %sub260.i = fsub float %add259.i, %27
  %add261.i = fadd float %sub260.i, %28
  %sub262.i = fsub float %add261.i, %29
  %add263.i = fadd float %sub262.i, %30
  %sub264.i = fsub float %add263.i, %31
  %div.i = fdiv float %sub246.i, %add238.i, !fpmath !42
  %div265.i = fdiv float %sub255.i, %add238.i, !fpmath !42
  %div266.i = fdiv float %sub264.i, %add238.i, !fpmath !42
  %and279.i = and i32 %32, 2
  %tobool280.not.i = icmp eq i32 %and279.i, 0
  %ux.0.i = select i1 %tobool280.not.i, float %div.i, float 0x3F747AE140000000
  %uy.0.i = select i1 %tobool280.not.i, float %div265.i, float 0x3F60624DE0000000
  %uz.0.i = select i1 %tobool280.not.i, float %div266.i, float 0.000000e+00
  %mul283.i = fmul float %uy.0.i, %uy.0.i
  %33 = tail call float @llvm.fmuladd.f32(float %ux.0.i, float %ux.0.i, float %mul283.i)
  %34 = tail call float @llvm.fmuladd.f32(float %uz.0.i, float %uz.0.i, float %33)
  %35 = tail call float @llvm.fmuladd.f32(float %34, float 1.500000e+00, float -1.000000e+00)
  %mul286.i = fmul float %add238.i, 0x3FFF333340000000
  %mul289.i = fmul float %mul286.i, 0x3FD5555560000000
  %fneg.i = fneg float %35
  %mul291.i = fmul float %mul289.i, %fneg.i
  %36 = tail call float @llvm.fmuladd.f32(float %13, float 0xBFEE666680000000, float %mul291.i)
  %mul292.i = fmul float %mul286.i, 0x3FAC71C720000000
  %37 = tail call float @llvm.fmuladd.f32(float %uy.0.i, float 4.500000e+00, float 3.000000e+00)
  %38 = tail call float @llvm.fmuladd.f32(float %uy.0.i, float %37, float %fneg.i)
  %mul296.i = fmul float %mul292.i, %38
  %39 = tail call float @llvm.fmuladd.f32(float %14, float 0xBFEE666680000000, float %mul296.i)
  %40 = tail call float @llvm.fmuladd.f32(float %uy.0.i, float 4.500000e+00, float -3.000000e+00)
  %41 = tail call float @llvm.fmuladd.f32(float %uy.0.i, float %40, float %fneg.i)
  %mul301.i = fmul float %mul292.i, %41
  %42 = tail call float @llvm.fmuladd.f32(float %15, float 0xBFEE666680000000, float %mul301.i)
  %43 = tail call float @llvm.fmuladd.f32(float %uz.0.i, float 4.500000e+00, float 3.000000e+00)
  %44 = tail call float @llvm.fmuladd.f32(float %uz.0.i, float %43, float %fneg.i)
  %mul306.i = fmul float %mul292.i, %44
  %45 = tail call float @llvm.fmuladd.f32(float %18, float 0xBFEE666680000000, float %mul306.i)
  %46 = tail call float @llvm.fmuladd.f32(float %uz.0.i, float 4.500000e+00, float -3.000000e+00)
  %47 = tail call float @llvm.fmuladd.f32(float %uz.0.i, float %46, float %fneg.i)
  %mul311.i = fmul float %mul292.i, %47
  %48 = tail call float @llvm.fmuladd.f32(float %19, float 0xBFEE666680000000, float %mul311.i)
  %49 = tail call float @llvm.fmuladd.f32(float %ux.0.i, float 4.500000e+00, float 3.000000e+00)
  %50 = tail call float @llvm.fmuladd.f32(float %ux.0.i, float %49, float %fneg.i)
  %mul316.i = fmul float %mul292.i, %50
  %51 = tail call float @llvm.fmuladd.f32(float %16, float 0xBFEE666680000000, float %mul316.i)
  %52 = tail call float @llvm.fmuladd.f32(float %ux.0.i, float 4.500000e+00, float -3.000000e+00)
  %53 = tail call float @llvm.fmuladd.f32(float %ux.0.i, float %52, float %fneg.i)
  %mul321.i = fmul float %mul292.i, %53
  %54 = tail call float @llvm.fmuladd.f32(float %17, float 0xBFEE666680000000, float %mul321.i)
  %mul322.i = fmul float %mul286.i, 0x3F9C71C720000000
  %add324.i = fadd float %uy.0.i, %uz.0.i
  %55 = tail call float @llvm.fmuladd.f32(float %add324.i, float 4.500000e+00, float 3.000000e+00)
  %56 = tail call float @llvm.fmuladd.f32(float %add324.i, float %55, float %fneg.i)
  %mul329.i = fmul float %mul322.i, %56
  %57 = tail call float @llvm.fmuladd.f32(float %24, float 0xBFEE666680000000, float %mul329.i)
  %sub331.i = fsub float %uy.0.i, %uz.0.i
  %58 = tail call float @llvm.fmuladd.f32(float %sub331.i, float 4.500000e+00, float 3.000000e+00)
  %59 = tail call float @llvm.fmuladd.f32(float %sub331.i, float %58, float %fneg.i)
  %mul336.i = fmul float %mul322.i, %59
  %60 = tail call float @llvm.fmuladd.f32(float %25, float 0xBFEE666680000000, float %mul336.i)
  %fneg338.i = fneg float %uy.0.i
  %add339.i = fsub float %uz.0.i, %uy.0.i
  %61 = tail call float @llvm.fmuladd.f32(float %add339.i, float 4.500000e+00, float 3.000000e+00)
  %62 = tail call float @llvm.fmuladd.f32(float %add339.i, float %61, float %fneg.i)
  %mul345.i = fmul float %mul322.i, %62
  %63 = tail call float @llvm.fmuladd.f32(float %26, float 0xBFEE666680000000, float %mul345.i)
  %sub348.i = fsub float %fneg338.i, %uz.0.i
  %64 = tail call float @llvm.fmuladd.f32(float %sub348.i, float 4.500000e+00, float 3.000000e+00)
  %65 = tail call float @llvm.fmuladd.f32(float %sub348.i, float %64, float %fneg.i)
  %mul354.i = fmul float %mul322.i, %65
  %66 = tail call float @llvm.fmuladd.f32(float %27, float 0xBFEE666680000000, float %mul354.i)
  %add356.i = fadd float %ux.0.i, %uy.0.i
  %67 = tail call float @llvm.fmuladd.f32(float %add356.i, float 4.500000e+00, float 3.000000e+00)
  %68 = tail call float @llvm.fmuladd.f32(float %add356.i, float %67, float %fneg.i)
  %mul361.i = fmul float %mul322.i, %68
  %69 = tail call float @llvm.fmuladd.f32(float %20, float 0xBFEE666680000000, float %mul361.i)
  %sub363.i = fsub float %ux.0.i, %uy.0.i
  %70 = tail call float @llvm.fmuladd.f32(float %sub363.i, float 4.500000e+00, float 3.000000e+00)
  %71 = tail call float @llvm.fmuladd.f32(float %sub363.i, float %70, float %fneg.i)
  %mul368.i = fmul float %mul322.i, %71
  %72 = tail call float @llvm.fmuladd.f32(float %22, float 0xBFEE666680000000, float %mul368.i)
  %add370.i = fadd float %ux.0.i, %uz.0.i
  %73 = tail call float @llvm.fmuladd.f32(float %add370.i, float 4.500000e+00, float 3.000000e+00)
  %74 = tail call float @llvm.fmuladd.f32(float %add370.i, float %73, float %fneg.i)
  %mul375.i = fmul float %mul322.i, %74
  %75 = tail call float @llvm.fmuladd.f32(float %28, float 0xBFEE666680000000, float %mul375.i)
  %sub377.i = fsub float %ux.0.i, %uz.0.i
  %76 = tail call float @llvm.fmuladd.f32(float %sub377.i, float 4.500000e+00, float 3.000000e+00)
  %77 = tail call float @llvm.fmuladd.f32(float %sub377.i, float %76, float %fneg.i)
  %mul382.i = fmul float %mul322.i, %77
  %78 = tail call float @llvm.fmuladd.f32(float %29, float 0xBFEE666680000000, float %mul382.i)
  %fneg384.i = fneg float %ux.0.i
  %add385.i = fsub float %uy.0.i, %ux.0.i
  %79 = tail call float @llvm.fmuladd.f32(float %add385.i, float 4.500000e+00, float 3.000000e+00)
  %80 = tail call float @llvm.fmuladd.f32(float %add385.i, float %79, float %fneg.i)
  %mul391.i = fmul float %mul322.i, %80
  %81 = tail call float @llvm.fmuladd.f32(float %21, float 0xBFEE666680000000, float %mul391.i)
  %sub394.i = fsub float %fneg384.i, %uy.0.i
  %82 = tail call float @llvm.fmuladd.f32(float %sub394.i, float 4.500000e+00, float 3.000000e+00)
  %83 = tail call float @llvm.fmuladd.f32(float %sub394.i, float %82, float %fneg.i)
  %mul400.i = fmul float %mul322.i, %83
  %84 = tail call float @llvm.fmuladd.f32(float %23, float 0xBFEE666680000000, float %mul400.i)
  %add403.i = fsub float %uz.0.i, %ux.0.i
  %85 = tail call float @llvm.fmuladd.f32(float %add403.i, float 4.500000e+00, float 3.000000e+00)
  %86 = tail call float @llvm.fmuladd.f32(float %add403.i, float %85, float %fneg.i)
  %mul409.i = fmul float %mul322.i, %86
  %87 = tail call float @llvm.fmuladd.f32(float %30, float 0xBFEE666680000000, float %mul409.i)
  %sub412.i = fsub float %fneg384.i, %uz.0.i
  %88 = tail call float @llvm.fmuladd.f32(float %sub412.i, float 4.500000e+00, float 3.000000e+00)
  %89 = tail call float @llvm.fmuladd.f32(float %sub412.i, float %88, float %fneg.i)
  %mul418.i = fmul float %mul322.i, %89
  %90 = tail call float @llvm.fmuladd.f32(float %31, float 0xBFEE666680000000, float %mul418.i)
  br label %if.end419.r_exit.i

if.end419.r_exit.i:                               ; preds = %if.else.i, %pregion_for_entry.entry.i
  %91 = phi float [ %36, %if.else.i ], [ %13, %pregion_for_entry.entry.i ]
  %92 = phi float [ %39, %if.else.i ], [ %15, %pregion_for_entry.entry.i ]
  %93 = phi float [ %42, %if.else.i ], [ %14, %pregion_for_entry.entry.i ]
  %94 = phi float [ %90, %if.else.i ], [ %28, %pregion_for_entry.entry.i ]
  %95 = phi float [ %87, %if.else.i ], [ %29, %pregion_for_entry.entry.i ]
  %96 = phi float [ %78, %if.else.i ], [ %30, %pregion_for_entry.entry.i ]
  %97 = phi float [ %75, %if.else.i ], [ %31, %pregion_for_entry.entry.i ]
  %98 = phi float [ %66, %if.else.i ], [ %24, %pregion_for_entry.entry.i ]
  %99 = phi float [ %63, %if.else.i ], [ %25, %pregion_for_entry.entry.i ]
  %100 = phi float [ %60, %if.else.i ], [ %26, %pregion_for_entry.entry.i ]
  %101 = phi float [ %57, %if.else.i ], [ %27, %pregion_for_entry.entry.i ]
  %102 = phi float [ %84, %if.else.i ], [ %20, %pregion_for_entry.entry.i ]
  %103 = phi float [ %72, %if.else.i ], [ %21, %pregion_for_entry.entry.i ]
  %104 = phi float [ %81, %if.else.i ], [ %22, %pregion_for_entry.entry.i ]
  %105 = phi float [ %69, %if.else.i ], [ %23, %pregion_for_entry.entry.i ]
  %106 = phi float [ %48, %if.else.i ], [ %18, %pregion_for_entry.entry.i ]
  %107 = phi float [ %45, %if.else.i ], [ %19, %pregion_for_entry.entry.i ]
  %108 = phi float [ %54, %if.else.i ], [ %16, %pregion_for_entry.entry.i ]
  %109 = phi float [ %51, %if.else.i ], [ %17, %pregion_for_entry.entry.i ]
  %arrayidx430.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %mul10.i
  store float %91, ptr %arrayidx430.i, align 4, !tbaa !34, !llvm.access.group !38
  %add440.i = or i32 %mul10.i, 1
  %arrayidx441.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add440.i
  store float %92, ptr %arrayidx441.i, align 4, !tbaa !34, !llvm.access.group !38
  %add451.i = or i32 %mul10.i, 2
  %arrayidx452.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add451.i
  store float %93, ptr %arrayidx452.i, align 4, !tbaa !34, !llvm.access.group !38
  %add462.i = or i32 %mul10.i, 3
  %arrayidx463.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add462.i
  store float %109, ptr %arrayidx463.i, align 4, !tbaa !34, !llvm.access.group !38
  %add473.i = add nsw i32 %mul10.i, 4
  %arrayidx474.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add473.i
  store float %108, ptr %arrayidx474.i, align 4, !tbaa !34, !llvm.access.group !38
  %add484.i = add nsw i32 %mul10.i, 5
  %arrayidx485.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add484.i
  store float %107, ptr %arrayidx485.i, align 4, !tbaa !34, !llvm.access.group !38
  %add495.i = add nsw i32 %mul10.i, 6
  %arrayidx496.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add495.i
  store float %106, ptr %arrayidx496.i, align 4, !tbaa !34, !llvm.access.group !38
  %add506.i = add nsw i32 %mul10.i, 7
  %arrayidx507.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add506.i
  store float %105, ptr %arrayidx507.i, align 4, !tbaa !34, !llvm.access.group !38
  %add517.i = add nsw i32 %mul10.i, 8
  %arrayidx518.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add517.i
  store float %104, ptr %arrayidx518.i, align 4, !tbaa !34, !llvm.access.group !38
  %add528.i = add nsw i32 %mul10.i, 9
  %arrayidx529.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add528.i
  store float %103, ptr %arrayidx529.i, align 4, !tbaa !34, !llvm.access.group !38
  %add539.i = add nsw i32 %mul10.i, 10
  %arrayidx540.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add539.i
  store float %102, ptr %arrayidx540.i, align 4, !tbaa !34, !llvm.access.group !38
  %add550.i = add nsw i32 %mul10.i, 11
  %arrayidx551.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add550.i
  store float %101, ptr %arrayidx551.i, align 4, !tbaa !34, !llvm.access.group !38
  %add561.i = add nsw i32 %mul10.i, 12
  %arrayidx562.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add561.i
  store float %100, ptr %arrayidx562.i, align 4, !tbaa !34, !llvm.access.group !38
  %add572.i = add nsw i32 %mul10.i, 13
  %arrayidx573.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add572.i
  store float %99, ptr %arrayidx573.i, align 4, !tbaa !34, !llvm.access.group !38
  %add583.i = add nsw i32 %mul10.i, 14
  %arrayidx584.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add583.i
  store float %98, ptr %arrayidx584.i, align 4, !tbaa !34, !llvm.access.group !38
  %add594.i = add nsw i32 %mul10.i, 15
  %arrayidx595.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add594.i
  store float %97, ptr %arrayidx595.i, align 4, !tbaa !34, !llvm.access.group !38
  %add605.i = add nsw i32 %mul10.i, 16
  %arrayidx606.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add605.i
  store float %96, ptr %arrayidx606.i, align 4, !tbaa !34, !llvm.access.group !38
  %add616.i = add nsw i32 %mul10.i, 17
  %arrayidx617.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add616.i
  store float %95, ptr %arrayidx617.i, align 4, !tbaa !34, !llvm.access.group !38
  %add627.i = add nsw i32 %mul10.i, 18
  %arrayidx628.i = getelementptr inbounds float, ptr %add.ptr1.i, i32 %add627.i
  store float %94, ptr %arrayidx628.i, align 4, !tbaa !34, !llvm.access.group !38
  %exitcond.not = icmp eq i32 %add45.i, %umax
  br i1 %exitcond.not, label %pregion_for_end.i, label %pregion_for_entry.entry.i, !llvm.loop !43

pregion_for_end430.i:                             ; preds = %pregion_for_end.i
  %110 = add nuw i32 %_local_id_z.0, 1
  %exitcond4.not = icmp eq i32 %110, %umax3
  br i1 %exitcond4.not, label %performStreamCollide_kernel.exit, label %pregion_for_entry.pregion_for_init433.i, !llvm.loop !45

pregion_for_end.i:                                ; preds = %if.end419.r_exit.i
  %111 = add nuw i32 %_local_id_y.0, 1
  %exitcond2.not = icmp eq i32 %111, %umax1
  br i1 %exitcond2.not, label %pregion_for_end430.i, label %pregion_for_entry.pregion_for_init.i, !llvm.loop !47

performStreamCollide_kernel.exit:                 ; preds = %pregion_for_end430.i
  ret void
}

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none)
define void @_pocl_kernel_performStreamCollide_kernel_workgroup(ptr nocapture readonly %0, ptr nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #2 {
  %6 = load ptr, ptr %0, align 4
  %7 = load ptr, ptr %6, align 4
  %8 = getelementptr ptr, ptr %0, i32 1
  %9 = load ptr, ptr %8, align 4
  %10 = load ptr, ptr %9, align 4
  %11 = getelementptr inbounds { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %1, i32 0, i32 2
  %12 = load i32, ptr %11, align 4
  %13 = getelementptr { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %1, i32 0, i32 2, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = getelementptr { [3 x i32], [3 x i32], [3 x i32], ptr, ptr, i32, ptr, i32 }, ptr %1, i32 0, i32 2, i32 2
  %16 = load i32, ptr %15, align 4
  %add.ptr.i.i = getelementptr inbounds float, ptr %7, i32 51200
  %mul.i.i = mul nsw i32 %2, 40
  %mul8.i.i = mul i32 %3, 1280
  %mul14.i.i = add i32 %mul.i.i, -40
  %mul25.i.i = add i32 %mul.i.i, 40
  %mul62.i.i = add i32 %mul8.i.i, -1280
  %mul73.i.i = add i32 %mul8.i.i, 1280
  %add81.i.i = add i32 %mul8.i.i, %mul14.i.i
  %add103.i.i = add i32 %mul8.i.i, %mul25.i.i
  %add.ptr1.i.i = getelementptr inbounds float, ptr %10, i32 51200
  %umax = call i32 @llvm.umax.i32(i32 %12, i32 1)
  %umax1 = call i32 @llvm.umax.i32(i32 %14, i32 1)
  %umax3 = call i32 @llvm.umax.i32(i32 %16, i32 1)
  br label %pregion_for_entry.pregion_for_init433.i.i

pregion_for_entry.pregion_for_init433.i.i:        ; preds = %pregion_for_end430.i.i, %5
  %_local_id_z.i.0 = phi i32 [ 0, %5 ], [ %114, %pregion_for_end430.i.i ]
  br label %pregion_for_entry.pregion_for_init.i.i

pregion_for_entry.pregion_for_init.i.i:           ; preds = %pregion_for_end.i.i, %pregion_for_entry.pregion_for_init433.i.i
  %_local_id_y.i.0 = phi i32 [ 0, %pregion_for_entry.pregion_for_init433.i.i ], [ %115, %pregion_for_end.i.i ]
  br label %pregion_for_entry.entry.i.i

pregion_for_entry.entry.i.i:                      ; preds = %if.end419.r_exit.i.i, %pregion_for_entry.pregion_for_init.i.i
  %_local_id_x.i.0 = phi i32 [ 0, %pregion_for_entry.pregion_for_init.i.i ], [ %add45.i.i, %if.end419.r_exit.i.i ]
  %add5.i.i = add nsw i32 %_local_id_x.i.0, %mul.i.i
  %add9.i.i = add nsw i32 %add5.i.i, %mul8.i.i
  %mul10.i.i = mul nsw i32 %add9.i.i, 20
  %arrayidx.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %mul10.i.i
  %17 = load float, ptr %arrayidx.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add15.i.i = add nsw i32 %_local_id_x.i.0, %mul14.i.i
  %add19.i.i = add nsw i32 %add15.i.i, %mul8.i.i
  %mul20.i.i = mul nsw i32 %add19.i.i, 20
  %add21.i.i = or i32 %mul20.i.i, 1
  %arrayidx22.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add21.i.i
  %18 = load float, ptr %arrayidx22.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add26.i.i = add nsw i32 %_local_id_x.i.0, %mul25.i.i
  %add30.i.i = add nsw i32 %add26.i.i, %mul8.i.i
  %mul31.i.i = mul nsw i32 %add30.i.i, 20
  %add32.i.i = or i32 %mul31.i.i, 2
  %arrayidx33.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add32.i.i
  %19 = load float, ptr %arrayidx33.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add34.i.i = add nsw i32 %_local_id_x.i.0, -1
  %add37.i.i = add nsw i32 %add34.i.i, %mul.i.i
  %add41.i.i = add nsw i32 %add37.i.i, %mul8.i.i
  %mul42.i.i = mul nsw i32 %add41.i.i, 20
  %add43.i.i = or i32 %mul42.i.i, 3
  %arrayidx44.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add43.i.i
  %20 = load float, ptr %arrayidx44.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add45.i.i = add nuw nsw i32 %_local_id_x.i.0, 1
  %add48.i.i = add nsw i32 %add45.i.i, %mul.i.i
  %add52.i.i = add nsw i32 %add48.i.i, %mul8.i.i
  %mul53.i.i = mul nsw i32 %add52.i.i, 20
  %add54.i.i = add nsw i32 %mul53.i.i, 4
  %arrayidx55.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add54.i.i
  %21 = load float, ptr %arrayidx55.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add63.i.i = add nsw i32 %add5.i.i, %mul62.i.i
  %mul64.i.i = mul nsw i32 %add63.i.i, 20
  %add65.i.i = add nsw i32 %mul64.i.i, 5
  %arrayidx66.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add65.i.i
  %22 = load float, ptr %arrayidx66.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add74.i.i = add nsw i32 %add5.i.i, %mul73.i.i
  %mul75.i.i = mul nsw i32 %add74.i.i, 20
  %add76.i.i = add nsw i32 %mul75.i.i, 6
  %arrayidx77.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add76.i.i
  %23 = load float, ptr %arrayidx77.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add85.i.i = add i32 %add34.i.i, %add81.i.i
  %mul86.i.i = mul nsw i32 %add85.i.i, 20
  %add87.i.i = add nsw i32 %mul86.i.i, 7
  %arrayidx88.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add87.i.i
  %24 = load float, ptr %arrayidx88.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add96.i.i = add i32 %add45.i.i, %add81.i.i
  %mul97.i.i = mul nsw i32 %add96.i.i, 20
  %add98.i.i = add nsw i32 %mul97.i.i, 8
  %arrayidx99.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add98.i.i
  %25 = load float, ptr %arrayidx99.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add107.i.i = add i32 %add34.i.i, %add103.i.i
  %mul108.i.i = mul nsw i32 %add107.i.i, 20
  %add109.i.i = add nsw i32 %mul108.i.i, 9
  %arrayidx110.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add109.i.i
  %26 = load float, ptr %arrayidx110.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add118.i.i = add i32 %add45.i.i, %add103.i.i
  %mul119.i.i = mul nsw i32 %add118.i.i, 20
  %add120.i.i = add nsw i32 %mul119.i.i, 10
  %arrayidx121.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add120.i.i
  %27 = load float, ptr %arrayidx121.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add129.i.i = add nsw i32 %add15.i.i, %mul62.i.i
  %mul130.i.i = mul nsw i32 %add129.i.i, 20
  %add131.i.i = add nsw i32 %mul130.i.i, 11
  %arrayidx132.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add131.i.i
  %28 = load float, ptr %arrayidx132.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add140.i.i = add nsw i32 %add15.i.i, %mul73.i.i
  %mul141.i.i = mul nsw i32 %add140.i.i, 20
  %add142.i.i = add nsw i32 %mul141.i.i, 12
  %arrayidx143.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add142.i.i
  %29 = load float, ptr %arrayidx143.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add151.i.i = add nsw i32 %add26.i.i, %mul62.i.i
  %mul152.i.i = mul nsw i32 %add151.i.i, 20
  %add153.i.i = add nsw i32 %mul152.i.i, 13
  %arrayidx154.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add153.i.i
  %30 = load float, ptr %arrayidx154.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add162.i.i = add nsw i32 %add26.i.i, %mul73.i.i
  %mul163.i.i = mul nsw i32 %add162.i.i, 20
  %add164.i.i = add nsw i32 %mul163.i.i, 14
  %arrayidx165.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add164.i.i
  %31 = load float, ptr %arrayidx165.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add173.i.i = add nsw i32 %add37.i.i, %mul62.i.i
  %mul174.i.i = mul nsw i32 %add173.i.i, 20
  %add175.i.i = add nsw i32 %mul174.i.i, 15
  %arrayidx176.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add175.i.i
  %32 = load float, ptr %arrayidx176.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add184.i.i = add nsw i32 %add37.i.i, %mul73.i.i
  %mul185.i.i = mul nsw i32 %add184.i.i, 20
  %add186.i.i = add nsw i32 %mul185.i.i, 16
  %arrayidx187.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add186.i.i
  %33 = load float, ptr %arrayidx187.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add195.i.i = add nsw i32 %add48.i.i, %mul62.i.i
  %mul196.i.i = mul nsw i32 %add195.i.i, 20
  %add197.i.i = add nsw i32 %mul196.i.i, 17
  %arrayidx198.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add197.i.i
  %34 = load float, ptr %arrayidx198.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add206.i.i = add nsw i32 %add48.i.i, %mul73.i.i
  %mul207.i.i = mul nsw i32 %add206.i.i, 20
  %add208.i.i = add nsw i32 %mul207.i.i, 18
  %arrayidx209.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add208.i.i
  %35 = load float, ptr %arrayidx209.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add219.i.i = add nsw i32 %mul10.i.i, 19
  %arrayidx220.i.i = getelementptr inbounds float, ptr %add.ptr.i.i, i32 %add219.i.i
  %36 = load i32, ptr %arrayidx220.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %and.i.i = and i32 %36, 1
  %tobool.not.i.i = icmp eq i32 %and.i.i, 0
  br i1 %tobool.not.i.i, label %if.else.i.i, label %if.end419.r_exit.i.i

if.else.i.i:                                      ; preds = %pregion_for_entry.entry.i.i
  %add221.i.i = fadd float %17, %18
  %add222.i.i = fadd float %add221.i.i, %19
  %add223.i.i = fadd float %add222.i.i, %20
  %add224.i.i = fadd float %add223.i.i, %21
  %add225.i.i = fadd float %add224.i.i, %22
  %add226.i.i = fadd float %add225.i.i, %23
  %add227.i.i = fadd float %add226.i.i, %24
  %add228.i.i = fadd float %add227.i.i, %25
  %add229.i.i = fadd float %add228.i.i, %26
  %add230.i.i = fadd float %add229.i.i, %27
  %add231.i.i = fadd float %add230.i.i, %28
  %add232.i.i = fadd float %add231.i.i, %29
  %add233.i.i = fadd float %add232.i.i, %30
  %add234.i.i = fadd float %add233.i.i, %31
  %add235.i.i = fadd float %add234.i.i, %32
  %add236.i.i = fadd float %add235.i.i, %33
  %add237.i.i = fadd float %add236.i.i, %34
  %add238.i.i = fadd float %add237.i.i, %35
  %sub.i.i = fsub float %20, %21
  %add239.i.i = fadd float %sub.i.i, %24
  %sub240.i.i = fsub float %add239.i.i, %25
  %add241.i.i = fadd float %sub240.i.i, %26
  %sub242.i.i = fsub float %add241.i.i, %27
  %add243.i.i = fadd float %sub242.i.i, %32
  %add244.i.i = fadd float %add243.i.i, %33
  %sub245.i.i = fsub float %add244.i.i, %34
  %sub246.i.i = fsub float %sub245.i.i, %35
  %sub247.i.i = fsub float %18, %19
  %add248.i.i = fadd float %sub247.i.i, %24
  %add249.i.i = fadd float %add248.i.i, %25
  %sub250.i.i = fsub float %add249.i.i, %26
  %sub251.i.i = fsub float %sub250.i.i, %27
  %add252.i.i = fadd float %sub251.i.i, %28
  %add253.i.i = fadd float %add252.i.i, %29
  %sub254.i.i = fsub float %add253.i.i, %30
  %sub255.i.i = fsub float %sub254.i.i, %31
  %sub256.i.i = fsub float %22, %23
  %add257.i.i = fadd float %sub256.i.i, %28
  %sub258.i.i = fsub float %add257.i.i, %29
  %add259.i.i = fadd float %sub258.i.i, %30
  %sub260.i.i = fsub float %add259.i.i, %31
  %add261.i.i = fadd float %sub260.i.i, %32
  %sub262.i.i = fsub float %add261.i.i, %33
  %add263.i.i = fadd float %sub262.i.i, %34
  %sub264.i.i = fsub float %add263.i.i, %35
  %div.i.i = fdiv float %sub246.i.i, %add238.i.i, !fpmath !42
  %div265.i.i = fdiv float %sub255.i.i, %add238.i.i, !fpmath !42
  %div266.i.i = fdiv float %sub264.i.i, %add238.i.i, !fpmath !42
  %and279.i.i = and i32 %36, 2
  %tobool280.not.i.i = icmp eq i32 %and279.i.i, 0
  %ux.0.i.i = select i1 %tobool280.not.i.i, float %div.i.i, float 0x3F747AE140000000
  %uy.0.i.i = select i1 %tobool280.not.i.i, float %div265.i.i, float 0x3F60624DE0000000
  %uz.0.i.i = select i1 %tobool280.not.i.i, float %div266.i.i, float 0.000000e+00
  %mul283.i.i = fmul float %uy.0.i.i, %uy.0.i.i
  %37 = tail call float @llvm.fmuladd.f32(float %ux.0.i.i, float %ux.0.i.i, float %mul283.i.i)
  %38 = tail call float @llvm.fmuladd.f32(float %uz.0.i.i, float %uz.0.i.i, float %37)
  %39 = tail call float @llvm.fmuladd.f32(float %38, float 1.500000e+00, float -1.000000e+00)
  %mul286.i.i = fmul float %add238.i.i, 0x3FFF333340000000
  %mul289.i.i = fmul float %mul286.i.i, 0x3FD5555560000000
  %fneg.i.i = fneg float %39
  %mul291.i.i = fmul float %mul289.i.i, %fneg.i.i
  %40 = tail call float @llvm.fmuladd.f32(float %17, float 0xBFEE666680000000, float %mul291.i.i)
  %mul292.i.i = fmul float %mul286.i.i, 0x3FAC71C720000000
  %41 = tail call float @llvm.fmuladd.f32(float %uy.0.i.i, float 4.500000e+00, float 3.000000e+00)
  %42 = tail call float @llvm.fmuladd.f32(float %uy.0.i.i, float %41, float %fneg.i.i)
  %mul296.i.i = fmul float %mul292.i.i, %42
  %43 = tail call float @llvm.fmuladd.f32(float %18, float 0xBFEE666680000000, float %mul296.i.i)
  %44 = tail call float @llvm.fmuladd.f32(float %uy.0.i.i, float 4.500000e+00, float -3.000000e+00)
  %45 = tail call float @llvm.fmuladd.f32(float %uy.0.i.i, float %44, float %fneg.i.i)
  %mul301.i.i = fmul float %mul292.i.i, %45
  %46 = tail call float @llvm.fmuladd.f32(float %19, float 0xBFEE666680000000, float %mul301.i.i)
  %47 = tail call float @llvm.fmuladd.f32(float %uz.0.i.i, float 4.500000e+00, float 3.000000e+00)
  %48 = tail call float @llvm.fmuladd.f32(float %uz.0.i.i, float %47, float %fneg.i.i)
  %mul306.i.i = fmul float %mul292.i.i, %48
  %49 = tail call float @llvm.fmuladd.f32(float %22, float 0xBFEE666680000000, float %mul306.i.i)
  %50 = tail call float @llvm.fmuladd.f32(float %uz.0.i.i, float 4.500000e+00, float -3.000000e+00)
  %51 = tail call float @llvm.fmuladd.f32(float %uz.0.i.i, float %50, float %fneg.i.i)
  %mul311.i.i = fmul float %mul292.i.i, %51
  %52 = tail call float @llvm.fmuladd.f32(float %23, float 0xBFEE666680000000, float %mul311.i.i)
  %53 = tail call float @llvm.fmuladd.f32(float %ux.0.i.i, float 4.500000e+00, float 3.000000e+00)
  %54 = tail call float @llvm.fmuladd.f32(float %ux.0.i.i, float %53, float %fneg.i.i)
  %mul316.i.i = fmul float %mul292.i.i, %54
  %55 = tail call float @llvm.fmuladd.f32(float %20, float 0xBFEE666680000000, float %mul316.i.i)
  %56 = tail call float @llvm.fmuladd.f32(float %ux.0.i.i, float 4.500000e+00, float -3.000000e+00)
  %57 = tail call float @llvm.fmuladd.f32(float %ux.0.i.i, float %56, float %fneg.i.i)
  %mul321.i.i = fmul float %mul292.i.i, %57
  %58 = tail call float @llvm.fmuladd.f32(float %21, float 0xBFEE666680000000, float %mul321.i.i)
  %mul322.i.i = fmul float %mul286.i.i, 0x3F9C71C720000000
  %add324.i.i = fadd float %uy.0.i.i, %uz.0.i.i
  %59 = tail call float @llvm.fmuladd.f32(float %add324.i.i, float 4.500000e+00, float 3.000000e+00)
  %60 = tail call float @llvm.fmuladd.f32(float %add324.i.i, float %59, float %fneg.i.i)
  %mul329.i.i = fmul float %mul322.i.i, %60
  %61 = tail call float @llvm.fmuladd.f32(float %28, float 0xBFEE666680000000, float %mul329.i.i)
  %sub331.i.i = fsub float %uy.0.i.i, %uz.0.i.i
  %62 = tail call float @llvm.fmuladd.f32(float %sub331.i.i, float 4.500000e+00, float 3.000000e+00)
  %63 = tail call float @llvm.fmuladd.f32(float %sub331.i.i, float %62, float %fneg.i.i)
  %mul336.i.i = fmul float %mul322.i.i, %63
  %64 = tail call float @llvm.fmuladd.f32(float %29, float 0xBFEE666680000000, float %mul336.i.i)
  %fneg338.i.i = fneg float %uy.0.i.i
  %add339.i.i = fsub float %uz.0.i.i, %uy.0.i.i
  %65 = tail call float @llvm.fmuladd.f32(float %add339.i.i, float 4.500000e+00, float 3.000000e+00)
  %66 = tail call float @llvm.fmuladd.f32(float %add339.i.i, float %65, float %fneg.i.i)
  %mul345.i.i = fmul float %mul322.i.i, %66
  %67 = tail call float @llvm.fmuladd.f32(float %30, float 0xBFEE666680000000, float %mul345.i.i)
  %sub348.i.i = fsub float %fneg338.i.i, %uz.0.i.i
  %68 = tail call float @llvm.fmuladd.f32(float %sub348.i.i, float 4.500000e+00, float 3.000000e+00)
  %69 = tail call float @llvm.fmuladd.f32(float %sub348.i.i, float %68, float %fneg.i.i)
  %mul354.i.i = fmul float %mul322.i.i, %69
  %70 = tail call float @llvm.fmuladd.f32(float %31, float 0xBFEE666680000000, float %mul354.i.i)
  %add356.i.i = fadd float %ux.0.i.i, %uy.0.i.i
  %71 = tail call float @llvm.fmuladd.f32(float %add356.i.i, float 4.500000e+00, float 3.000000e+00)
  %72 = tail call float @llvm.fmuladd.f32(float %add356.i.i, float %71, float %fneg.i.i)
  %mul361.i.i = fmul float %mul322.i.i, %72
  %73 = tail call float @llvm.fmuladd.f32(float %24, float 0xBFEE666680000000, float %mul361.i.i)
  %sub363.i.i = fsub float %ux.0.i.i, %uy.0.i.i
  %74 = tail call float @llvm.fmuladd.f32(float %sub363.i.i, float 4.500000e+00, float 3.000000e+00)
  %75 = tail call float @llvm.fmuladd.f32(float %sub363.i.i, float %74, float %fneg.i.i)
  %mul368.i.i = fmul float %mul322.i.i, %75
  %76 = tail call float @llvm.fmuladd.f32(float %26, float 0xBFEE666680000000, float %mul368.i.i)
  %add370.i.i = fadd float %ux.0.i.i, %uz.0.i.i
  %77 = tail call float @llvm.fmuladd.f32(float %add370.i.i, float 4.500000e+00, float 3.000000e+00)
  %78 = tail call float @llvm.fmuladd.f32(float %add370.i.i, float %77, float %fneg.i.i)
  %mul375.i.i = fmul float %mul322.i.i, %78
  %79 = tail call float @llvm.fmuladd.f32(float %32, float 0xBFEE666680000000, float %mul375.i.i)
  %sub377.i.i = fsub float %ux.0.i.i, %uz.0.i.i
  %80 = tail call float @llvm.fmuladd.f32(float %sub377.i.i, float 4.500000e+00, float 3.000000e+00)
  %81 = tail call float @llvm.fmuladd.f32(float %sub377.i.i, float %80, float %fneg.i.i)
  %mul382.i.i = fmul float %mul322.i.i, %81
  %82 = tail call float @llvm.fmuladd.f32(float %33, float 0xBFEE666680000000, float %mul382.i.i)
  %fneg384.i.i = fneg float %ux.0.i.i
  %add385.i.i = fsub float %uy.0.i.i, %ux.0.i.i
  %83 = tail call float @llvm.fmuladd.f32(float %add385.i.i, float 4.500000e+00, float 3.000000e+00)
  %84 = tail call float @llvm.fmuladd.f32(float %add385.i.i, float %83, float %fneg.i.i)
  %mul391.i.i = fmul float %mul322.i.i, %84
  %85 = tail call float @llvm.fmuladd.f32(float %25, float 0xBFEE666680000000, float %mul391.i.i)
  %sub394.i.i = fsub float %fneg384.i.i, %uy.0.i.i
  %86 = tail call float @llvm.fmuladd.f32(float %sub394.i.i, float 4.500000e+00, float 3.000000e+00)
  %87 = tail call float @llvm.fmuladd.f32(float %sub394.i.i, float %86, float %fneg.i.i)
  %mul400.i.i = fmul float %mul322.i.i, %87
  %88 = tail call float @llvm.fmuladd.f32(float %27, float 0xBFEE666680000000, float %mul400.i.i)
  %add403.i.i = fsub float %uz.0.i.i, %ux.0.i.i
  %89 = tail call float @llvm.fmuladd.f32(float %add403.i.i, float 4.500000e+00, float 3.000000e+00)
  %90 = tail call float @llvm.fmuladd.f32(float %add403.i.i, float %89, float %fneg.i.i)
  %mul409.i.i = fmul float %mul322.i.i, %90
  %91 = tail call float @llvm.fmuladd.f32(float %34, float 0xBFEE666680000000, float %mul409.i.i)
  %sub412.i.i = fsub float %fneg384.i.i, %uz.0.i.i
  %92 = tail call float @llvm.fmuladd.f32(float %sub412.i.i, float 4.500000e+00, float 3.000000e+00)
  %93 = tail call float @llvm.fmuladd.f32(float %sub412.i.i, float %92, float %fneg.i.i)
  %mul418.i.i = fmul float %mul322.i.i, %93
  %94 = tail call float @llvm.fmuladd.f32(float %35, float 0xBFEE666680000000, float %mul418.i.i)
  br label %if.end419.r_exit.i.i

if.end419.r_exit.i.i:                             ; preds = %if.else.i.i, %pregion_for_entry.entry.i.i
  %95 = phi float [ %40, %if.else.i.i ], [ %17, %pregion_for_entry.entry.i.i ]
  %96 = phi float [ %43, %if.else.i.i ], [ %19, %pregion_for_entry.entry.i.i ]
  %97 = phi float [ %46, %if.else.i.i ], [ %18, %pregion_for_entry.entry.i.i ]
  %98 = phi float [ %94, %if.else.i.i ], [ %32, %pregion_for_entry.entry.i.i ]
  %99 = phi float [ %91, %if.else.i.i ], [ %33, %pregion_for_entry.entry.i.i ]
  %100 = phi float [ %82, %if.else.i.i ], [ %34, %pregion_for_entry.entry.i.i ]
  %101 = phi float [ %79, %if.else.i.i ], [ %35, %pregion_for_entry.entry.i.i ]
  %102 = phi float [ %70, %if.else.i.i ], [ %28, %pregion_for_entry.entry.i.i ]
  %103 = phi float [ %67, %if.else.i.i ], [ %29, %pregion_for_entry.entry.i.i ]
  %104 = phi float [ %64, %if.else.i.i ], [ %30, %pregion_for_entry.entry.i.i ]
  %105 = phi float [ %61, %if.else.i.i ], [ %31, %pregion_for_entry.entry.i.i ]
  %106 = phi float [ %88, %if.else.i.i ], [ %24, %pregion_for_entry.entry.i.i ]
  %107 = phi float [ %76, %if.else.i.i ], [ %25, %pregion_for_entry.entry.i.i ]
  %108 = phi float [ %85, %if.else.i.i ], [ %26, %pregion_for_entry.entry.i.i ]
  %109 = phi float [ %73, %if.else.i.i ], [ %27, %pregion_for_entry.entry.i.i ]
  %110 = phi float [ %52, %if.else.i.i ], [ %22, %pregion_for_entry.entry.i.i ]
  %111 = phi float [ %49, %if.else.i.i ], [ %23, %pregion_for_entry.entry.i.i ]
  %112 = phi float [ %58, %if.else.i.i ], [ %20, %pregion_for_entry.entry.i.i ]
  %113 = phi float [ %55, %if.else.i.i ], [ %21, %pregion_for_entry.entry.i.i ]
  %arrayidx430.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %mul10.i.i
  store float %95, ptr %arrayidx430.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add440.i.i = or i32 %mul10.i.i, 1
  %arrayidx441.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add440.i.i
  store float %96, ptr %arrayidx441.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add451.i.i = or i32 %mul10.i.i, 2
  %arrayidx452.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add451.i.i
  store float %97, ptr %arrayidx452.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add462.i.i = or i32 %mul10.i.i, 3
  %arrayidx463.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add462.i.i
  store float %113, ptr %arrayidx463.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add473.i.i = add nsw i32 %mul10.i.i, 4
  %arrayidx474.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add473.i.i
  store float %112, ptr %arrayidx474.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add484.i.i = add nsw i32 %mul10.i.i, 5
  %arrayidx485.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add484.i.i
  store float %111, ptr %arrayidx485.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add495.i.i = add nsw i32 %mul10.i.i, 6
  %arrayidx496.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add495.i.i
  store float %110, ptr %arrayidx496.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add506.i.i = add nsw i32 %mul10.i.i, 7
  %arrayidx507.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add506.i.i
  store float %109, ptr %arrayidx507.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add517.i.i = add nsw i32 %mul10.i.i, 8
  %arrayidx518.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add517.i.i
  store float %108, ptr %arrayidx518.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add528.i.i = add nsw i32 %mul10.i.i, 9
  %arrayidx529.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add528.i.i
  store float %107, ptr %arrayidx529.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add539.i.i = add nsw i32 %mul10.i.i, 10
  %arrayidx540.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add539.i.i
  store float %106, ptr %arrayidx540.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add550.i.i = add nsw i32 %mul10.i.i, 11
  %arrayidx551.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add550.i.i
  store float %105, ptr %arrayidx551.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add561.i.i = add nsw i32 %mul10.i.i, 12
  %arrayidx562.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add561.i.i
  store float %104, ptr %arrayidx562.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add572.i.i = add nsw i32 %mul10.i.i, 13
  %arrayidx573.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add572.i.i
  store float %103, ptr %arrayidx573.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add583.i.i = add nsw i32 %mul10.i.i, 14
  %arrayidx584.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add583.i.i
  store float %102, ptr %arrayidx584.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add594.i.i = add nsw i32 %mul10.i.i, 15
  %arrayidx595.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add594.i.i
  store float %101, ptr %arrayidx595.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add605.i.i = add nsw i32 %mul10.i.i, 16
  %arrayidx606.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add605.i.i
  store float %100, ptr %arrayidx606.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add616.i.i = add nsw i32 %mul10.i.i, 17
  %arrayidx617.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add616.i.i
  store float %99, ptr %arrayidx617.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %add627.i.i = add nsw i32 %mul10.i.i, 18
  %arrayidx628.i.i = getelementptr inbounds float, ptr %add.ptr1.i.i, i32 %add627.i.i
  store float %98, ptr %arrayidx628.i.i, align 4, !tbaa !34, !llvm.access.group !38
  %exitcond.not = icmp eq i32 %add45.i.i, %umax
  br i1 %exitcond.not, label %pregion_for_end.i.i, label %pregion_for_entry.entry.i.i, !llvm.loop !43

pregion_for_end430.i.i:                           ; preds = %pregion_for_end.i.i
  %114 = add nuw i32 %_local_id_z.i.0, 1
  %exitcond4.not = icmp eq i32 %114, %umax3
  br i1 %exitcond4.not, label %_pocl_kernel_performStreamCollide_kernel.exit, label %pregion_for_entry.pregion_for_init433.i.i, !llvm.loop !45

pregion_for_end.i.i:                              ; preds = %if.end419.r_exit.i.i
  %115 = add nuw i32 %_local_id_y.i.0, 1
  %exitcond2.not = icmp eq i32 %115, %umax1
  br i1 %exitcond2.not, label %pregion_for_end430.i.i, label %pregion_for_entry.pregion_for_init.i.i, !llvm.loop !47

_pocl_kernel_performStreamCollide_kernel.exit:    ; preds = %pregion_for_end430.i.i
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { alwaysinline mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "stackrealign" "target-features"="+32bit,+f,+m,+vortex" "uniform-work-group-size"="false" }
attributes #2 = { nofree nosync nounwind memory(readwrite, inaccessiblemem: none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!opencl.ocl.version = !{!4}
!llvm.ident = !{!5}
!pocl_meta = !{!6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32f"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 1, !"SmallDataLimit", i32 0}
!4 = !{i32 3, i32 0}
!5 = !{!"clang version 16.0.6 (git@github.com:vortexgpgpu/llvm.git 58811bfa61a503fd4a5f0dc7b57802fae51c3f5d)"}
!6 = !{!"device_address_bits", i64 32}
!7 = !{!"device_arg_buffer_launcher", i8 0}
!8 = !{!"device_grid_launcher", i8 0}
!9 = !{!"device_is_spmd", i8 0}
!10 = !{!"KernelName", !"performStreamCollide_kernel"}
!11 = !{!"WGMaxGridDimWidth", i64 0}
!12 = !{!"WGLocalSizeX", i64 0}
!13 = !{!"WGLocalSizeY", i64 0}
!14 = !{!"WGLocalSizeZ", i64 0}
!15 = !{!"WGDynamicLocalSize", i8 1}
!16 = !{!"WGAssumeZeroGlobalOffset", i8 1}
!17 = !{!"device_global_as_id", i64 0}
!18 = !{!"device_local_as_id", i64 0}
!19 = !{!"device_constant_as_id", i64 0}
!20 = !{!"device_args_as_id", i64 0}
!21 = !{!"device_context_as_id", i64 0}
!22 = !{!"device_side_printf", i8 1}
!23 = !{!"device_alloca_locals", i8 0}
!24 = !{!"device_max_witem_dim", i64 3}
!25 = !{!"device_max_witem_sizes_0", i64 4096}
!26 = !{!"device_max_witem_sizes_1", i64 4096}
!27 = !{!"device_max_witem_sizes_2", i64 4096}
!28 = !{i32 1, i32 1}
!29 = !{!"none", !"none"}
!30 = !{!"float*", !"float*"}
!31 = !{!"", !""}
!32 = !{!"srcGrid", !"dstGrid"}
!33 = !{i32 1}
!34 = !{!35, !35, i64 0}
!35 = !{!"float", !36, i64 0}
!36 = !{!"omnipotent char", !37, i64 0}
!37 = !{!"Simple C/C++ TBAA"}
!38 = !{!39, !40, !41}
!39 = distinct !{}
!40 = distinct !{}
!41 = distinct !{}
!42 = !{float 2.500000e+00}
!43 = distinct !{!43, !44}
!44 = !{!"llvm.loop.parallel_accesses", !39}
!45 = distinct !{!45, !46}
!46 = !{!"llvm.loop.parallel_accesses", !41}
!47 = distinct !{!47, !48}
!48 = !{!"llvm.loop.parallel_accesses", !40}
