clear
clc
close all

fps = '1.0';
featAggr = 'AVG';  %'AVG', 'AVGVAR', 'MED' , 'MEDMAD'
featComb = 'All';  %'All', 'Feat26', 'Type3'
featNorm = 2 ;

fldAddr = ['/Volumes/SP PHD U3/OneDrive_Polimi/OneDrive - Politecnico di Milano/dataset/visual/trailer/'...
          'AestheticFeatures - ' featAggr ' - ' fps 'fpsFiltered/1fpsFiltered ' featAggr '/' featComb];

I = dir(fullfile(fldAddr,'*.mat'));


for fileNo = 1 : size(I,1)
    movieId = sscanf(I(fileNo).name,'video%dfeatures');
    load(fullfile(fldAddr,I(fileNo).name))
    if strcmp(featComb,'All')
        T(fileNo,:) = [movieId MatrixFeature_AVG_All];
    elseif strcmp(featComb,'Feat26')
         T1(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_avgHSLFocus];
         T2(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_avgHSVRot];
         T3(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_avgWaveletHSV];
         T4(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_Brightness];
         T5(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_BrightnessSegments];
         T6(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_Centroids];
         T7(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_Colorfulness];
         T8(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_ColorModel];
         T9(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_ContrastSegments];
        T10(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_Convexity];
        T11(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_Coordinates];
        T12(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_DofIndicator];
        T13(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_Edge];
        T14(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_HSL];
        T15(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_HSV];
        T16(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_HueDescriptors];
        T17(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_HueModels];
        T18(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_HueSegments];
        T19(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_LargeSegments];
        T20(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_MassVarianceSegments];
        T21(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_RGBEntropy];
        T22(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_SaturationSegments];
        T23(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_SkewnessSegments];
        T24(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_Texture];
        T25(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_ValueSegments];
        T26(fileNo,:) = [movieId MatrixFeature_AVG_Feat26_WaveletHSV];
    elseif strcmp(featComb,'Type3')
         T1(fileNo,:) = [movieId MatrixFeature_AVG_Type3_Color];
         T2(fileNo,:) = [movieId MatrixFeature_AVG_Type3_Object];
         T3(fileNo,:) = [movieId MatrixFeature_AVG_Type3_Texture];
    end
end

if featNorm == 2 && strcmp(featComb,'All')
    T = [T(:,1) normc(T(:,2:end))];
    T = array2table(T);
    T.Properties.VariableNames = ['movieId' sprintfc('avf%d',1:(size(T,2)-1))];
    
    writetable(T,['AVF_trailers_fps_' fps '_featAggr_' featAggr '_featComb_' featComb '_featNorm_' num2str(featNorm) '.csv']);
    
elseif featNorm == 2 && strcmp(featComb,'Feat26')
    T1 = [T1(:,1) normc(T1(:,2:end))];
    T2 = [T2(:,1) normc(T2(:,2:end))];
    T3 = [T3(:,1) normc(T3(:,2:end))];
    T4 = [T4(:,1) normc(T4(:,2:end))];
    T5 = [T5(:,1) normc(T5(:,2:end))];
    T6 = [T6(:,1) normc(T6(:,2:end))];
    T7 = [T7(:,1) normc(T7(:,2:end))];
    T8 = [T8(:,1) normc(T8(:,2:end))];
    T9 = [T9(:,1) normc(T9(:,2:end))];
    T10 = [T10(:,1) normc(T10(:,2:end))];
    T11 = [T11(:,1) normc(T11(:,2:end))];
    T12 = [T12(:,1) normc(T12(:,2:end))];
    T13 = [T13(:,1) normc(T13(:,2:end))];
    T14 = [T14(:,1) normc(T14(:,2:end))];
    T15 = [T15(:,1) normc(T15(:,2:end))];
    T16 = [T16(:,1) normc(T16(:,2:end))];
    T17 = [T17(:,1) normc(T17(:,2:end))];
    T18 = [T18(:,1) normc(T18(:,2:end))];
    T19 = [T19(:,1) normc(T19(:,2:end))];
    T20 = [T20(:,1) normc(T20(:,2:end))];
    T21 = [T21(:,1) normc(T21(:,2:end))];
    T22 = [T22(:,1) normc(T22(:,2:end))];
    T23 = [T23(:,1) normc(T23(:,2:end))];
    T24 = [T24(:,1) normc(T24(:,2:end))];
    T25 = [T25(:,1) normc(T25(:,2:end))];
    T26 = [T26(:,1) normc(T26(:,2:end))];
    
    for i = 1 : 26
        eval(['T = T' num2str(i)]);
        T = array2table(T);
        T.Properties.VariableNames = ['movieId' sprintfc('avf%d',1:(size(T,2)-1))];
        
        writetable(T,['AVF_trailers_fps_' fps '_featAggr_' featAggr '_featComb_' featComb '_part_' num2str(i) '_featNorm_' num2str(featNorm) '.csv']);
        
    end
    elseif featNorm == 2 && strcmp(featComb,'Type3')

            T1 = [T1(:,1) normc(T1(:,2:end))];
    T2 = [T2(:,1) normc(T2(:,2:end))];
    T3 = [T3(:,1) normc(T3(:,2:end))];
    
    for i = 1 : 3
        eval(['T = T' num2str(i) ';']);
        T = array2table(T);
        T.Properties.VariableNames = ['movieId' sprintfc('avf%d',1:(size(T,2)-1))];
        
        writetable(T,['AVF_trailers_fps_' fps '_featAggr_' featAggr '_featComb_' featComb '_part_' num2str(i) '_featNorm_' num2str(featNorm) '.csv']);
        
    end
end



