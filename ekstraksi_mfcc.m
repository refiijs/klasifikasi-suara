function fitur_mfcc = ekstraksi_mfcc(y_speech,Fs,n_coeffs,L,S,view_mfcc)
    win = hamming(L, "periodic");
    S = stft(y_speech, "Window",win, "OverlapLength", L*S/100, "Centered", false);
    fitur_mfcc = mfcc(S,Fs, "LogEnergy","Ignore", "NumCoeffs",n_coeffs);
    fitur_mfcc = mean(fitur_mfcc);
    
    if view_mfcc == 1
        mfcc(S, Fs, "LogEnergy", "Ignore", "NumCoeffs", n_coeffs);
    end
end