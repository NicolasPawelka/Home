%% -------------------------------------------------------------------------
% c) Callback-Funktion, die aufgerufen wird, wenn die vorher festgelegte Anzahl
%    von Abtastwerten vom A/D-Wandler in einen internen Puffer aufgenommen wurde. 
 
function audioInputCallback(dAudioIO, event, b, a)
global h_time_domain_plot1;
global h_time_domain_plot2;
persistent z; % Verzögerungselemente  e) Warum ist das Attribut persistent nötig???

    % Block von Abtastwerten von Audio Input Puffer holen 
    x = read(dAudioIO, event.NumElementsAvailable, "OutputFormat","Matrix"); % c) (vergl. A 4.2)
try
    % Abtastwerte in existierendem Plotfenster darstellen
    set(h_time_domain_plot1, 'XData', 0:length(x)-1, 'YData', x)
catch
    % Falls Plotfenster geschlossen: Stop audio input/output 
    stop(dAudioIO); 
    disp('Audio Input/Output beendet.');
%    rethrow(lasterror)
    return;
end

    % Signalblock filtern
     [y,z] = filter(b,a,x,z);

    % Gefiltertes Signal in existierendem Plotfenster darstellen
    set(h_time_domain_plot2, 'XData', 0:length(y)-1, 'YData', y)
    drawnow;
    
    % Die Audiooutput Queue sollte nie leerlaufen, sonst muss hier abgebrochen werden.
    if dAudioIO.NumScansQueued <= 0  % Anzahl noch gepufferter Samples in Audiooutput Queue prüfen
        stop(dAudioIO);
        error('Audiooutput-Queue ist leergelaufen & Audio Input/Output wurde gestoppt.')
    end
    % Block von gefilterten Abtastwerten in Audiooutput Queue geben 
    write(dAudioIO,y);
    
end