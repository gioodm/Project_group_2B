function [avg_peakSize, avg_width, sd_peak] = peak_width(AP)
time = 0:0.00005:2;
avg_peakSize = zeros(1,size(AP,1));
avg_width = zeros(1,size(AP,1));
sd_peak = zeros(1,size(AP,1));
for j = 1:size(AP,1)
    AP_j = AP{j,1};
    peaks = zeros(1,size(AP_j,2));
    width = zeros(1,size(AP_j,2));
    for i = 1:size(AP_j,2)
        peaks(i) = max(AP_j(:,i));
        loc = find((AP_j(:,i) < 0.499*(peaks(i)-72))&(AP_j(:,i) > 0.501*(peaks(i)-72)));
        width(i) = time(loc(end)) - time(loc(1));
    end
    avg_peakSize(j) = mean(peaks);
    avg_width(j) = mean(width);
    sd_peak(j) = std(peaks);
end
end

