%% -------------------------------------------------------------------------
% f) Callback-Funktion, die aufgerufen wird, wenn die vorher festgelegte Anzahl
%    von Abtastwerten vom A/D-Wandler in einen internen Puffer aufgenommen wurde. 
function audioInputCallback(dAudioIn, event)
global h_time_domain_plot;
global h_freq_domain_plot;

try
    % Block von Abtastwerten von Audio Input Puffer holen 
    x = read(dAudioIn, event.NumElementsAvailable, "OutputFormat","Matrix");
    % Abtastwerte in existierendem Plotfenster darstellen
    set(h_time_domain_plot, 'XData', 0:length(x)-1, 'YData', x)

    % logarithmiertes Betragsspektrum in dB berechnen 
    fftLength = length(x);
    X_dft = fft(double(x), fftLength);
    X_dft_dB  = 20*log10(abs(X_dft(1:fftLength/2)));
    % Frequenzachse für 0 bis fs/2 berechnen
    df = dAudioIn.Rate / fftLength; % Frequenzauflösung
    k = 0:(fftLength/2-1);
    f = k * df;  % Frequenzachse in Hz
    % Spektrum in existierendem Plotfenster darstellen
    set(h_freq_domain_plot, 'XData', f, 'YData', X_dft_dB)
    drawnow;

    % Alternative zur Vermeidung globaler Variable
    % set(dAudioIn.UserData.h_fd_plot, 'XData', f, 'YData', X_dft_dB)

catch
    % Falls Plot-Fenster geschlossen oder andere Ausnahme: Stop audio input
    stop(dAudioIn); 
    disp('Audioaufnahme beendet.');
    % rethrow(lasterror)
end

end