t = 0:0.001:20; %χρονικο βημα
x = 5*cos(1000*pi*t)+cos(4000*pi*t); %"συνεχης" συναρτηση 
n = 0:0.1:20; %αριθμος samples
xn = 5*cos(10*pi*n)+cos(40*pi*n); % διακριτη συναρτηση
figure(1);
subplot(2,1,1);
plot(t,x);
title('Analog signal')
ylabel('x(t)')
xlabel('t(s)')
subplot(2,1,2);
stem(n,xn);
title('Sampled signal')
ylabel('xn(n)')
xlabel('n')

xn_min = min(xn); %ελάχιστο της συνάρτησης 
xn_max = max(xn); %μέγιστο της συνάρτησης 
prompt = "Πόσα να είναι τα επίπεδα κβάντισης ";
N = input(prompt);
if N==4.0 %περίπτωση για 4 σημεία κβάντισης
    quantized_levels = linspace(xn_min, xn_max, N);
    [~, q] = min(abs(xn - quantized_levels'), [], 1); %εύρεση πλησιέστερου σημείου κβάντισης 
    xn_quantized = quantized_levels(q); 

    mse = mean((xn - xn_quantized).^2);
    fprintf('mean squared error για 4 επίπεδα : %.4f\n', mse); 
    %αν βγαίνει πολύ κοντά στο 0 τότε κάνει πολύ καλό match το κβαντισμένο
    %σήμα με το αρχικό
end

if N==8.0 %περίπτωση για 8 σημεία κβάντισης
    quantized_levels = linspace(xn_min, xn_max, N);
    [~, q] = min(abs(xn - quantized_levels'), [], 1); 
    xn_quantized = quantized_levels(q); 

    mse = mean((xn - xn_quantized).^2);
    fprintf('mean squared error για 8 επίπεδα : %.4f\n', mse); 
end

if N==16.0 %περίπτωση για 16 σημεία κβάντισης
    quantized_levels = linspace(xn_min, xn_max, N);
    [~, q] = min(abs(xn - quantized_levels'), [], 1); 
    xn_quantized = quantized_levels(q); 

    mse = mean((xn - xn_quantized).^2);
    fprintf('mean squared error για 16 επίπεδα : %.4f\n', mse); 
end 



