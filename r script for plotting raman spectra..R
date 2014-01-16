

# This is the main function that plots all frames of data collected from the spectrometer.
# Accepts path to .asc file and a second argument the laser wavelength in (nm).
plot_raman_shift <- function(path, wavelength=632.8) {
  filepath <- path
  # Define the wavelength of the incident laser.
  lambda_incident <- wavelength
  print(lambda_incident)
  # Import the .asc file from the spectrometer.
  d <- read.delim(filepath, header=F)
  # Initialise the iterator counter for .pdf naming.
  i <- 0
  # This function plots each frame from the imported dataset and saves it as a .pdf
  plot_raman_shift_frame <- function(col) {
    # Construct the graph file name with interpolation.
    newFileName <- paste(filepath, i, ".pdf")
    # Start PDF device driver to save output to figure.pdf
    pdf(file=newFileName, paper="a4r", width=9)
    # Adjust the margins and axis label positions.
    par(mar = c(6.5, 6.5, 5, 2), mgp = c(4, 1, 0))
    plot(((1/lambda_incident)-(1/d$V1))*10^7, col,type="l", col="blue",ylim=NULL,ann=FALSE, axes=FALSE)
    
    #These commands label the axes.
    axis(1, las=1, at=200*-800:max(d$V1))
    axis(2, las=1, at=5000*0:max(col))
    
    # Maximum string length for a single line.
    maxLength <- 65
    graphTitle <- paste(strwrap(filepath, width = maxLength), "frame ", i, collapse = "\n")
    
    title(main=graphTitle, col.main="black", font.main=4)
    title(ylab="Intensity", col.lab="black")
    title(xlab="Raman Shift / cm^-1", col.lab="black")
    
    dev.off()
    i <<- i + 1
    print(i)
  }
  # Begin iterating over the frames in the dataview.
  apply(d, 2, plot_raman_shift_frame)
}
