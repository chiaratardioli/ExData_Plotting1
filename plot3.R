plot3 <- function(){
    # Exploratory Data Analysis - Project 1
    
    # LOADING DATA
    # The dataset has 2,075,259 rows and 9 columns. 
    # However, only the data from the dates 2007-02-01 and 2007-02-02 are of intersted.
    n <- 66637     # start of 2007-02-01
    m <- 69516     # end   of 2007-02-02
    filein <- "household_power_consumption.txt"
    
    #read only the rows from n to m
    power_consuption <- read.table(filein, skip=n, nrows=m-n+1, sep=";", na = "?") 
    
    # read file header
    tmp_file <- read.table(filein,skip=-1,nrows=1,sep=";",header=TRUE) 
    # assigh the names to the columns
    names(power_consuption) <- names(tmp_file)
    
    # Convert Date and Time variables to Date/Time
    date_time <- strptime(with(power_consuption, paste(Date,Time)),
                          "%d/%m/%Y %H:%M:%S")
    
    # Plot 3
    quartz(bg = "white")   # open screen device
    
    # Create the plot with attributes
    with(power_consuption,plot(date_time,Sub_metering_1,
            xlab = "", ylab = "Energy sub metering",
            bg = "white", type="n"))
    lines(date_time, power_consuption$Sub_metering_1, col = "black")
    lines(date_time, power_consuption$Sub_metering_2, col = "red")
    lines(date_time, power_consuption$Sub_metering_3, col = "blue")
    legend("topright", lty = "solid", lwd = 1,
           col = c("black","red","blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    # Save plot3 in a PNG file
    dev.copy(png, file = "plot3.png",
             width = 480, height = 480, units = "px" )  # copy plot1 in a PNG file

    dev.off()     # close PNG devce
    dev.off()     # close QUARTZ devce
}