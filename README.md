# m_print
### Print quality figures in MATLAB via GUI
---------------------------------
m_print saves the current figure to a file using the specified file format, dimensions and resolution. 
Specify name and destination folder.
Modify further in order to redefine font sizes and legend for your figure.

Instructions:
---------------------------------
1. Add the m_print file to your pathdef.

2. Have the figure you desire to save highlighted (last figure you have clicked on - applies if multiple figures are open simultaneously).

3. Type m_print in your matlab prompt.

4. Fill-in the fields of the pop-up window.
   IMPROTANT: in the formattype field, type the format extension alone e.g. 'jpeg'
   Use any of the following available formats below:
'jpeg'     JPEG 24-bit	.jpg

'png'      PNG 24-bit	.png

'tiff'     TIFF 24-bit (compressed)	.tif

'tiffn'	  TIFF 24-bit (not compressed)	.tif

'meta' 	  Enhanced metafile (Windows only)	.emf

'bmpmono'  BMP Monochrome	.bmp

'bmp'      BMP 24-bit	.bmp

'bmp16m'	  BMP 24-bit	.bmp

'bmp256'	  BMP 8-bit (256 color, uses a fixed colormap)	.bmp

'hdf'      HDF 24-bit	.hdf

'pbm'      PBM (plain format) 1-bit	.pbm

'pbmraw'   PBM (raw format) 1-bit	.pbm

'pcxmono'  PCX 1-bit	.pcx

'pcx24b'	  PCX 24-bit color (three 8-bit planes)	.pcx

'pcx256'   PCX 8-bit newer color (256 color)	.pcx

'pcx16'    PCX older color (EGA/VGA 16-color)	.pcx

'pgm'      PGM (plain format)	.pgm

'pgmraw'   PGM (raw format)	.pgm

'ppm'      PPM (plain format)	.ppm

'ppmraw'	  PPM (raw format)	.ppm  


5. Choose yes in the popup window if you would like to modify fontsize
   and titles.
   
6. Choose destination folder.
