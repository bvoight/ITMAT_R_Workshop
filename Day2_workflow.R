## ITMATEd MSTR
## Intro to R Workshop -- Day Two
#
#
## Created: BF Voight
## on: 04-11-2021
#

###########################
## 0. Overview
#
# This is a very short primer, with examples
# of plotting in R via ggplot2
#
# and a creating a github account to make pipelines
# for your work
#
# Available at: 
# https://github.com/bvoight/ITMAT_R_Workshop
#
# Some short slides are also available at:
# http://bit.ly/ITMATEd_R_Workshop
#
# I've assumed you've already gone through Day 1
# which means at least you have R, Rstudio installed
# and that you know about some BaseR syntax
# as well as a bit of tidyverse syntax
#
# For setup here, please go to github and create an account:
# https://github.com/join
#
# After you have created an account, download and install
# github desktop on your machine:
# https://desktop.github.com/
#
####

## First, let's do a little bit of setup.
#
# let's set our working directory to our workspace (I had mine on my desktop)
# setwd("C:/Users/bvoight/Desktop/ITMAT_Workshop")

# let's also load a library that we'll need: tidyverse
library(tidyverse)

############################
## I. Creating your first repository
#
# I personally think the *easiest* way to create a new repository
# is to do it on your account on github
#
# then, clone that onto your machine and add things accordingly
#
# https://github.com/ -> Log in -> click on '+' icon in upper right 
# -> new repository 
#
# Name it what you'd like
#
# Give it a description
#
# Let's make this one 'private' for now (you can change this)
#
# Click the boxes "Add a README.md"
#
# "Choose a License" -> MIT License

#####
# Great! You've made your first repo. Now, let's place this onto your
# computer. Lots of ways to do this, but here's one:
#
# First, click on the green "code" button and copy the link (click on the 'clipboard' icon)
# 
# Second, open github desktop --> Options --> Sign in
#
# Then, click on "Current Repository" --> Add --> paste the link under "Repository URL"
# 
# Finally, set "Local path" to be your ITMAT_workshop directory
#
# click "clone"!

######
# Wondrous! The working directory of that now can be used to
# stage edits/updates to this repo.
#
# The cycle of github-ery that you will generally follow here is:
#
# 1. PULL. Before you start work, make sure that your local version
#    is the most up-to-date.
# 2. EDIT. Make edits, add files, and stage changes. Nicely, github desktop will 'track'
#    What changes you have made to that local directory.
# 3. COMMIT. Review the changes that you have made. Usually, you want to keep are all 
#    in there. But github gives you the option of choosing what you put forth or remove.
# 4. PUSH. After you commit, you then send (push) your version to your master repo
#    that is on the cloud. 
#
# You can then cycle through these steps (particularly 2-4) as many times as you
# want to make updates to your repo.

#######
# Ok, let's try it out.
#
# first, let's make a new .R file in Rstudio
#
# Click Green + and Paper icon (upper left) --> "R Script"
#
# let's add a wee bit of content -- you can follow along with this
#
# then let's save it to the repo directory

########
# great! Now if we turn back to github desktop, it has the new
# file tracked as 'changed' (added) with the content you just made
#
# We can add a little description
#
# then click the blue "commit to main" button
#
# OK, we're not quite done yet. We can stage a bunch of adds, but they
# don't go up on your cloud repo until you press the
#
# blue "PUSH ORIGIN" button
#
# Done! Let's check online and there you have it, your R notebook is up there

#########################
# Follow-up Questions: Part I
#
# 1. Since I'm a generous person and I want you to have everything, please
# feel free to clone the materials online
#
# this include material from Day One, so you won't feel left out!
#
# You can find it at: 
#
# https://github.com/bvoight/ITMAT_R_Workshop

###################
# II. Plotting in Base-R
#
# At the very basic level, R provides capabilities to plot data

# let's go back to our iris example
iris

# we can make very basic plots using, well, plot()
?plot
plot(iris$Sepal.Length,iris$Sepal.Width)

# let's make a histogram of data instead
hist(iris$Sepal.Length)

# mmm these bins are too wide, let's make more of them
hist(iris$Sepal.Length, n=16)

# Let's make a boxplot instead
boxplot(iris$Sepal.Width,iris$Sepal.Length, iris$Petal.Length, iris$Petal.Width, main="t")

# Feels like we need to set some asethetics about the plot
# mostly in base R:
#
# xlab, ylab: Labels for the x and y axes
# main:       main title for the figure
# 
# xlim, ylim: set the limts for the the range of x and y axes
# 
# col:        change the coloring for the plot
# pch:        type of points that are used (e.g., *, circle, triangle, etc.)
# cex:        sizing for the points you are using

# ok let's revamp our boxplot a little bit
boxplot(iris[,1:4], 
        col=c("red","orange","green", "blue"), 
        ylim=c(0,10), 
        ylab="Measured Value",
        xlab="Traits",
        names=c("Sepal Length", "Sepal Width", "Petal Length", "Petal Width"))

#########################
# Question for Part II
#
# 1. Create a scatter plot of Sepal Length by Petal Length
#    where each species is a different color
#    and have different points for them -- Hint: you can force as a number with as.integer()

# 2. use rnorm() to create 10000 random draws from a gaussian with mean=1, variance=4
#    Plot a histogram of the output


###################
# III. Plotting in Base-R
#
# 












###########################
## write plot


















#########################
# Answers for Question for Part II
#
# 1. Create a scatter plot of Sepal Length by Petal Length
#    where each species is a different color
#    and have different points for them -- Hint: you can force as a number with as.integer()
plot(iris$Sepal.Length,iris$Petal.Length, col=iris$Species, pch=as.integer(iris$Species))

## 2. use rnorm() to create 10000 random draws from a gaussian with mean=1, variance=4
#    Plot a histogram of the output
z <- rnorm(10000,mean=1,sd=2)
hist(z, bin=256)

