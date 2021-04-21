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
plot(x=iris$Sepal.Length,y=iris$Sepal.Width)

# let's make a histogram of data instead
?hist
hist(iris$Sepal.Length)

# mmm these bins are too wide, let's make more of them
hist(iris$Sepal.Length, n=16)

# Let's make a boxplot instead
boxplot(iris$Sepal.Width,iris$Sepal.Length, iris$Petal.Length, iris$Petal.Width)

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

# let's save this to a plot
pdf(file="myirisboxplot.pdf")

# now when we plot, it'll print to a .pdf not to the plotting page of RStudio
boxplot(iris[,1:4], 
        col=c("red","orange","green", "blue"), 
        ylim=c(0,10), 
        ylab="Measured Value",
        xlab="Traits",
        names=c("Sepal Length", "Sepal Width", "Petal Length", "Petal Width"))

# this tells pdf that it's done printing
dev.off()

#########################
# Question for Part II
#
# 1. use rnorm() to create 10000 random draws from a gaussian with mean=1, variance=4
#    Plot a histogram of the output
#
# 2. Create a scatter plot of Sepal Length by Petal Length
#    where each species is a different color
#    and have different points for them -- Hint: you can force a list to be a number with as.integer()



###################
# III. A short framework for thinking about plotting in R
#
# You can find the lecture slides in your (cloned) repo for the workshop
#
# ggplot_syntax.pdf
#
# Many thanks to Ophir Shalem who made these slides 


###################
# IV. Data, Aesthetics, and geometries in ggplot
#
# Let's return to our GTEX data set:
GTEx_data <- read.table(file="GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz", header=T, sep="\t", skip=2)
GTEx_data_tbl <- tibble(GTEx_data)

# Ok, let's first prepare a little bit of data that we WANT to plot. 
# Read the code below - what are we doing here?
g1 <- GTEx_data_tbl %>%
  filter(Description == "TCF7L2") %>%
  select(-Name,-Description) %>%
  t() %>%
  as.data.frame() %>%
  rownames_to_column(var="tissue") %>%
  as_tibble() %>%
  mutate(gene="TCF7L2")

g2 <- GTEx_data_tbl %>%
  filter(Description == "GCK") %>%
  select(-Name,-Description) %>%
  t() %>%
  as.data.frame() %>%
  rownames_to_column(var="tissue") %>%
  as_tibble() %>%
  mutate(gene="GCK")

g3 <- GTEx_data_tbl %>%
  filter(Description == "FTO") %>%
  select(-Name,-Description) %>%
  t() %>%
  as.data.frame() %>%
  rownames_to_column(var="tissue") %>%
  as_tibble() %>%
  mutate(gene="FTO")

data_forplot <- bind_rows(g1,g2,g3) %>%
  rename(gexp=V1)
data_forplot

# OK, let's use this data to make plots using ggplot2
#
# First, we begin with creating the data and "aes"thestics
ggplot(data_forplot, aes(gene,gexp))
p1 <- ggplot(data_forplot, aes(gene,gexp))

# Second, let's add a boxplot, the "geometry"
p1 + geom_boxplot() 

# we could have done with a different type of geometry
p1 + geom_violin()

# let's try another example
p2 <- ggplot(data_forplot, aes(gexp))
p2 + geom_histogram(aes(fill=gene))

# hmm. maybe we need this as a density
p2 + geom_density(aes(fill=gene),alpha=1.0)


###########################
## Questions -- Part IV
#
# 1. Create a scatter plot comparing the expression of Liver
#    and Pancreas, excluding genes with tpm > 10000
#
# 2. Repeat above, except for 
#    Brain...Hippocampus
#    Brain...Cortex

###################
# V. Facets in ggplot
#
# Facets are designed to help make plots when your data
# is divided up into groups

# Let's try that out with tissues as the group
p1 + geom_point() + facet_wrap(~tissue)

# whoa that worked! but that's too much. let's subset and replot
tissue_subset <- c("Pancreas", "Adipose...Subcutaneous", "Adipose...Visceral..Omentum.", "Liver", "Muscle...Skeletal", "Brain...Hypothalamus")
ss_data_forplot <- data_forplot %>%
  filter(tissue %in% tissue_subset)

