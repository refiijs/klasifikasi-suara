function y_speech = baca_dataspeech(y, Fs)    
    [idx, ~] = detectSpeech(y, Fs);
    y=y(:,1);

    [r, ~] = size(idx);
    N_speech = 0;
    for i = 1:r
        N_speech = N_speech + (idx(i, 2) - idx(i, 1)) + 1;
    end
    
    y_speech = 0;
    for i = 1:r
        y_speech=[y_speech;y(idx(i,1):idx(i,2),:)];
    end
end
