function Plot_graph_one (ax,h,moisture,starttime,toc)

addpoints(h,toc,moisture); % Live updating grah
ax.XLim = [starttime toc];
drawnow

end