p5 <- ggplot(ss_data_forplot, aes(gene,gexp))
p5 + geom_point() + facet_wrap(~tissue)

# You can change up the number of columns:
p5 + geom_point() + facet_wrap(~tissue, ncol=2)


###################
# VI. Coordinates and plot labelling (Themes) in ggplot
#
# You can specify the range and dimensionality of how you plot
# things in ggplot 
#
# probably the most handy thing is to zoom in / zoom out of plots as you 
# needed to.

# let's do that with a plot we just made:
data_forplot_q1 <- GTEx_data_tbl %>%
  select(Liver,Pancreas)

p3 <- ggplot(data_forplot_q1, aes(x=Liver,y=Pancreas))
p3 + geom_point()

# This view is not great. Let's zoom in!
# I prefer this method to having ggplot2 "remove" the points
p3 + 
  geom_point() + 
  coord_cartesian(xlim=c(0,5000), ylim=c(0,5000))

# Let's walk through some labelling feature on your plots
# labs() does a lot
#
# title:    # set the title of your plot
# x:        # changes the x axis label
# y:        # changes the y axis label

p3 + 
  geom_point() + 
  coord_cartesian(xlim=c(0,5000), ylim=c(0,5000)) +
  labs(title="Expression of Pancreas vs. Liver in GTEx", x="Liver (GTEx)", y="Pancreas (GTEx)")

# theme() let's you change a lot of things as well
# particularly around sizing
#
# plot.title=element_text(size=25):        # change the size of the title
# axis.title.x=element_text(size=25):      # change the size of x-axis title (Pancreas)
# axis.title.y=element_text(size=25):      # change the size of y-axis label (Liver)
# axis.text.x=element_text(size=25):       # change the size of the x-axis text
# axis.text.y=element_text(size=25):       # change the size of the y-axis text

p3 + 
  geom_point() + 
  coord_cartesian(xlim=c(0,5000), ylim=c(0,5000)) +
  labs(title="Expression of Pancreas vs. Liver in GTEx", x="Liver (GTEx)", y="Pancreas (GTEx)") +
  theme(plot.title=element_text(size=11)) +
  theme(axis.title.x=element_text(size=11), axis.title.y=element_text(size=11)) +
  theme(axis.text.x=element_text(size=6), axis.text.y=element_text(size=6))

# geom_point() also has arguments we can use
#
# color="steelblue"           # change the color of points used
# size=1.5                  # change the size of the points plotted
p3 + 
  geom_point(color="steelblue", size=1.5) + 
  coord_cartesian(xlim=c(0,5000), ylim=c(0,5000)) +
  labs(title="Expression of Pancreas vs. Liver in GTEx", x="Liver (GTEx)", y="Pancreas (GTEx)") +
  theme(plot.title=element_text(size=11)) +
  theme(axis.title.x=element_text(size=11), axis.title.y=element_text(size=11)) +
  theme(axis.text.x=element_text(size=6), axis.text.y=element_text(size=6))

# let's take a closer look at that set of correlated genes
data_forplot_q1_pluscorr <- data_forplot_q1 %>%
  mutate(corrsub = (Pancreas > 500 & Liver > 100 & Liver < 1000))

p3 <- ggplot(data_forplot_q1_pluscorr, aes(x=Liver,y=Pancreas))

# We can use that label we just 'mutated' as an aesthetic to color the plot
# 
# geom_point(aes(color=corrsub))    # use corrsub as a label color points on the plot
p3 +
  geom_point(aes(color=corrsub), size=1.5) + 
  coord_cartesian(xlim=c(0,5000), ylim=c(0,5000)) +
  labs(title="Expression of Pancreas vs. Liver in GTEx", x="Liver (GTEx)", y="Pancreas (GTEx)") +
  theme(plot.title=element_text(size=11)) +
  theme(axis.title.x=element_text(size=11), axis.title.y=element_text(size=11)) +
  theme(axis.text.x=element_text(size=6), axis.text.y=element_text(size=6))

