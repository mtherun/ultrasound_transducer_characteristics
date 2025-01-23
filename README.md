1. Context
This report documents the practical session 2 of the non-destructive testing – in detail the pulse-echo measurements and material characterization measurement carried out in lab during the Ultrasound course, for the academic year 2023.
2. Matching layer design
2.1 Practical activity 1
We have chosen sample 2 and 3 to perform the pulse echo measurements. A pulse echo measurement is carried out by placing the transducer on top of the metal/epoxy resin sample with ultrasound gel as a binder between the two. The ultrasound gel is used for a smooth transmission between the transducer and the sample, to avoid any air in between the materials and therefore a more accurate measurement. We connect the transducer to the laptop and simulate using the software, US key. The transducer produces a signal which is transmitted through the sample material and is reflected from the bottom of the sample. The scan of sample 2 using US Key can be seen in Figure 1.
Figure 1 US Key Software using sample 2 with 500kHz V189-RB transducer.
Session 2 Ultrasound
3
US Key software detects the echo that is sent from the transducer and displays the percentage of amplitude against the time. The displayed waveform is exported and stored in a several formats for further use. We use the .csv format file and load our exported file onto MATLAB. We can determine the time delay between two signals using the gate functionality within the US key software. The peak values obtained from CSV were however used to calculate the delay between two successive echoes.
This yielded us a velocity of 6272.28m/s for sample 2 (detailed calculation can be taken from the MATLAB code which is given in the appendix). Measured velocity for the sample 2 meets the similar speed as the materials mentioned below:
• Aluminum
6420m/s
• Duralumin
6320m/s
• Molybdenum
250m/s
• Tungsten carbide
6655m/s
Our sample appears to be yellow in color so our assumption is that this could be an alloy with a slight percentage of copper.
The measurement for sample 3 was faulty. As a result, the velocity could not be determined. The cause can be transducer, which cannot send pulses through this material due to high impedance, lack of ultrasound gel or, due to properties of the material for example, in this case sample 3 might be more porous than sample 2. We’ve deliberated an error in the working of the test equipment in addition to human error during experimentation. There could be a deviation because of the two.
Figure 2 Measurement results of sample 2 (left) and sample 3 (right)
Session 2 Ultrasound
4
2.2 Practical activity 2
We performed similar measurements using sample 6 as in activity 1 (Figure3).
For sample 6, velocity which corresponds to 3426.12 m/s could be obtained.
The acoustic impedance of sample 6 is calculated using Z=rho*c= 5824411.13 Rayls.
The design for the matching layer of PIC255 considers the propagation medium to be water. The matching layer has an impedance equivalent to the mean average of the piezo electric transducer and water in this scenario.
The specifications of the transducer were provided through the datasheet and from Lab session 1. The acoustic impedance of the piezo electric is 27456000 Rayls and that of water is 1500000 Rayls. The matching layer’s impedance is calculated using the following formula:
The acoustic impedance of the newly designed matching layer is 6417476.14 Rayls.
The thickness of the matching layer would be 8.57e-04 m.
Finally, we calculate the relative difference in percentage between the impedance of an ideal matching layer and the impedance of the sample 6.
This gives us a difference of 9.2%.
This can be explained as the difference due to calculation errors. Here, we’ve considered only one peak. If we were able to get a definitive value of the signals, the mean average could account to a lesser difference. The transducer that is considered for experiment and the transducer used for design are not the same, so there are differences introduced by that along with some losses in the material (manufacturing process-3D printing).
Figure 3 Measurement results sample 6.
Session 2 Ultrasound
5
2.3 Practical activity 3
We repeat the measurement procedure from activity 1 using two different transducers with different central working frequencies (500khz and 1Mhz) for sample 7.
Figure 4 Results of sample 7 for different transducers.
Figure 5 Results of sample 7 overlayed.
Session 2 Ultrasound
6
We overlay the behavior of the echoes in a single plot for sample 7 to obtain a comparison between the two transducers. There is a difference in amplitude and time-period for all the echoes. The difference in time-period is due to the frequency being an inverse of time. The 500kHz transducer has a higher time-period than the 1MHz transducer. The difference in amplitude is due to propagation loss of the signal in the matching layer and then the loss that occurs in the backing of the transducer where the echoes are detected. Attenuation in acoustics is the energy loss of sound propagation in media. We can calculate the attenuation using the following formula: 𝐴𝑡𝑡𝑒𝑛𝑢𝑎𝑡𝑖𝑜𝑛 (𝑑𝐵)=10∗log 𝐼𝑛𝑝𝑢𝑡 𝑖𝑛𝑡𝑒𝑛𝑠𝑖𝑡𝑦𝑂𝑢𝑡𝑝𝑢𝑡 𝑖𝑛𝑡𝑒𝑛𝑠𝑖𝑡𝑦
Attenuation is a function of frequency. We do not have all the data required to calculate attenuation. However, considering only the peak amplitudes and assuming the transducer to emits signals with central frequency, we consider the input intensity to be the square of the peak of the first echo and the output intensity to be the square of the peak of the second echo. As a result, the attenuation in 500kHz transducer is 12.63 dB and the attenuation in 1MHz transducer is 17.71 dB.
3. Conclusion
The following picture shows a transducer used in ultrasound. It is important to design a proper ultrasound transducer for each application. Different materials can have different speed of sound. A Matching layer is necessary to match the impedances of two mediums. Two different transducers can have different attenuations due to the change in the central working frequency.
Figure 6 Showing an ultrasound transducer, copyright by https://www.vetfolio.com/learn/article/basic-principles-of-ultrasonography.
Session 2 Ultrasound
7
4. Appendix
Matlab code :
clc
clear all
myFolder = 'C:\Users\'; %pathname; % specify the path of the folder where the files subside
filePattern = fullfile(myFolder, '*.csv');
theFiles = dir(filePattern);
d=zeros(7,7);
width=[7.07 7.07 10 10 10];
figure(1)
tiledlayout(2,3)
tn=["Sample 3 with 500KHz Transducer","Sample 2 with 500KHz Transducer","Sample 6 with 500KHz Transducer","Sample 7 with 1MHz Transducer","Sample 7 with 500KHz Transducer"];
for k = 1 : length(theFiles)
baseFileName = theFiles(k).name;
fullFileName = fullfile(theFiles(k).folder, baseFileName);
x=load(fullFileName);
div=length(x)/10;
time=0:1:length(x)-1;
time=time*width(k)/div;
% subplot(2,4,k)
nexttile
plot(time,(100*(x-max(x)/2)/(max(x)/2)))
xlabel("Time in us")
ylabel("Amplitude in %")
title(sprintf("%s"),tn(k));
end
fl=length(theFiles);
%% Activity 1
%sample 2
t11=2.12825*10^-5;
t12=4.04143*10^-5;
l=60*10^-3;
v1=2*l/(t12-t11);
fprintf("The velocity of sample 2 is %.2f m/s \n \n", v1);
%sample 2
fprintf("The echoes were not registered properly in the sample 3\n \n");
%% Activity2
x=load("Activity_2_Sample_6.csv");
time=0:1:length(x)-1;
div=length(x)/10;
Session 2 Ultrasound
8
time=time*10/div;
figure(2);
plot(time,(100*(x-max(x)/2)/(max(x)/2)),[20.775 20.775],[-100 70.4],'--',[38.2875 38.2875],[-100 23.28],'--');
text(17,75,'Arrival time 1');
text(36,28,'Arrival time 2');
xlabel("Time in us")
ylabel("Amplitude in %")
title("Sample 6 with 500kHz Transducer")
l2=30*10^-3;
t31=2.0775*10^-5;
t32=3.82875*10^-5;
v2=2*l2/(t32-t31);
fprintf("The velocity of sample 6 is %.2f m/s \n ", v2);
rho=1700;
z1=rho*v2;
fprintf("The acoustic impedance of sample 6 is %.2f Rayls \n ", z1);
zw=1000*1500;
zp=7800*3520;
zm=sqrt(zp*zw);
fprintf("The acoustic impedance of matching layer is %.2f Rayls \n", zm);
ft=10^6; %r theoretocal frequency
wavelength=v2/(4*ft);
fprintf("The thickness of the matching layer is %.2d m \n", wavelength);
rd=100*(zm-z1)/zm;
fprintf("The relative difference of the matching layers is %.1f percent \n \n", rd);
%% Activity 3
x=load("Activity_3_500kHz.csv");
y=load("Activity_3_1MHz.csv");
t1=0:1:length(x)-1;
t2=0:1:length(y)-1;
div1=length(x)/10;
div2=length(y)/10;
t1=t1*10/div1;
t2=t2*10/div2;
figure(3)
plot(t1,(100*(x-max(x)/2)/(max(x)/2)),t2,(100*(y-max(y)/2)/(max(y)/2)))
xlabel("Time in us")
ylabel("Amplitude in %")
title("Sample 7 with 500kHz and 1MHz Transducer")
legend("500kHz transducer V189-RB - Sample 7 ", "1MHz Transducer V392 - Sample 7")
Attenuation_500=10*log10((69.9732^2)/(16.3539^2));
Attenuation_1M=10*log10((67.0966^2)/(8.73692^2));
fprintf("The attenuation in 500kHz tranducer is %.2f dB and the attenuation in 1MHz transducer is %.2f dB \n\n",Attenuation_500,Attenuation_1M);
