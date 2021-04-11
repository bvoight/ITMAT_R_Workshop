## ITMATEd MSTR
## Intro to R Workshop
#
## Created: BF Voight
## on: 04-08-2021

###########################
## 0. Overview
#
# This is a very short primer, with examples
# of working in R, data types, examples, loading data
# primer with those with zero experiences in R
#
# Available at: 
# https://github.com/bvoight/ITMAT_R_Workshop



###########################
## I. Arthmetic Operations
#
# R as a calculator definitely works
1+1
2 * 3
2^3

# operations (function)
# f(x) -- x is an argument that passes to the function
log(10)     #log base e
log10(10)   #log base 10

# can I get some help?
?log
help(log)



###################
## II. Assignment
# 
# It's *extremely* useful to create variable
# and then /assign/ (store) something to them

x <- 99     # "assign" the value 99 to x
x           # report what is held in x

y <- 1
x <- x - y  # take one down, pass it around
x

z           # whoops! z does not actually exist

q <- "foo"  # you can store things other than numbers

w <- q - y  # Whoops! You can't subtract 1 from foo!



################################
## III. Data types - Variables
#
# Above, we see that we can assign different types of
# 'things' (data) to variables. So let me take a sec to point
# those different kinds of things out formally:

foo <- "bar"       # character -- a 'string' of one or more characters
y <- 1             # integer -- whole number (double)
pi <- 3.1459       # numeric -- a number with decimal (double)
fail <- FALSE      # logical -- 0/1 or TRUE/FALSE
                   
# factor -- not mentioned here, variable with 'levels' for categories,
# e.g., 'blue', 'red', 'green'



##############################
## IV. Functions/Subroutines
#
# Functions are used *frequently* in R. 
# Functions generally take some set of arguments (as input)
# and returns some output
# 
# think mathematically: f(x) = 2x + 5
# then f(1) = 7
# 
# But in R, these are custom functions that "do something"
# when given arguments
#
# the structure looks like this:
#
# thisfunction(arg1=x, arg2=y, ...)
#
# the key is that you know what the function does (i.e., 'verb')
# and that you understand the input arguments (i.e., arg1, arg2, etc.)
# don't be shy to specify (e.g., arg1=x)!
#
# a very big list of functions:
# https://statisticsglobe.com/r-functions-list/

## an example: paste()
?paste
prefix <- "dataset"  
endfix <- ".txt"
paste(prefix,endfix,sep="")
myfilename <- paste(prefix,endfix,sep="")




###############################################
# Challenge Questions for Parts I, II, III, IV 
#
# 1. Use R to calculate the value of -1 * ( 98 + (2173 * 12273)^3 / 7182 )
#
# 2. Assign the absolute value of the above calculation to a variable called "mycalc_abs"
#
# 3. use paste() to create a variable called "myname" with your Name (first, last, separated by an Underscore "_")
# 
# Challenge:
# 4. create a list of 1000 values drawn from a Normal distribution with mean 0, variance = 2 (hint: rnorm())
#
# 5. create a list of 1000 values drawn from a normal distribution with mean 0.1, variance = 1
#
# 6. Perform a t.test comparing the means of these two lists. Is there a difference?




##############################################
## V. Installing pacakges and loading them in R
#
# via install.packages() and library()
#
# R is chalk full of packages that do a bunch of things
# You first need to install them
# within RStudio, you can do that quite easily:
# Menu -> Tools -> Install Packages... -> tidyverse
#
# you will see that this actually calls a function:
# install.packages("tidyverse")
#
# but once installed, you still need to *load* them for a given
# session of R, via:
# library()
?library
library(tidyverse)    #load up the tidyverse (for later)


##########################################
## VI. Lists, vectors, matrix, data.frame
#
# variables with multiple elements is where
# R really shines. You can store list, or even tables!

# another example: c()
v <- c(5,6,7,8)    #vector: a collection of elements of the same type
v

# you can access contents of this vector with square bracket notation '[]'
v[1]       # this returns 5, since "5" is values contained in the first element of v
v[5]       # Whoops! this is out of bounds of the vector
length(v)  # helpful to know how many elements are in a list


# let's make a more complex table with different elements
?data.frame
r <- c("my","dog","has","fleas")    
t <- data.frame(v,r)
t

