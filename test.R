install.packages("rafalib")
library(rafalib)

install.packages("swirl")
library(swirl)

#------------------ 1: Basic Building Blocks

# R can be used as an interactive calculator
5+7

# automate some process
# variables
x <- 5 + 7
x
y <- x - 3
y

# vectors: numeric vectors the simplest type of data structure in R. In fact, even a single number is considered a vector of length one.
# The easiest way to create a vector is with the c() function, which stands for 'concatenate' or 'combine'.
z <- c(1.1, 9, 3.14)

# to know more about c()
?c

# Type z to view its contents. Notice that there are no commas separating the values in the output.
z

# You can combine vectors to make a new vector.
# Don't assign this vector to a new variable, so that we can just see the result immediately.
c(z, 555, z)

# First, R multiplied each of the three elements in z by 2. Then it added 100 to each element to get the result you see above.
z * 2 + 100

# To take the square root, use the sqrt() function
# R first subtracted 1 from each element of z, then took the square root of each element. 
# This leaves you with a vector of the same length as the original vector z.
my_sqrt <- sqrt(z-1)
my_sqrt

# R simply performs the specified arithmetic operation (`+`, `-`, `*`, etc.) element-by-element. 
# If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length as the longer vector.
# Behind the scenes, R is 'recycling' the 2 to make a vector of 2s and the 100 to make a vector of 100s. 
# In other words, when you ask R to compute z * 2 + 100, what it really computes is this: z * c(2, 2, 2) + c(100, 100, 100).
my_div <- z / my_sqrt
my_div

c(1, 2, 3, 4) + c (0, 10)

# If the length of the shorter vector does not divide evenly into the length of the longer vector, R will still apply the 'recycling' method, 
# but will throw a warning to let you know something fishy might be going on.
c(1, 2, 3, 4) + c (0, 10, 100)

z * 2 + 1000

my_div

my_div

swirl()

#------------------ 2: Workspace and Files
# R provides a common API (a common set of commands) for interacting with files, that way your code will work across different kinds of computers.

# Determine which directory your R session is using as its current working directory
getwd()

# List all the objects in your local workspace
ls()

x <- 9

ls()

# List all the files in your working directory
list.files()
 
#or

dir()

?list.files

# Use the args() function to determine the arguments to list.files()
args(list.files)

# Assign the value of the current working directory to a variable called "old.dir".
# We will use old.dir at the end of this lesson to move back to the place that we started.
old.dir <- getwd()

# Use dir.create() to create a directory in the current working directory called "testdir"
dir.create('testdir')

## We will do all our work in this new directory and then delete it after we are done.
# Set your working directory to "testdir"
setwd('testdir')

# Create a file in your working directory called "mytest.R"
file.create('mytest.R')

# check this by listing all the files in the current directory.
list.files()

# Check to see if "mytest.R" exists in the working director
file.exists('mytest.R')

# Access information about the file "mytest.R"
file.info('mytest.R')

file.info('mytest.R')$mode

# Change the name of the file "mytest.R" to "mytest2.R"
file.rename('mytest.R', 'mytest2.R')

# delete mytest.R
file.remove('mytest.R')
# file.remove('mytest.R'), but that won't work since mytest.R no longer exists. You have already renamed it.

# Make a copy of "mytest2.R" called "mytest3.R"
file.copy('mytest2.R', 'mytest3.R')

# Provide the relative path to the file "mytest3.R"
file.path('mytest3.R')

# You can use file.path to construct file and directory paths that are independent of the operating system your R code is running on.
file.path('folder1','folder2')

# Create a directory in the current working directory called "testdir2" and a subdirectory for it called "testdir3"
dir.create( file.path( "testdir2", "testdir3"), recursive = TRUE)

# Go back to your original working directory
setwd(old.dir)
# It is often helpful to save the settings that you had before you began an analysis and then go back to them at the
# end. This trick is often used within functions; you save, say, the par() settings that you started with, mess around a
# bunch, and then set them back to the original values at the end. This isn't the same as what we have done here, but it
# seems similar enough to mention.

file.info('testdir', extra_cols = TRUE)
file.info('testdir3')
getwd()
setwd("D:/Code in Statistics/testdir2")

#------------------ 3: Sequences of Numbers
# create a sequence of numbers from 1 to 20 in R 
1:20

# create a sequence of real numbers
pi:10

