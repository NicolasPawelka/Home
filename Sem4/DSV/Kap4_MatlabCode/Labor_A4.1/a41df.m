% Aufgabe 4.1 Blockbasierte Filterung

% Nun soll ein Audiosignal aus einer binären Datei blockweise Tiefpass gefiltert werden.

% Hier neue Matlab-Funktionen: fir1, fopen, fread, fwrite, fclose, feof, isempty, int16

%% d) Tiefpass Filterdesign 
N = 49; % Filterordnung 
fa = 8000;
fg_norm = 0.5; % Grenzfrequenz des TP (auf fa/2 normiert) 0 < fg_norm < 1
b = fir1(N, fg_norm, 'low'); % FIR Tiefpassfilter der Ordnung N entwerfen

%% e) Blockweises Lesen, Filtern und Schreiben des Audiosignals
fid1 = fopen('serengeti.bin', 'r'); % Binäre Eingangsdatei zum Lesen öffnen
fid2 = fopen('serengeti_tp.bin', 'w'); % Ausgangsdatei zum Schreiben öffnen

blocksize = 512;
a = [1];
zi = zeros(1,max(length(a), length(b))-1);
zf = [];

while ~feof(fid1) % Solange das Ende der Datei noch nicht erreicht ist ...
    x = fread(fid1, blocksize, 'int16'); % Lese den nächsten Block von 16-Bit-Werten
    if ~isempty(x) % Solange der Block Abtastwerte enthält ...
       % [y,zf] = filter(b,a,x,zi);
        [y] = filter(b,a,x);
        zi = zf;
        y16 = int16(y); % Konvertiere von double nach int16
        fwrite(fid2, y16, 'int16'); % Gefilterten Block in Ausgangsdatei schreiben
    end
end

fclose (fid1);
fclose (fid2);

%% f) Prüfe das gefilterte Signal 
fid2 = fopen('serengeti_tp.bin', 'r');
fid1 = fopen('serengeti.bin', 'r');
y_all = fread(fid2, 'int16');
x_all = fread(fid1,'int16');
fclose(fid1);
fclose (fid2);
SpectrogramExample (y_all, fa);
SpectrogramExample (x_all, fa);
