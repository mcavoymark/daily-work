x = 0:pi/15:2*pi;
y1 = cos(x);
y2 = sin(x);
plot(x,y1,'-k*',x,y2,'-.bo','markersize',12,'linewidth',3)
set(gca,'xticklabel',[],'yticklabel',[],'box','off','XLim',[0-pi/15 2*pi+pi/15])
print('-dtiff','cycle1')
figure
y1 = cos(2*x);
y2 = sin(2*x);
plot(x,y1,'-k*',x,y2,'-.bo','markersize',12,'linewidth',3)
set(gca,'xticklabel',[],'yticklabel',[],'box','off','XLim',[0-pi/15 2*pi+pi/15])
print('-dtiff','cycle2')
figure
y1 = cos(3*x);
y2 = sin(3*x);
plot(x,y1,'-k*',x,y2,'-.bo','markersize',12,'linewidth',3)
set(gca,'xticklabel',[],'yticklabel',[],'box','off','XLim',[0-pi/15 2*pi+pi/15])
print('-dtiff','cycle3')