# backwards sequence
15:1

# you can access its documentation with a question mark followed by the function name: ?function_name_here. 
# However, in the case of an operator like the colon used above, you must enclose the symbol in backticks like this: ?`:`.

?`:`

# seq() does exactly the same thing as the `:` operator
seq(1, 20)

# vector of numbers ranging from 0 to 10, incremented by 0.5
seq(0, 10, by = 0.5)

# sequence of 30 numbers between 5 and 10
my_seq <- seq(5, 10, length = 30)

# confirm that my_seq has length 30
length(my_seq)

# we want a new vector (1, 2, 3, ...) that is the same length as my_seq
# method 1
1:length(my_seq)

# method 2
seq(along.with = my_seq)

# method 3
seq_along(my_seq)

# creating a vector that contains 40 zeros
rep(0, times = 40)

# vector to contain 10 repetitions of the vector (0, 1, 2)
rep(c(0, 1, 2), times = 10)

# vector to contain 10 zeros, | then 10 ones, then 10 twos
rep(c(0,1,2), each = 10)


#------------------ 4: Vectors
# types of atomic vectors include numerical, logical (values TRUE, FALSE, and NA), character, integer, and complex

# create a numeric vector num_vect that contains the values 0.5, 55, -10, and 6
num_vect <- c(0.5, 55, -10, 6)

# Now, create a variable called tf that gets the result of num_vect < 1
tf <- num_vect < 1

# Print the contents of tf now
tf
# The statement num_vect < 1 is a condition and 
# tf tells us whether each corresponding element of our numeric vector num_vect satisfies this condition.

# we are asking whether each individual element of num_vect is greater than OR equal to 6
num_vect >= 6

# logical operators'. Other logical operators include `>`, `<=`, `==` for exact equality, and `!=` for inequality

# If we have two logical expressions, A and B, we can ask whether at least one is TRUE with A | B (logical 'or' a.k.a. 'union')
# or whether they are both TRUE with A & B (logical 'and' a.k.a. 'intersection'). Lastly, !A is the negation of A and is TRUE
# when A is FALSE and vice versa.
# Examples
(3 > 5) & (4 == 4)

(TRUE == TRUE) | (TRUE == FALSE)

((111 >= 111) | !(TRUE)) & ((4 + 1) == 5)

# Create a character vector that contains the following words: "My", "name", "is". Store the vector in a variable called my_char.
my_char <- c("My", "name", "is")

my_char

# Let's say we want to join the elements of my_char together into one continuous character string (i.e. a character vector of length 1).
paste( my_char, collapse = " ")

# To add (or 'concatenate') your name to the end of my_char, use the c() function
my_name <- c(my_char, "Deepa")

my_name

# Into a single character string
paste(my_name, collapse = " ")

# the `sep` argument tells R that we want to separate the joined elements with a single space
paste("Hello", "world!", sep = " ")

# Join two vectors, each of length 3 to join the integer vector 1:3 | with the character vector c("X", "Y", "Z") leave no space between the joined elements.
paste(1:3, c("x", "y", "z"), sep = "")

# What will happen if our vectors are of different length?
paste(LETTERS, 1:4, sep = "-")
# LETTERS is a predefined variable in R containing a character vector of all 26 letters in the English alphabet
# the numbers 1, 2, 3, and 4 in the output above are no longer numbers to R, but rather characters "1", "2", "3", and "4"

#------------------ 5: Missing Values
# Elements of the resulting vector that correspond with the NA values in x are also NA
x <- c(44, NA, 5, NA)
x * 3

# lets create a vector containing 1000 draws from a standard normal distribution of y
y <- rnorm(1000)

# let's create a vector containing 1000 NAs
z <- rep(NA, 1000)

# Finally, let's select 100 elements at random from these 2000 values (combining y and z)
my_data <- sample(c(y, z), 100)

# Let's first ask the question of where our NAs are located in our data.
my_na <- is.na(my_data)
my_na
# Everywhere you see a TRUE, you know the corresponding element of my_data is NA. Likewise, everywhere you see a FALSE, 
# you know the corresponding element of my_data is one of our random draws from the standard normal distribution.

# Does the expression my_data == NA yields the same results as is.na() ?
my_data == NA
# The reason you got a vector of all NAs is that NA is not really a value, but just a placeholder for a quantity that is not
# available. Therefore the logical expression is incomplete and R has no choice but to return a vector of the same length as
# my_data that contains all NAs.

