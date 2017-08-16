function aggr_feat = mfcc_feature_aggr(mfcc_feat_cell, printFlag)

% This function accept as the input the MFCC features which is of 
% dimensionality [nc,nf] and reports as the output different feature
% aggregation technqiues:
%
%  Inputs:
%          mfcc_feat_table: the original mfcc spectrogram [nc*nf]
%               printFlag : the printflag 
% Outputs:  
%         aggr_feat.stat_sum1: statistical summarization using only mean vector of the cepstrums: [nc,1]
%         aggr_feat.stat_sum2: statistical summarization using only mean vector of the cepstrums + var + upper(cov): [nc+nc+nc*(nc-1)/2,1]
%         aggr_feat.gmm1: Gaussian Mixture Model with n_gauss = 1 
%         aggr_feat.gmm2: Gaussian Mixture Model with n_gauss = 2 
%         aggr_feat.gmm4: Gaussian Mixture Model with n_gauss = 4
%         aggr_feat.gmm8: Gaussian Mixture Model with n_gauss = 8
%         aggr_feat.gmm16: Gaussian Mixture Model with n_gauss = 16
%         aggr_feat.gmm32: Gaussian Mixture Model with n_gauss = 32
%         aggr_feat.gmm64: Gaussian Mixture Model with n_gauss = 64
%         aggr_feat.gmm128: Gaussian Mixture Model with n_gauss = 128
%         aggr_feat.gmm256: Gaussian Mixture Model with n_gauss = 256
%         aggr_feat.gmm512: Gaussian Mixture Model with n_gauss = 512

mfcc_descr_statsum_mean_varcov = [] ;
      mfcc_descr_statsum_mean  = [] ;
              mfcc_descr_gmm1  = [] ;
              mfcc_descr_gmm2  = [] ;
              mfcc_descr_gmm3  = [] ;
              mfcc_descr_gmm4  = [] ;
              mfcc_descr_gmm5  = [] ;
              mfcc_descr_gmm8  = [] ;
              mfcc_descr_gmm16  = [] ;
              mfcc_descr_gmm32  = [] ;



for file = 1 : length(mfcc_feat_cell)
    if mod (file,100)==1
       fprintf('File No: %d \n',file) 
    end
      data = mfcc_feat_cell{file,1};
      data = data'                 ;
    covMat = cov(data)         ;
    
         m = mean(data,1) ;
         c = nonzeros(triu(covMat))';  % note this also include the variance, so no need to use the variance
    
    final_mfcc_descr = [m(:);c(:)];
    final_mfcc_descr = final_mfcc_descr';
    
    mfcc_descr_statsum_mean_varcov = [mfcc_descr_statsum_mean_varcov;final_mfcc_descr];
           mfcc_descr_statsum_mean = [mfcc_descr_statsum_mean;final_mfcc_descr(1:length(m))] ;
    
     for n_gauss = [1 2 3 4 5 8 16 32]
            GMM_Model = fitgmdist(data,n_gauss,'RegularizationValue',0.01,'Options',statset('MaxIter',1500));
            
                 mean_vec = GMM_Model.mu;
                   covMat = GMM_Model.Sigma;
            
              mean_vec_mix_all = [] ;
            varcov_vec_mix_all = [] ;
            
            for mixture = 1 : n_gauss
                mean_vec_mix = mean_vec(mixture,:);
                covMat_mix = covMat(:,:,mixture);
                
                cov_mix = nonzeros(triu(covMat_mix))';  % note this also include the variance, so no need to use the variance
                
                mean_vec_mix_all = [mean_vec_mix_all;mean_vec_mix(:)];
                varcov_vec_mix_all = [varcov_vec_mix_all;cov_mix(:)]   ;
                
            end
            
            if n_gauss == 1
                mfcc_descr_gmm1(file).mean_vec = mean_vec_mix_all;
                mfcc_descr_gmm1(file).carcov_vec = varcov_vec_mix_all;
                mfcc_descr_gmm1(file).weights = GMM_Model.ComponentProportion;
                
                
            elseif n_gauss == 2
                mfcc_descr_gmm2(file).mean_vec = mean_vec_mix_all;
                mfcc_descr_gmm2(file).carcov_vec = varcov_vec_mix_all;
                mfcc_descr_gmm2(file).weights = GMM_Model.ComponentProportion;
                
            elseif n_gauss == 3
                mfcc_descr_gmm3(file).mean_vec = mean_vec_mix_all;
                mfcc_descr_gmm3(file).carcov_vec = varcov_vec_mix_all;
                mfcc_descr_gmm3(file).weights = GMM_Model.ComponentProportion;
                
            elseif n_gauss == 4
                mfcc_descr_gmm4(file).mean_vec = mean_vec_mix_all;
                mfcc_descr_gmm4(file).carcov_vec = varcov_vec_mix_all;
                mfcc_descr_gmm4(file).weights = GMM_Model.ComponentProportion;
                
            elseif n_gauss == 5
                mfcc_descr_gmm5(file).mean_vec = mean_vec_mix_all;
                mfcc_descr_gmm5(file).carcov_vec = varcov_vec_mix_all;
                mfcc_descr_gmm5(file).weights = GMM_Model.ComponentProportion;
            elseif n_gauss == 8
                mfcc_descr_gmm8(file).mean_vec = mean_vec_mix_all;
                mfcc_descr_gmm8(file).carcov_vec = varcov_vec_mix_all;
                mfcc_descr_gmm8(file).weights = GMM_Model.ComponentProportion;
            elseif n_gauss == 16
                mfcc_descr_gmm16(file).mean_vec = mean_vec_mix_all;
                mfcc_descr_gmm16(file).carcov_vec = varcov_vec_mix_all;
                mfcc_descr_gmm16(file).weights = GMM_Model.ComponentProportion;
            elseif n_gauss == 32
                mfcc_descr_gmm32(file).mean_vec = mean_vec_mix_all;
                mfcc_descr_gmm32(file).carcov_vec = varcov_vec_mix_all;
                mfcc_descr_gmm32(file).weights = GMM_Model.ComponentProportion;
            end
            
     end
     
end





