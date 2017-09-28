#Create a function that adds two numbers
add2<-function(x,y) {
  x+y
}

#Create a function that returns numbers below a specified number nH and above a specified nL
specified<-function(X,nH,nL){
  use<-X<nH & X>nL
  x[use]
}

#Create a function that calculates the mean of each column of a given matrix m
colmean<-function(m,removeNA=TRUE) {
 
  for(i in 1:ncol(m)) {
        means<-mean(m[,i],na.rm = removeNA ) # removes Na's from each column before computing means
means
    }
}

#Paste Function
paste("Philip","Jetty",sep=" & ")
paste("Programming", "is", "fun!")

telegram <- function(...){
        paste("START",...,"STOP")
        
}

#The "..." Argument in functions indicate a variable number of arguments that are usually passed on 
#to other functions.
#... is often used when extending another function and you don't want to copy the entire argument
#list of the original function
myplot <- function(x, y, type = "l", ...) {
  plot(x, y, type = type, ...)
}

#Lexical Scoping in R means that the values of free variables are searched forin the environment 
# in which the function was defined.This function has 2 formal arguments x and y. In the body of the 
# function there is another symbol z. In this case z is called a free variable. The scoping rules of a 
# language determine how values are assigned to free variables. Free variables are not formal arguments 
# and are not local variables (assigned insided the function body).
f <- function(x, y) {
  x^2 + y / z
}

#LexicalScoping Example#1
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
cube<-make.power(3)
square<-make.power(2)

#LexicalScoping Example#2-With lexical scoping the value of y in the function g is looked up in the 
#environment in which the function was defined, in this case the global environment, so the value of y is 10.
y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x)
}
g <- function(x) {
  x*y
}

# INVISIBLE - Prevents auto print
# These functions both return their argument
f1 <- function(x) x
f2 <- function(x) invisible(x)
f1(1)  # prints
f2(1)  # does not