# notice that the columns and rows may have names (columns the variables we merged)
# given the column names, you can access via dollar sign '$' notation
t$v        # returns the 'slice' of the column of v

# You can also use bracket '[]' notation to access slices of this "table"
t[1,]      # the first row of the variable t
t[,1]      # the first column of the variable t, e.g. t$v
t[c(1,3),] # give me the first and third rows

# You can apply arithmetic to list very easily:
v
v * 2
v / 4

####################################
# VII. Comparison operators
#
# But what you really want to do is determine if entries in a table meet some criteria
#
# to do that, let's introduce comparison. There are a number of logical operators
#
# These work if you are a number:
#
# ==, !=      "equal to", "not equal to"
# >, >=       "greater than", "greater than or equal to"
# <, <=       "less than", "less than or equal to"

x             # remember our friend? he's 98 now.
y             # still 1
x == y        # does 98 equal 1? FALSE
x > y         # is 98 greater than 1? TRUE
x < y         # is 98 less than 1? FALSE

# let's show off what I mean with the iris data
iris

iris$Sepal.Length == 5.1     # returns a list of logical values if the element met my 'test' (condition)
iris$Sepal.Length > 5.1      # is the element of Sepal.Length greater than 5.1?

# well, that's not helpful -- I just want the subset of the table that met my criteria
sel <- iris$Sepal.Length == 5.1
iris[sel,]

iris[iris$Sepal.Length == 5.1,]   #This works too - a little messier, but you avoid creating sel


###############################################
# Break out Questions for Part V and VI
#
# for these questions, use the iris data set
# 
# 1. Calculate the mean of the Sepal Length for all species. (Hint: is there an R function?)
#
# 2. Calcualte the mean of Sepal.Width for only setosa 
#
# 3. Perform a t.test to compare the Sepal Widths of setosa and versicolor. Are these different?
#
# Challenge:
# 4. How many species of virginica have a Petal width greater than 2.0?
#
# 5. Create a list of Sepal Length that is standardized for all species (element minus mean divided by standard deviation)




###################################
## VII. Loading data into R!
#
# OK, let's take your first big step: let's load some data into R
#
# First, let's set up a working directory
# 
# Let's make a folder on your desktop called "ITMAT_Workshop"
#
# In RStudio, you can set the 'working directory' easily:
# 
# Menu --> Session --> Set Working Directory --> Choose Directory
#
# You can see that this actually calls a function:
#
# setwd()
# 
# which takes in the directory you specified as the argument:

setwd("C:/Users/bvoight/Desktop/ITMAT_Workshop")

# Now, head to the following link, download the data, and place it into the ITMAT_Workshop
#
# https://storage.googleapis.com/gtex_analysis_v8/rna_seq_data/GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz
#
# Let's read in the data using read.table(). This function takes a couple of arguments:
#
# file : the name of the file to read into R
# header=T : it is TRUE that there is a header for this file (set the first line to name the columns)
# sep="\t" : the character that separates the entries for each row. "\t" means "tab".
#            NOTE: this could be set to different things: "," for a .csv file, "\s" for whitespaces
# skip=2   : You can skip first set of lines in a file if you wanted to. In this case, we need to because the first two lines
#            aren't useful

?read_table

# This is a data set which provides the median transcript count (per million, tpm) 
# for each transcript for each tissue assayed by GTEx
GTEx_data <- read.table(file="GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz", header=T, sep="\t", skip=2)

# let's look at the first 5 rows and the first 5 columns (for ease of viewing)
GTEx_data[1:5,1:5]


#######################
# Break-out Questions for VII
#
# 1a. Download the following and place into your directory
#  
# https://upenn.box.com/s/fxnbrb34a9nbjwjvg8d6cba8gl7lyoxq
# https://upenn.box.com/s/0tdbrxqaezg2eai63z7tfvm02sgxquhw 
#
# 1b. Look at the data sets, and load each one (properly) into R
#
# 2. In GTEx data, which genes have greater tpm than 10000 in Liver? Anything you notice in common?


##############################################
# VIII. Crash course in Tidyverse
#
# Up to this point, we've given you a crash course in "base R"
#
# There's a handy toolkit called 'tidyverse' that provides a framework
# for doing good, clean, repoducible data science 
#
# along with a toolkit of libraries to help you do that
#
# At this point, we've already loaded the library we wanted
library(tidyverse)

