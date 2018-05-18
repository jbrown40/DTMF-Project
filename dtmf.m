% Jessica Brown
% Digital Signal Processing
% Methodology:
%   We read in a 7 second recording and than we split it into 7 equal parts
% so we have a recording of every tone. Than we convert these tones to
% the frequency domain by taking the fast fourier transform and we cut 
% the graph in half to remove the mirrored values in the fft. Using the y-
% axis of the fft graph, we figure out where the max is for one tone by 
% looking at its corresponding x value, which is on the frequency axis. 
% Than we cut the graph to 1000 Hz because all the row values are less 
% than 1000, and we find the max of the edited graph, which is our row
% value. We pass these results through some if statements to see which 
% two frequencies correspond to the correct number, and then we print the
% number out. 
clear all;
close all;

recobj= audiorecorder;%creates object for recording audio
disp('start recording');
recordblocking(recobj,7);%7 seconds of audio will be read in
disp('stop recording');
play(recobj);
y= getaudiodata(recobj);
N=length(y);%length of audio file

% TODO: extract 7 tones from audio signal
y1= y(1: N/7);
y2= y(N/7+1: 2*N/7);
y3=y(2*N/7 + 1: 3*N/7);
y4=y(3*N/7 +1: 4*N/7);
y5=y(4*N/7 +1:5*N/7);
y6=y(5*N/7 +1: 6*N/7);
y7=y(6*N/7 +1: 7*N/7);

% TODO: take the fft of all 7 tones
yf1 = abs(fft(y1));
yf1 = yf1(1:ceil(length(yf1)/2));%removes mirrored half of fft
freqHz1 = (0:1:length(yf1)-1)*48000/length(y1);%converts x-axis from 
%indices to frequency

yf2 = abs(fft(y2));
yf2 = yf2(1:ceil(length(yf2)/2));
freqHz2 = (0:1:length(yf2)-1)*48000/length(y2);

yf3 = abs(fft(y3));
yf3 = yf3(1:ceil(length(yf3)/2));
freqHz3 = (0:1:length(yf3)-1)*48000/length(y3);

yf4 = abs(fft(y4));
yf4 = yf4(1:ceil(length(yf4)/2));
freqHz4 = (0:1:length(yf4)-1)*48000/length(y4);

yf5 = abs(fft(y5));
yf5 = yf5(1:ceil(length(yf5)/2));
freqHz5 = (0:1:length(yf5)-1)*48000/length(y5);

yf6 = abs(fft(y6));
yf6 = yf6(1:ceil(length(yf6)/2));
freqHz6 = (0:1:length(yf6)-1)*48000/length(y6);

yf7 = abs(fft(y7));
yf7 = yf7(1:ceil(length(yf7)/2));
freqHz7 = (0:1:length(yf7)-1)*48000/length(y7);


% TODO: find min and max of graphs
col1=max(yf1);%identifies highest amplitude on fft
ycol1 = find(yf1==col1); %corresponding x value which is column frequency
f1 = yf1(1:1000);%now the max value on the graph is the row value
freq1 = (0:1:length(f1)-1)*48000/length(y1);
row1=max(f1);
yrow1=find(f1==row1);%finds row value which is the second frequency

col2=max(yf2);
ycol2 = find(yf2==col2); %this will be the column frequency
f2 = yf2(1:1000);
freq2 = (0:1:length(f2)-1)*48000/length(y2);
plot(freq2,f2);
row2=max(f2);
yrow2=find(f2==row2);%this will give the row frequency

col3=max(yf3);
ycol3 = find(yf3==col3); %this will be the column frequency
f3 = yf3(1:1000);
freq3 = (0:1:length(f3)-1)*48000/length(y3);
plot(freq3,f3);
row3=max(f3);
yrow3=find(f3==row3);%this will give the row frequency
% 
col4=max(yf4);
ycol4 = find(yf4==col4); %this will be the column frequency
f4 = yf4(1:1000);
freq4 = (0:1:length(f4)-1)*48000/length(y4);
plot(freq4,f4);
row4=max(f4);
yrow4=find(f4==row4);%this will give the row frequency
% 
col5=max(yf5);
ycol5 = find(yf5==col5); %this will be the column frequency
f5 = yf5(1:1000);
freq5 = (0:1:length(f5)-1)*48000/length(y5);
plot(freq5,f5);
row5=max(f5);
yrow5=find(f5==row5);%this will give the row frequency
% 
col6=max(yf6);
ycol6 = find(yf6==col6); %this will be the column frequency
f6 = yf6(1:1000);
freq6 = (0:1:length(f6)-1)*48000/length(y6);
plot(freq6,f6);
row6=max(f6);
yrow6=find(f6==row6);%this will give the row frequency
% 
col7=max(yf7);
ycol7 = find(yf7==col7); %this will be the column frequency
f7 = yf7(1:1000);
freq7 = (0:1:length(f7)-1)*48000/length(y7);
plot(freq7,f7);
row7=max(f7);
yrow7=find(f7==row7);%this will give the row frequency