# total number of NAs in our data?
#  The trick is to recognize that underneath the surface, R represents TRUE as the number 1 and FALSE as the number 0. Therefore,
# if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.
sum(my_na)

# Verify the last check!
my_data

# let's look at a second type of missing value -- NaN, which stands for 'not a number'
0 / 0

# Inf stands for infinity. What happens if you subtract Inf from Inf?
Inf - Inf
# Result is NaN

#------------------ 6: Subsetting Vectors 
# In this lesson, we'll see how to extract elements from a vector based on some conditions that we specify.

# I've created for you a vector called x that contains a random ordering of 20 numbers (from a standard normal distribution) 
# and 20 NAs. Type x now to see what it looks like.
x

# Select 'subset' from a vector is by placing an 'index vector' in square brackets
# R uses 'one-based indexing' NOT 'zero-based indexing'
x[1:10]

# Index vectors come in 4 flavors - logical vectors, vectors of positive integers, vectors of negative integers, and vectors of character strings

# Vector of all NAs
x[is.na(x)]

# Vector of all excluding NAs
y <- x[!is.na(x)]
y

# Vector of all the positive elements of y
y[y > 0]

# Why not x[x > 0]?
x[x > 0]
# Expression NA > 0 evaluates to NA. Hence we get a bunch of NAs mixed in with our positive numbers when we do this

# Optimal solution 
x[!is.na(x) & x >0]

# subset the 3rd, 5th, and 7th elements of x?
x[c(3, 5, 7)]

# R doesn't prevent us from doing this

x[0]
# Result is numeric(0)

x[3000]
# Result is NA

# What if we're interested in all elements of x EXCEPT the 2nd and 10th? R accepts negative integer indexes.
x[c(-2, -10)]
# Shortcut
x[-c(2, 10)]

# Create a numeric vector with three named elements to a variable - vect
vect <- c(foo = 11, bar = 2, norf = NA)
vect

# We can get the names of vect by passing vect as an argument to the names() function.
names(vect)

# Optimal way to assign named elements to numeric vector!
vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf")

# Is vect & vect2 identical?
identical(vect, vect2)

# Get the second element of vect?
vect["bar"]

# Likewise, we can specify a vector of names with vect[c("foo", "bar")]. Try it out.
vect[c("foo", "bar")]

#------------------ 7: Matrices and Data Frames
# In this lesson, we'll cover matrices and data frames. Both represent 'rectangular' data types, 
# meaning that they are used to store tabular data, with rows and columns.
# Let's create a vector containing the numbers 1 through 20. Store the result in a variable called my_vector.
my_vector <- 1:20
my_vector

# The dim() function tells us the 'dimensions' of an object.
dim(my_vector)
# Since my_vector is a vector, it doesn't have a `dim` attribute (so it's just NULL), but we | can find its length using the length() function
length(my_vector)

# what happens if we give my_vector a `dim` attribute?
dim(my_vector) <- c(4, 5)
# In this case, we assigned the value c(4, 5) to the `dim` attribute of my_vector. We just gave my_vector 4 rows and 5 columns.
# Now it's a matrix.

#  Now confirm that we've set the `dim` attribute correctly.
dim(my_vector)
OR
attributes(my_vector)
# View the contents of my_vector
my_vector

# Now, let's confirm it's actually a matrix by using the class() function.
class(my_vector)

# We should store it in a new variable that helps us remember what it is.
my_matrix <- my_vector

# ?matrix
# matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)

# how to create a matrix containing the samenumbers (1-20) and dimensions (4 rows, 5 columns) by calling the matrix() function. 
# Store the result in a variable called my_matrix2.
my_matrix2 <- matrix(1:20, 4, 5)

# let's confirm that my_matrix and my_matrix2 are actually identical.
identical(my_matrix, my_matrix2)

# Let's start by creating a character vector containing the names of our patients -- Bill, Gina, Kelly, and Sean. 
# Remember that double quotes tell R that something is a character string. Store the result in a variable called patients.
patients <- c("Bill", "Gina", "Kelly", "Sean")

# Now we'll use the cbind() function to 'combine columns'.
cbind(patients, my_matrix)
# It appears that combining the character vector with our matrix of numbers caused everything to be enclosed in double quotes.
# If you remember back to the beginning of this lesson, I told you that matrices can only contain ONE class of data. Therefore,
# when we tried to combine a character vector with a numeric matrix, R was forced to 'coerce' the numbers to characters, hence
# the double quotes.

