%% Basis Pictures

clearvars
InitializeDisplay
set(0,'defaultLineLineWidth',6) %thick lines

n1plot = 1e4;
n2plot = 500;
s_max = 4;
d = 2;
twoD = [1 1; 1 2; 1 3; 1 4; 2 2; 2 3];
nTwoD = size(twoD,1);
wvnum = 'i';

basisHandles = {@WalshBasis,@legendreBasis,@chebyshevBasis,@CosSinBasis};
basisNames = ["Walsh","Legendre","Chebyshev","CosineSine"];
%basisNames = ["Walsh"];
nBasis = length(basisNames);
aa = [0 -1 -1 0];
bb = [1 1 1 1];
for nB = 1:nBasis
   % One dimensional basis plots
   a = aa(nB);
   b = bb(nB);
   h1 = (b - a)/(n1plot-1);
   h2 = (b - a)/(n2plot-1);
   x1plot = [a:h1:b-h1 b - 100*eps];
   x2plot = [a:h2:b-h2 b - 100*eps];
   [xx, yy] = meshgrid(x2plot);
   horizOff = a + 0.15*(b-a);
   vertOff = 1.2;
   for s = 0:s_max
      y = basisHandles{nB}(s,x1plot);
      figure
      plot(x1plot,y,'-')
      axis([a b -1.2 1.2])
      set(gca,'Visible','off')
      text(horizOff,vertOff,['\boldmath\(' wvnum '\) \unboldmath \(= (' int2str(s) ', 0, \ldots, 0)\)'], ...
         'interpreter','latex','fontsize',48)
       eval(['print(''' char(basisNames(nB)) '_Degree_' int2str(s) '_' wvnum '.png'',' ...
          '''-dpng'')'])
      eval(['print(''' char(basisNames(nB)) '_Degree_' int2str(s) '_' wvnum '.eps'',' ...
         '''-depsc'', ''-opengl'')'])
      figure
      plot(x1plot,y,'-')
      axis([a b -1.2 1.2])
      set(gca,'Visible','off')
      text(horizOff + 0.25*(b-a),vertOff,['\(' wvnum ' = ' int2str(s) '\)'], ...
         'interpreter','latex','fontsize',48)
       eval(['print(''' char(basisNames(nB)) '_Degree_' int2str(s) '_1D_' wvnum '.png'',' ...
          '''-dpng'')'])
      eval(['print(''' char(basisNames(nB)) '_Degree_' int2str(s) '_1D_' wvnum '.eps'',' ...
         '''-depsc'', ''-opengl'')'])
  end
   
   %Two-dimensional basis plots
   xOff = a;
   yOff = a + 3*(b-a)/4;
   zOff = 2.2;
   for j = 1:nTwoD
      z = basisHandles{nB}(twoD(j,1),xx).*basisHandles{nB}(twoD(j,2),yy);
      figure
      surf(xx,yy,z); shading interp
      axis([a b a b -1.2 1.2])
      set(gca,'Visible','off')
      text(xOff,yOff,zOff,['\boldmath\(' wvnum '\) \unboldmath \(= (' int2str(twoD(j,1)), ...
         ',' int2str(twoD(j,2)) ', 0, \ldots, 0)\)'], ...
         'interpreter','latex','fontsize',48)
       eval(['print -dpng ' char(basisNames(nB)) '_Degree_' int2str(twoD(j,1)) ...
          '_' int2str(twoD(j,2)) '_' wvnum '.png'])
      eval(['print -depsc ' char(basisNames(nB)) '_Degree_' int2str(twoD(j,1)) ...
         '_' int2str(twoD(j,2)) '_' wvnum '.eps'])
   end
end


