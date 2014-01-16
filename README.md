raman-to-pdf
============

This R script takes a .asc data file from our Raman microscope and plots each measured frame as a line plot and saves it as a .pdf

Call the function:

<pre><code>plot_raman_shift(filepath, laser-wavelength)</code></pre>

filepath should be the path to the .asc file in quotes.

The second argument is optional and can be implemented for a custom wavelength given in nm. The default wavelength is <b>632.6nm</b>.

This function will generate pdfs inside the same directory as the source data file.

Written by [Ben Miles](http://twitter.com/bennmiles) part of the [Edel group](http://imperial.ac.uk/edelgroup) at Imperial College London.