# how to include the names of our patients in the table without destroying the integrity of our numeric data. Try the following
my_data <- data.frame(patients, my_matrix)
my_data
# It looks like the data.frame() function allowed us to store our character vector of names right alongside our matrix of numbers.

# Behind the scenes, the data.frame() function takes any number of arguments and returns a single object of class `data.frame` 
# that is composed of the original objects. Let's confirm this by calling the class() function on our newly created data frame.
class(my_data)

# let's solve a problem by assigning names to the columns of our data frame so that we know what type of measurement each column represents.
# Create a character vector called cnames that contains the following values (in order) -- "patient", "age", "weight",
# "bp", "rating", "test".
cnames <- c("patient","age","weight","bp","rating","test")

# Now, use the colnames() function to set the `colnames` attribute for our data frame.
colnames(my_data) <- cnames
my_data

#------------------ 8: Logic
# This lesson is meant to be a short introduction to logical operations in R.

# Use the equality operator below to find out if TRUE is equal to TRUE.
TRUE == TRUE

# Just like arithmetic, logical expressions can be grouped by parenthesis so that the entire expression (TRUE == TRUE) == TRUE evaluates to TRUE.
(FALSE == TRUE) == FALSE

# The equality operator can also be used to compare numbers.
6 == 7

# Write an expression to test whether 6 is less than 7
6 < 7

# Write an expression to test whether 10 is less than or equal to 10.
10 <= 10

# Which of the following evaluates to FALSE?
# 1: 7 == 7
# 2: 9 >= 10
# 3: 0 > -36
# 4: 6 < 8

# | Which of the following evaluates to TRUE?
# 1: 57 < 8
# : -6 > -7
# 3: 9 >= 10
# 4: 7 == 9

# Try an expression to see if 5 is not equal to 7.
5 != 7 

# Try using the NOT operator and the equals operator to find the opposite of whether 5 is equal to 7.
!(5 == 7)

#  Let's take a moment to review. The equals operator `==` tests whether two boolean values or numbers are equal, the not
# equals operator `!=` tests whether two boolean values or numbers are unequal, and the NOT operator `!` negates logical
# expressions so that TRUE expressions become FALSE and FALSE expressions become TRUE.

# Which of the following evaluates to FALSE?
# 1: 9 < 10
# 2: !(0 >= -1)
# 3: !FALSE
# 4: 7 != 8

# What do you think the following expression will evaluate to?: (TRUE != FALSE) == !(6 == 7)
# 1: Can there be objective truth when programming?
# 2: FALSE
# 3: %>%
# 4: TRUE

# Try typing FALSE & FALSE to how it is evaluated.
FALSE & FALSE

# Type the expression TRUE & c(TRUE, FALSE, FALSE).
TRUE &c(TRUE, FALSE, FALSE)
# The left operand `TRUE` is recycled across every element in the vector of the right operand.

# Now we'll type the same expression except we'll use the `&&` operator. The && version of AND works differently.
TRUE && c(TRUE, FALSE, FALSE)
# For ||, && and isTRUE, a length-one logical vector.








#------------------------------------------------Exercise 1
# Q1) What version of R are you using?
R.Version()

# Q2) Create a numeric vector containing the numbers 2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23.
# What is the average of these numbers?

# method 1
x <- c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
sum(x)
length(x)
sum(x) / length(x)

# method 2
x <- c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
mean(x)

# Q3) Use a for loop to determine the value
# method 1
x <- seq(1, 25)
x * x
sum(x * x)

# method 2
sum <- 0
for(i in 1:25)
  sum <- sum + i^2
sum

# Q4) The cars dataset is available in base R. 
# You can type cars to see it. Use the class() function to determine what type of object is cars.
cars
class(cars)

# Q5) How many rows does the cars object have?
nrow(cars)

# Q6) What is the name of the second column of cars?
names(cars)[2]

# Q7) The simplest way to extract the columns of a matrix or data.frame is using [. For example you can access the second column with cars[,2].
# What is the average distance traveled in this dataset?
mean(cars[,2])

# Q8) Familiarize yourself with the which() function. Which row of cars has a a distance of 85?
which(cars[,2] == 85)
  
