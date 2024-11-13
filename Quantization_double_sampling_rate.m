n = 0:0.05:20; %αριθμος samples
xn = 5*cos(10*pi*n)+cos(40*pi*n); % διακριτη συναρτηση

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
    %mean squared error για 4 επίπεδα : 1.3854
end

if N==8.0 %περίπτωση για 8 σημεία κβάντισης
    quantized_levels = linspace(xn_min, xn_max, N);
    [~, q] = min(abs(xn - quantized_levels'), [], 1);
    xn_quantized = quantized_levels(q); 

    mse = mean((xn - xn_quantized).^2);
    fprintf('mean squared error για 8 επίπεδα : %.4f\n', mse);
    %mean squared error για 8 επίπεδα : 0.2545
end

if N==16.0 %περίπτωση για 16 σημεία κβάντισης
    quantized_levels = linspace(xn_min, xn_max, N);
    [~, q] = min(abs(xn - quantized_levels'), [], 1); 
    xn_quantized = quantized_levels(q); 

    mse = mean((xn - xn_quantized).^2);
    fprintf('mean squared error για 16 επίπεδα : %.4f\n', mse); 
    %mean squared error για 16 επίπεδα : 0.0554
end 
%εδώ παρατηρούμε πως τα σημεία κβάντισης δεν έκαναν τόσο καλό match με το
%σήμα οπότε το mse είναι /= του 0. Με περισσότερα επίπεδα κβάντισης τείνει
%προς το 0