% this detects the tones using logic to output which number is being
% pressed
    if ycol1>1200 && ycol1<1220
        if yrow1>690 && yrow1<710
            disp('1');
        elseif yrow1>760 && yrow1<780
            disp('4');
        elseif yrow1>845 && yrow1<860
            disp('7');
        elseif yrow1>930 && yrow1<950
            disp('*');
        end
    elseif  ycol1>1310 && ycol1<1350
         if yrow1>690 && yrow1<710
            disp('2');
        elseif yrow1>760 && yrow1<780
            disp('5');
        elseif yrow1>845 && yrow1<860
            disp('8');
        elseif yrow1>930 && yrow1<950
            disp('0');
        end
    elseif  ycol1>1450 && ycol1<1480
         if yrow1>690 && yrow1<710
            disp('3');
        elseif yrow1>760 && yrow1<780
            disp('6');
        elseif yrow1>845 && yrow1<860
            disp('9');
        elseif yrow1>930 && yrow1<950
            disp('#');
        end
    end
    
    if ycol2>1200 && ycol2<1220
        if yrow2>690 && yrow2<710
            disp('1');
        elseif yrow2>760 && yrow2<780
            disp('4');
        elseif yrow2>845 && yrow2<860
            disp('7');
        elseif yrow2>930 && yrow2<950
            disp('*');
        end
    elseif  ycol2>1310 && ycol2<1350
         if yrow2>690 && yrow2<710
            disp('2');
        elseif yrow2>760 && yrow2<780
            disp('5');
        elseif yrow2>845 && yrow2<860
            disp('8');
        elseif yrow2>930 && yrow2<950
            disp('0');
        end
    elseif  ycol2>1450 && ycol2<1480
         if yrow2>690 && yrow2<710
            disp('3');
        elseif yrow2>760 && yrow2<780
            disp('6');
        elseif yrow2>845 && yrow2<860
            disp('9');
        elseif yrow2>930 && yrow2<950
            disp('#');
        end
    end
    
    if ycol3>1200 && ycol3<1220
        if yrow3>690 && yrow3<710
            disp('1');
        elseif yrow3>760 && yrow3<780
            disp('4');
        elseif yrow3>845 && yrow3<860
            disp('7');
        elseif yrow3>930 && yrow3<950
            disp('*');
        end
    elseif  ycol3>1310 && ycol3<1350
         if yrow3>690 && yrow3<710
            disp('2');
        elseif yrow3>760 && yrow3<780
            disp('5');
        elseif yrow3>845 && yrow3<860
            disp('8');
        elseif yrow3>930 && yrow3<950
            disp('0');
        end
    elseif  ycol3>1450 && ycol3<1480
         if yrow3>690 && yrow3<710
            disp('3');
        elseif yrow3>760 && yrow3<780
            disp('6');
        elseif yrow3>845 && yrow3<860
            disp('9');
        elseif yrow3>930 && yrow3<950
            disp('#');
        end
    end
    
    if ycol4>1200 && ycol4<1220
        if yrow4>690 && yrow4<710
            disp('1');
        elseif yrow4>760 && yrow4<780
            disp('4');
        elseif yrow4>845 && yrow4<860
            disp('7');
        elseif yrow4>930 && yrow4<950
            disp('*');
        end
    elseif  ycol4>1310 && ycol4<1350
         if yrow4>690 && yrow4<710
            disp('2');
        elseif yrow4>760 && yrow4<780
            disp('5');
        elseif yrow4>845 && yrow4<860
            disp('8');
        elseif yrow4>930 && yrow4<950
            disp('0');
        end
    elseif  ycol4>1450 && ycol4<1480
         if yrow4>690 && yrow4<710
            disp('3');
        elseif yrow4>760 && yrow4<780
            disp('6');
        elseif yrow4>845 && yrow4<860
            disp('9');
        elseif yrow4>930 && yrow4<950
            disp('#');
        end
    end
    
    if ycol5>1200 && ycol5<1220
        if yrow5>690 && yrow5<710
            disp('1');
        elseif yrow5>760 && yrow5<780
            disp('4');
        elseif yrow5>845 && yrow5<860
            disp('7');
        elseif yrow5>930 && yrow5<950
            disp('*');
        end
    elseif  ycol5>1310 && ycol5<1350
         if yrow5>690 && yrow5<710
            disp('2');
        elseif yrow5>760 && yrow5<780
            disp('5');
        elseif yrow5>845 && yrow5<860
            disp('8');
        elseif yrow5>930 && yrow5<950
            disp('0');
        end
    elseif  ycol5>1450 && ycol5<1480
         if yrow5>690 && yrow5<710
            disp('3');
        elseif yrow5>760 && yrow5<780
            disp('6');
        elseif yrow5>845 && yrow5<860
            disp('9');
        elseif yrow5>930 && yrow5<950
            disp('#');
        end
    end
    
    if ycol6>1200 && ycol6<1220
        if yrow6>690 && yrow6<710
            disp('1');
        elseif yrow6>760 && yrow6<780
            disp('4');
        elseif yrow6>845 && yrow6<860
            disp('7');
        elseif yrow6>930 && yrow6<950
            disp('*');
        end
    elseif  ycol6>1310 && ycol6<1350
         if yrow6>690 && yrow6<710
            disp('2');
        elseif yrow6>760 && yrow6<780
            disp('5');
        elseif yrow6>845 && yrow6<860
            disp('8');
        elseif yrow6>930 && yrow6<950
            disp('0');
        end
    elseif  ycol6>1450 && ycol6<1480
         if yrow6>690 && yrow6<710
            disp('3');
        elseif yrow6>760 && yrow6<780
            disp('6');
        elseif yrow6>845 && yrow6<860
            disp('9');
        elseif yrow6>930 && yrow6<950
            disp('#');
        end
    end
    
    if ycol7>1200 && ycol7<1220
        if yrow7>690 && yrow7<710
            disp('1');
        elseif yrow7>760 && yrow7<780
            disp('4');
        elseif yrow7>845 && yrow7<860
            disp('7');
        elseif yrow7>930 && yrow7<950
            disp('*');
        end
    elseif  ycol7>1310 && ycol7<1350
         if yrow7>690 && yrow7<710
            disp('2');
        elseif yrow7>760 && yrow7<780
            disp('5');
        elseif yrow7>845 && yrow7<860
            disp('8');
        elseif yrow7>930 && yrow7<950
            disp('0');
        end
    elseif  ycol7>1450 && ycol7<1480
         if yrow7>690 && yrow7<710
            disp('3');
        elseif yrow7>760 && yrow7<780
            disp('6');
        elseif yrow7>845 && yrow7<860
            disp('9');
        elseif yrow7>930 && yrow7<950
            disp('#');
        end
    end
    
    if ycol7>1200 && ycol7<1220
        if yrow7>690 && yrow7<710
            disp('1');
        elseif yrow7>760 && yrow7<780
            disp('4');
        elseif yrow7>845 && yrow7<860
            disp('7');
        elseif yrow7>930 && yrow7<950
            disp('*');
        end
    elseif  ycol7>1310 && ycol7<1350
         if yrow7>690 && yrow7<710
            disp('2');
        elseif yrow7>760 && yrow7<780
            disp('5');
        elseif yrow7>845 && yrow7<860
            disp('8');
        elseif yrow7>930 && yrow7<950
            disp('0');
        end
    elseif  ycol7>1450 && ycol7<1480
         if yrow7>690 && yrow7<710
            disp('3');
        elseif yrow7>760 && yrow7<780
            disp('6');
        elseif yrow7>845 && yrow7<860
            disp('9');
        elseif yrow7>930 && yrow7<950
            disp('#');
        end
    end


 

