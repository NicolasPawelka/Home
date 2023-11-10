% A 3.1 FIR Filter, Faltung, Matched-Filter
% Experiment zur 2-dimensionalen Faltung

% Übertragen Sie das Konzept der Faltung auf Bilder, in dem Sie die beiden 
% bereits betrachteten Filter mit ihren 1-dim. Impulsantworten h[k] (ggf. 
% auf eine Matrix erweitert) nun 2-dimensional anwenden 
% und deren "optische" Wirkungen auf ein Beispiel-Bild untersuchen 

I = imread('cameraman.tif');
subplot(2,2,1)
imshow(I); title('Originalbild');

% Erweiterung der 1-dim. Impulsantwort h=[1 1 1]/3 auf einen 2-dim.
% "Faltungskern" (Matrix)
H1 = [1 1 1; 0 0 0; 1 1 1]/9;
% Durchführung der 2-dim. Faltung
I_out1 = conv2(I,H1); 
% Konvertieren auf 8 Bit-Pixel
I_out1_byte = uint8(I_out1);
% Anzeigen
subplot(2,2,2)
imshow(I_out1_byte); title('Nach gleitendem Mittelwert');

% Horizontale Anwendung der 1-dim. Impulsantwort h=[1 -1] auf 2-dim. Bild
H2hor = [ 1 -1]; 
I_out2hor = conv2(I,H2hor);
I_out2hor_byte = uint8(I_out2hor/2+127);

subplot(2,2,3)
imshow(I_out2hor_byte); title('Nach horizontaler Differenz');

% Vertikale Anwendung der 1-dim. Impulsantwort h=[1 -1] auf 2-dim. Bild
H2ver = [1 ; -1 ] ; 
I_out2ver = conv2(I,H2ver);
I_out2ver_byte = uint8(I_out2ver/2+127);

subplot(2,2,4)
imshow(I_out2ver_byte); title('Nach vertikaler Differenz');
