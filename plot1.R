plot1 <- function(){
    # Exploratory Data Analysis - Project 1

    # LOADING DATA
    # The dataset has 2,075,259 rows and 9 columns. 
    # However, only the data from the dates 2007-02-01 and 2007-02-02 are of intersted.
    n <- 66637     # start of 2007-02-01
    m <- 69516     # end   of 2007-02-02
    filein <- "household_power_consumption.txt"

    #read only the rows from n to m
    power_consuption <- read.table(filein, skip=n, nrows=m-n+1, sep=";",na.strings = "?") 

    # read file header
    tmp_file <- read.table(filein,skip=-1,nrows=1,sep=";",header=TRUE) 
    # assigh the names to the columns
    names(power_consuption) <- names(tmp_file)

    # Plot 1
    quartz(bg = "white")   # open screen device
    
    # Create the plot with attributes
    with(power_consuption, hist(Global_active_power, 
                            col = "red",
                            xlab = "Global Active Power (kilowatts)",
                            main = "Global Active Power") )
    
    # Save plot1 in a PNG file
    dev.copy( png, file = "plot1.png", bg = "white", width = 480, height = 480 )
    
    dev.off()     # close PNG devce
    dev.off()     # close QUARTZ devce
}