function [avg_peakSize, sd_peakSize, avg_width, sd_width, peak_width_ratio, avg_peakArea, sd_peakArea] = peak_widthArea(AP)
%
% Author: Jarno
%
% *peak area: calculation added by max, 16/JUN/22
%
time = 0:0.00005:2;
avg_peakSize = zeros(1,size(AP,1));
sd_peakSize= zeros(1,size(AP,1));
avg_width = zeros(1,size(AP,1));
sd_width = zeros(1,size(AP,1));
peak_width_ratio = zeros(1,size(AP,1));
avg_peakArea = zeros(1,size(AP,1)); % *peak area
sd_peakArea = zeros(1,size(AP,1)); % *peak area

for j = 1:size(AP,1)
    AP_j = AP{j,1};
    peaks = zeros(1,size(AP_j,2));
    width = zeros(1,size(AP_j,2));
    area = zeros(1, size(AP_j,2)); % *peak area
    for i = 1:size(AP_j,2)
        peaks(i) = max(AP_j(:,i));
        loc = find((AP_j(:,i) < 0.499*(peaks(i)-72))&(AP_j(:,i) > 0.501*(peaks(i)-72)));
        width(i) = time(loc(end)) - time(loc(1));
        
        % *peak area
        % set start point for integration at 1 step before voltage+72 > 0
        integ_lower = find(AP_j(:,i)+72 > 0, 1, 'first')-1; 
        % integ_lower = find(AP_j(:,i)+72 >= 0.001, 1, 'first'); 
        % set end point for integration where descending voltage+72 of the AP hits 0 again
        integ_upper = find(AP_j(:,i)+72 >= 0, 1, 'last'); 
        % integrate from t=0 to t(area_locEnd)
        area(i) = trapz(time(integ_lower:integ_upper), AP_j(integ_lower:integ_upper,i)+72);
    end
    avg_peakSize(j) = mean(peaks);
    avg_width(j) = mean(width);
    sd_peakSize(j) = std(peaks);
    sd_width(j) = std(width);

    peak_width_ratio(j) = mean(peaks./width);

    % *peak area
    avg_peakArea(j) = mean(area); 
    sd_peakArea(j) = std(area);

end

