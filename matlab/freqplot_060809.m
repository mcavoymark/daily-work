%glm_uns_allfreq060614.m

subject_title = 'np600new glm\_resid060809 cluster3'
subject = 'glm_resid060809'

filename = '/home/hannah/mcavoy/np600new/glm_resid060809/97-100x_oddsplus16.txt'

ncond = 2 %fixation,closed

fid=fopen(filename);
line = fgetl(fid);
regnames = '';
while(any(line))
    [T1,line] = strtok(line);
    [T2,line] = strtok(line);
    regnames = strvcat(regnames,sprintf('%s %s',T1,T2));
end
regnames = strrep(cellstr(regnames),'_',' ');

freq = '';
condstr = '';
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
freq = str2num(freq);
condstr = cellstr(condstr)
data = str2num(data);
mindata = min(min(data))
maxdata = max(max(data))

[m,nreg] = size(data)
ndataeach = m/ncond
i1 = zeros(1,ndataeach);
j = 1
for i=1:ndataeach
    i1(i) = j;
    j = j + ncond;
end
i1
freq1 = freq(i1);

ylabel = char('Root mean square amplitude power','        (percent change)        ');
for i=1:nreg
    r1 = data(i1,i);
    r2 = data(i1+1,i);

    figure
    plot(freq1,r1,'ro-','markersize',8,'linewidth',3), hold on
    plot(freq1,r2,'bd-','markersize',8,'linewidth',3), hold on
    set(gca,'XScale','log','Yscale','log','XLim',[2.8e-3 0.14],'YLim',[0.075 1.7]','FontSize',16,...
       'Xlabel',text('String','Frequency (Hz)','FontSize',16), ...
       'Ylabel',text('String',ylabel,'FontSize',16))
    text(.003,1,regnames(i),'Color','k','FontSize',16)

    text(.06,1,condstr(1),'Color','r','FontSize',16)
    text(.06,.85,condstr(2),'Color','b','FontSize',16)

    plot(.055,1.01,'ro','markersize',8,'linewidth',3), hold on
    plot(.055,.86,'bd','markersize',8,'linewidth',3)


    title(subject_title);
    y = strcat(subject,'_',deblank(regnames(i,:)))
    print('-dtiff',char(strrep(y,' ','_')))
end