# and data set we wanted
GTEx_data

# Data comes in different ways, so let's convert it into a "tibble" (tbl, or table)
# friendly to tidyverse
tibble(GTEx_data)

# let's make a copy of it
# NOTE: that a 'tibble' is not a 'data.frame'
GTEx_data_tbl <- tibble(GTEx_data)

# OK, now we're ready to start working with the data.
# tidyverse gives a entire slew of functions that you can use
# if you wanted a quick list, see here:
#
# https://dplyr.tidyverse.org/reference/index.html
# https://github.com/rstudio/cheatsheets/blob/master/data-transformation.pdf
# 

mutate()
select()
filter()
summarise()
arrange()

rename()



# Let's start building up our workflows a little bit more.
# for that, I need to introduce you to another operator:
#
# %>%
#
# aka the "pipe" operator
#
# This passes the object (noun) on the left side to the function (verb) on the right side
#
# x %>% f(y) 		is the same as 			f(x,y)
# y %>% f(x, ., z) 		is the same as 			f(x,y,z)
#
# this allows one to "chain" together objects (nouns) to a series of function (verbs)
# that you want done.
#
# e.g., remember the challenge problem 
# >> 4. How many species of virginica have a Petal width greater than 2.0?
#
# it was easy to think about this in multiple steps, but you can build that up
# with tidyverse very easily





###############################################
# Answers to Break out Questions for Parts I, II, III, IV 
#
# 1. Use R to calculate the value of -1 * ( 98 + (2173 * 12273)^3 / 7182 )
-1 * ( 98 + (2173 * 12273)^3 / 7182 )

# 2. Assign the absolute value of the above calculation to a variable called "mycalc_abs"
mycalc_abs <- abs(-1 * ( 98 + (2173 * 12273)^3 / 7182 ))

# 3. use paste() to create a variable called "myname" with your Name (first, last, separated by an Underscore "_")
myname <- paste("Bobo", "McQuack", sep="_")

# Challenge:
# 4. create a list of 1000 values drawn from a Normal distribution with mean 0, variance = 2 (hint: rnorm())
list1 <- rnorm(1000,mean=0,sd=sqrt(2))

# 5. create a list of 1000 values drawn from a normal distribution with mean 0.1, variance = 1
list2 <- rnorm(1000,mean=0.1,sd=sqrt(1))

# 6. Perform a t.test comparing the means of these two lists. Is there a difference?
t.test(list1,list2)

###############################################
# Answers to Break out Questions for Part V and VI
#
# for these questions, use the iris data set
# 
# 1. Calculate the mean of the Sepal Length for all species. (Hint: is there an R function?)
mean(iris$Sepal.Length)

# 2. Calcualte the mean of Sepal.Width for only setosa 
sonly <- iris[iris$Species == "setosa",]
mean(sonly$Sepal.Width)

# 3. Perform a t.test to compare the Sepal Widths of setosa and versicolor. Are these different?
veronly <- iris[iris$Species == "versicolor",]
t.test(sonly$Sepal.Width,veronly$Sepal.Width)

# Challenge:
# 4. How many species of virginica have a Petal width greater than 2.0?
vironly <- iris[iris$Species == "virginica",]
vironly <- vironly[vironly$Petal.Width > 2,]
length(vironly[,1])

# 5. Create a list of Sepal Length that is standardized for all species (element minus mean divided by standard deviation)
mean_sl <- mean(iris$Sepal.Length)
sd_sl <- sd(iris$Sepal.Length)
std_sl <- (iris$Sepal.Length - mean_sl) / sd_sl
mean(std_sl)
sd(std_sl)


#######################
# Break-out Questions for VII
#
# 1a. Download the following and place into your directory
#  
# https://upenn.box.com/s/fxnbrb34a9nbjwjvg8d6cba8gl7lyoxq
# https://upenn.box.com/s/0tdbrxqaezg2eai63z7tfvm02sgxquhw 
#
# 1b. Look at the data sets, and load each one (properly) into R
read.table(file="plate1.csv",sep=",",header=F)
read.table(file="genes.table",sep=" ",header=T)

# 2. In GTEx data, which genes have greater tpm than 10000 in Liver? Anything you notice in common?
GTEx_data[GTEx_data$Liver > 10000,]
# Yep, MT suggest mitochondrial data. That said, HP and ALB are good positive controls too.

