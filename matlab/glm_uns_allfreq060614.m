%glm_uns_allfreq060614.m

filename = 'glm_uns_allfreq060614.txt' %first line is the region1 nvox1 region 2 nvox2 ... 
ncond = 3 %fixation,open,closed

fid=fopen(filename);
line = fgetl(fid);
regnames = '';
plotnames = '';
while(any(line))
    [T1,line] = strtok(line);
    [T2,line] = strtok(line);
    regnames = strvcat(regnames,sprintf('%s %s',T1,T2));
    plotnames = strvcat(plotnames,sprintf('%s_%s',T1,T2));
end
regnames = strrep(cellstr(regnames),'_',' ');

%plotnames = cellstr(plotnames);
%plotnames = deblank(plotnames);

condstr = '';
freq = '';
data = '';
while 1
    line = fgetl(fid);
    if ~ischar(line), break, end
    R = strrep(line,'Hz',' ');
    [T1,R] = strtok(R);
    [T2,R] = strtok(R);
    freq = strvcat(freq,T1);
    condstr = strvcat(condstr,T2);
    data = strvcat(data,R);
end
fclose(fid);
regnames,condstr
freq = str2num(freq);
data = str2num(data);
mindata = min(min(data))
maxdata = max(max(data))

[m,nreg] = size(data)
ndataeach = m/ncond
i1 = zeros(1,ncond);
i2 = zeros(1,ncond);
for i=1:ncond
    i1(i) = (i-1)*ndataeach+1;
    i2(i) = i*ndataeach;
end
%i1,i2 
freq1 = freq(i1(1):i2(1));

ylabel = char('Root mean square amplitude power','        (percent change)        ');
for i=1:nreg
    fix = data(i1(1):i2(1),i);
    open = data(i1(2):i2(2),i);
    closed = data(i1(3):i2(3),i);
    figure
    plot(freq1,fix,'ro-','markersize',8,'linewidth',3), hold on
    plot(freq1,open,'gs-','markersize',8,'linewidth',3), hold on
    plot(freq1,closed,'bd-','markersize',8,'linewidth',3), hold on
    set(gca,'XScale','log','Yscale','log','XLim',[2.8e-3 0.14],'YLim',[0.075 1.7]','FontSize',16,...
       'Xlabel',text('String','Frequency (Hz)','FontSize',16), ...
       'Ylabel',text('String',ylabel,'FontSize',16))
    text(.01,1,regnames(i),'Color','k','FontSize',20)

    text(4e-3,0.2,'fixation','Color','r','FontSize',16)
    text(4e-3,0.17,'open','Color','g','FontSize',16)
    text(4e-3,0.14,'closed','Color','b','FontSize',16)

    plot(3.5e-3,0.2025,'ro','markersize',8,'linewidth',3), hold on
    plot(3.5e-3,0.1725,'gs','markersize',8,'linewidth',3), hold on
    plot(3.5e-3,0.1425,'bd','markersize',8,'linewidth',3)

    print('-dtiff',deblank(plotnames(i,:)))
end
