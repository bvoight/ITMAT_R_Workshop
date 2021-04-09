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

###########################
## I. Arthmetic Operation
#
# Calculator definitely works
1+1
2 * 3
2^3

# operations (function)
# f(x) -- x is an argument that passes to the function
log(10)     #log base e

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

w <- q - y  # Whoops - You can't subtract 1 from foo!

################################
## III. Data types - Variables
#
# Above, we see that we can assign different kinds of
# things to variables. So let's go through just point
# those different kinds of things out formally:

foo <- "bar"       # character -- a 'string' of one or more characters
y <- 1             # integer -- whole number
q <- 3.1459        # numeric -- a number with decimal
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

# the structure looks like this:
#
# my_function(arg1=x, arg2=y, ...)
#
# the key is that you know what the function does (verb)
# and that you understand the input arguments
# don't be shy to specify!
#
# a very big list of functions:
# https://statisticsglobe.com/r-functions-list/

## one example: paste()
?paste
prefix <- "dataset"
endfix <- ".txt"
paste(prefix,endfix,sep="")
myfilename <- paste(prefix,endfix,sep="")

################################
## V. Lists, vectors, matrix, data.frame
#
# variables with multiple elements is where
# R really shines. You can store list, or even tables!

# another example: c()
v <- c(5,6,7,8)    #vector: a collection of elements of the same type
v

# you can access this vector with square bracket
# notation
v[1]       # this returns 1, since "1" is the first element of the list
v[4]       # Whoops! this is out of bounds of the vector

# let's make a more complex table with different elements
?data.frame
r <- c("my","dog","has","fleas")    
t <- data.frame(v,r)
t

# notice that the columns and rows may have names
# given the column names, you can access via dollar sign '$' notation
t$v        # returns the 'slice' of the column of v

# You can also use bracket '[]' notation to access slices of the table
t[1,]      # the first row of the variable t
t[,1]      # the first column of the variable t, e.g. t$v
t[c(1,3),] # give me the first and third rows



