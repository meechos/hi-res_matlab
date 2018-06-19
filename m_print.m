
function [] = m_print(width, height, res, fformat, fname, dir)
% % %    _____                       .__                   ____________________.___ __________________
% % %   /     \   ____   ____   ____ |  |__   ____  ______ \______   \______   \   |\      \__    ___/
% % %  /  \ /  \_/ __ \_/ __ \_/ ___\|  |  \ /  _ \/  ___/  |     ___/|       _/   |/   |   \|    |   
% % % /    Y    \  ___/\  ___/\  \___|   Y  (  <_> )___ \   |    |    |    |   \   /    |    \    |   
% % % \____|__  /\___  >\___  >\___  >___|  /\____/____  >  |____|    |____|_  /___\____|__  /____|   
% % %         \/     \/     \/     \/     \/           \/                    \/            \/           
% % % ©CCBY Dimitris Fotis Sakellariou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Print quality figures in MATLAB
% % Instrutions:
% 1. Add the m_print file to your pathdef.
% 2. Have the figure you desire to save highlighted (last figure you have clicked on - applies if multiple figures are open simultaneously).
% 3. Type m_print in your matlab prompt.
% 4. Fill-in the fields of the pop-up window.
%    IMPROTANT: in the formattype field, type the format extension alone e.g. 'jpeg'
%    Use any of the following available formats below:
%    _______________________________________________________________________________
%   |      'jpeg'     JPEG 24-bit	.jpg
%   |      'png'      PNG 24-bit	.png
%   |      'tiff'     TIFF 24-bit (compressed)	.tif
%   |      'tiffn'	  TIFF 24-bit (not compressed)	.tif
%   |      'meta' 	  Enhanced metafile (Windows only)	.emf
%   |      'bmpmono'  BMP Monochrome	.bmp
%   |      'bmp'      BMP 24-bit	.bmp
%   |      'bmp16m'	  BMP 24-bit	.bmp
%   |      'bmp256'	  BMP 8-bit (256 color, uses a fixed colormap)	.bmp
%   |      'hdf'      HDF 24-bit	.hdf
%   |      'pbm'      PBM (plain format) 1-bit	.pbm
%   |      'pbmraw'   PBM (raw format) 1-bit	.pbm
%   |      'pcxmono'  PCX 1-bit	.pcx
%   |      'pcx24b'	  PCX 24-bit color (three 8-bit planes)	.pcx
%   |      'pcx256'   PCX 8-bit newer color (256 color)	.pcx
%   |      'pcx16'    PCX older color (EGA/VGA 16-color)	.pcx
%   |      'pgm'      PGM (plain format)	.pgm
%   |      'pgmraw'   PGM (raw format)	.pgm
%   |      'ppm'      PPM (plain format)	.ppm
%   |      'ppmraw'	  PPM (raw format)	.ppm                           
%   |_______________________________________________________________________________
% 5. Choose yes in the popup window if you would like to modify fontsize
%    and titles
% 6. Choose destination folder
% Created: 25/10/2017 (Meechos)
% See also print, gcf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if (nargin<6)||isempty(dir), dir=pwd; end
if (nargin<5)||isempty(fname), fname='MyFigure'; end
if (nargin<4)||isempty(fformat), fformat='-dpng'; else fformat = strcat('-d',fformat); end % Plot power per frequency
if (nargin<3)||isempty(res), res='-r300';else res = strcat('-r',num2str(res)); end
if (nargin<2)||isempty(height)
    answer = inputdlg({'Width (cm)','Height (cm)','Resolution (dpi)','File Format (-help for available formats)','Filename'},'Print 666',1,{'15','15','300','png','Figure'});
    width = str2double(answer{1,1});
    height = str2double(answer{2,1});
    res = strcat('-r',answer{3,1});
    fformat = strcat('-d',answer{4,1});
    fname = answer{5,1};

btn = questdlg('Modify further?', ...
	'', ...
	'Yes','Nope', 'Nope');
switch btn
    case 'Yes'
     answer2 = inputdlg({'Fontsize','Figure Title','Colorbar Title'},'Specs',1,{'11','',''});   
     fsize = str2double(answer2{1,1});
     ftit = answer2{2,1};
     ctit = answer2{3,1};
     
     if isnan(ftit) title('');
     else          title(ftit,'FontSize',fsize+2);
                   h = findobj(gca,'type','axe');
                   h.FontSize= fsize+2;

     end
     set(gca, 'fontsize', fsize)
     if   isempty(ctit) colorbar('off')
     else c = colorbar; c.Label.String = ctit;
     end
end

dir = char; 
dir = uigetdir(dir,'>>>>>>>>>>>>> Select destination folder <<<<<<<<<<<<<');
if dir == 0 dir = pwd;
else end

end 

set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperPosition', [0 0 width height]);
print(fformat, res, strcat(dir,'/',fname,'_',num2str(width),'x',num2str(height)));
%EOF
