# load data set diamonds
?diamonds
# practice set single variable
data(diamonds)

names(diamonds) # column names

str(diamonds) # structure

levels(diamonds$color) #factor levels 

# Create a histogram of the price of
# all the diamonds in the diamond data set.

# TYPE YOUR CODE BELOW THE LINE
# =======================================

ggplot(aes(x= price), data = diamonds) + 
  geom_histogram()

summary(diamonds$price) # price variable summary

length(which(diamonds$price < 500)) # no of diamonds with price less than 500

length(which(diamonds$price < 250))

length(which(diamonds$price >= 15000))

# Explore the largest peak in the
# price histogram you created earlier.

# Try limiting the x-axis, altering the bin width,
# and setting different breaks on the x-axis.

# There won't be a solution video for this
# question so go to the discussions to
# share your thoughts and discover
# what other people find.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Submit your final code when you are ready.

# TYPE YOUR CODE BELOW THE LINE
# ======================================================================

ggplot(aes(x= price), data = diamonds) + 
  geom_histogram(binwidth = 100, color = 'red') + 
  scale_x_continuous(limits = c(0, 10000), breaks = seq(0, 10000, 1000)) +
  scale_y_continuous(breaks = seq(0,3000,500))

# Break out the histogram of diamond prices by cut.

# You should have five histograms in separate
# panels on your resulting plot.

# TYPE YOUR CODE BELOW THE LINE
# ======================================================
ggplot(aes(x= price), data = diamonds) + 
  geom_histogram(binwidth = 100) + 
  scale_x_continuous(limits = c(0, 10000), breaks = seq(0, 10000, 5000)) +
  scale_y_continuous(breaks = seq(0,3000,500)) + 
  facet_grid(~cut)

by(diamonds$price,diamonds$cut,summary)

qplot(x = price, data = diamonds) + facet_wrap(~cut, scales = 'free')


# Create a histogram of price per carat
# and facet it by cut. You can make adjustments
# to the code from the previous exercise to get
# started.

# Adjust the bin width and transform the scale
# of the x-axis using log10.

# Submit your final code when you are ready.

# ENTER YOUR CODE BELOW THIS LINE.
# ===========================================================================

qplot(x = price/carat, data = diamonds) + 
  facet_wrap(~cut, scales = 'free', ncol = 2) +
  scale_x_log10()

# Investigate the price of diamonds using box plots,
# numerical summaries, and one of the following categorical
# variables: cut, clarity, or color.

ggplot(aes(y = price, x = cut), data = diamonds) + geom_boxplot()
by(diamonds$price,diamonds$cut,summary)
ggplot(aes(y = price, x = clarity), data = diamonds) + geom_boxplot()
by(diamonds$price,diamonds$clarity,summary)
ggplot(aes(y = price, x = color), data = diamonds) + geom_boxplot()
by(diamonds$price,diamonds$color,summary)

# Investigate the price per carat of diamonds across
# the different colors of diamonds using boxplots.

ggplot(aes(x = color, y = price/carat), data = diamonds) + 
  geom_boxplot() + 
  coord_cartesian(ylim = c(1000,7000))

# investigate the weight of diamond(carat) using the frequency polygon

ggplot(diamonds, aes(carat)) +
  geom_freqpoly(binwidth = 0.01) +
  scale_x_continuous(breaks = seq(0,2,0.1)) +
  coord_cartesian(xlim = c(0, 2))

diamonds$carat


# The Gapminder website contains over 500 data sets with information about
# the world's population. Your task is to download a data set of your choice
# and create 2-5 plots that make use of the techniques from Lesson 3.

# You might use a simple histogram, a boxplot split over a categorical variable,
# or a frequency polygon. The choice is yours!

# You can find a link to the Gapminder website in the Instructor Notes.

# Once you've completed your investigation, create a post in the discussions that includes:
#       1. any questions you answered, your observations, and summary statistics
#       2. snippets of code that created the plots
#       3. links to the images of your plots

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.
# ====================================================================================
library(reshape2)

employmentRate <- read.csv("employment.csv", header = T, row.names = 1, check.names = F)

qplot(x = employmentRate[,1], data  = employmentRate)