# don't like this coloring set? swap in another
#
# You can check out some of the options here:
# https://www.r-graph-gallery.com/38-rcolorbrewers-palettes.html
# 
# scale_colour_brewer(palette = "Set1")     #Set the color theme to "Set1"
p3 +
  scale_colour_brewer(palette = "Set1") +
  geom_point(aes(color=corrsub), size=1.5) + 
  coord_cartesian(xlim=c(0,5000), ylim=c(0,5000)) +
  labs(title="Expression of Pancreas vs. Liver in GTEx", x="Liver (GTEx)", y="Pancreas (GTEx)") +
  theme(plot.title=element_text(size=11)) +
  theme(axis.title.x=element_text(size=11), axis.title.y=element_text(size=11)) +
  theme(axis.text.x=element_text(size=6), axis.text.y=element_text(size=6))

# You can also change axis ticks and location
#
# scale_x_continuous(breaks=c(0,1250,2500,3750,5000))  # change how the x axis is listed
# scale_y_continuous(breaks=seq(0,5000,1250))          # change how the y axis is listed
#                                                      # seq() is handy here. Same as above.
p3 +
  scale_colour_brewer(palette = "Set1") +
  geom_point(aes(color=corrsub), size=1.5) + 
  coord_cartesian(xlim=c(0,5000), ylim=c(0,5000)) +
  labs(title="Expression of Pancreas vs. Liver in GTEx", x="Liver (GTEx)", y="Pancreas (GTEx)") +
  theme(plot.title=element_text(size=11)) +
  theme(axis.title.x=element_text(size=11), axis.title.y=element_text(size=11)) +
  theme(axis.text.x=element_text(size=6), axis.text.y=element_text(size=6)) +
  scale_x_continuous(breaks=c(0,1250,2500,3750,5000)) +
  scale_y_continuous(breaks=seq(0,5000,1250))

###################
# VII. Let's make your own plots
#
# This is what you hopefully came here for
# 
# First, place your data set in your 'repository' directory
#
# second, imagine what plot you would like to create. Can you draw it
# on a whiteboard graph? did you plot it in excel? 
# If so, then probably ggplot can make it 
# 
# Next, use "myfirstRnotebook.R" to create a little pipeline to
#
# - load in the data into R
# - use tidyverse to create the 'subset' of columns or other features you want to plot
# - use ggplot to create the plot of interest
# - evolve the plot with the visual appeal that you want
#
# Try it out on your own, remember to write a /little/ bit of code first
# then expand it out, step by step!
# call me over if you are stuck or want to brainstorm


###################
# VIII. Push your pipeline to github
#
# You can do this periodically, or at the very
# end (when you are finished)
#
# pop open github desktop
# commit your changes
# push your changes to your repo
#
# Volia! You have taken a small step into a bigger
# tidier, ggplottier world.



##########################
## END OF WORKSHOP DAY 2##
##########################



##############################################
###### SPOILER ALERT -- ANSWERS BELOW ########
##############################################





#########################
# Answers for Question for Part II
#
## 1. use rnorm() to create 10000 random draws from a gaussian with mean=1, variance=4
#    Plot a histogram of the output
z <- rnorm(10000,mean=1,sd=2)
hist(z, n=32)

# 2. Create a scatter plot of Sepal Length by Petal Length
#    where each species is a different color
#    and have different points for them -- Hint: you can force as a number with as.integer()
plot(iris$Sepal.Length,iris$Petal.Length, col=iris$Species, pch=as.integer(iris$Species))

###########################
## Answers to Questions -- Part IV
#
# 1. Create a scatter plot comparing the expression of Liver
#    and Pancreas, excluding genes with tpm > 10000
data_forplot_q1 <- GTEx_data_tbl %>%
  select(Liver,Pancreas) %>%
  filter(Liver < 10000, Pancreas < 10000)

p3 <- ggplot(data_forplot_q1, aes(x=Liver,y=Pancreas))
p3 + geom_point()

# 2. Repeat above, except for 
#    Brain...Hippocampus
#    Brain...Cortex

data_forplot_q2 <- GTEx_data_tbl %>%
  select(Brain...Hippocampus,Brain...Cortex) %>%
  filter(Brain...Hippocampus < 10000, Brain...Cortex < 10000)

p4 <- ggplot(data_forplot_q2, aes(x=Brain...Hippocampus,y=Brain...Cortex))
p4 + geom_point()

