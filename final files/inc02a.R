cat("Hello world!\n")
cat("hello again\n")
cat(2, "\n")

a <- 1  # alt - minus
b <- 2L
c <- "string that contains a '"
d <- 'string that contains a "'
e <- FALSE
# 3 -> f

# define vectors
v <- c(1,2,3)
print(v)

# vectorized operations
print(v + 1)

w <- c(-1, 1, -2, 2, -3, 3)
print(w > 0)

cat("third element:", w[3], "\n")

a <- c(v, w)
print(a)

# missings
b <- c(1, 2, NA, 4)
is.na(b)
any(is.na(b))

a <- 1
if(a < 2) {
  cat("less than two\n")
} else {
  cat("two or more\n")
}

print(a <- c(v, w))
a <- 1; b <- 2; c <- 3

# test if vector contains NA
v <- c(1, 2, 3, 4, 5)
if(any(is.na(v))) {
  cat("there is a NA\n")
} else {
  cat("No missings\n")
}

gsa <- read.delim("../../data/GSAF5.csv.bz2")
print(head(gsa, 1))
nrow(gsa)
ncol(gsa)
names(gsa)
gsa$Type
table(gsa$Type)
unique(gsa$Type)
