%Proyecto final parte 1
fileID=fopen('ECG_recording.eeg','r'); %Archivo formato .egg
fileid=fopen('ECG_recording.bni','r'); %Archivo formato .bni
y1=f_GetSignalsNico('ECG_recording.eeg','Fp1');
fr=256; %Frecuencia toma de datos, o sea 256 datos/segundo
tiempoTotal= round(numel(y1)/fr);
vTiempo=zeros(1,tiempoTotal);
for i=1:tiempoTotal
    vTiempo(i)=i;
end
