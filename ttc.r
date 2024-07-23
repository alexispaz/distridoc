if(!require('matchingMarkets')) {
  install.packages('matchingMarkets', lib = Sys.getenv("R_LIBS_USER"), repos = "https://cran.rstudio.com/")
}
library('matchingMarkets')

# Matriz de preferencias individuales
P <- matrix(c(
14, 20, 16, 3 , 4 , 7 , 8 , 2 , 1 , 23, 22, 21, 9 , 12, 24, NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Martínez  
14, 20, 16, 3 , 4 , 7 , 8 , 2 , 1 , 23, 22, 21, 9 , 12, 24, NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Martínez  
18, 6 , 5 , 11, 13, 10, 15, NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Montiel   
18, 6 , 5 , 11, 13, 10, 15, NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Montiel   
18, 6 , 5 , 11, 13, 10, 15, NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Montiel   
18, 6 , 5 , 11, 13, 10, 15, NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Montiel   
21, 19, 17, 10, 12, 18, 6 , 22, 5 , 2 , 4 , 3 , 7 , 8 , 9 , 15, 13, 20, 24, 23, 16, 14, 11, 1 ,  # Romero    
5 , 13, 4 , 11, 24, 7 , 3 , 15, 14, 21, 20, 18, 23, 16, 1 , 10, 19, 8 , 22, 17, 12, 9 , 6 , 2 ,  # Otamendi  
14, 16, 20, 12, 2 , 8 , 9 , 17, 15, 13, 11, 6 , 5 , 4 , 22, 7 , 3 , 1 , 24, 23, 21, 18, 10, 19,  # Acuña     
14, 16, 20, 12, 2 , 8 , 9 , 17, 15, 13, 11, 6 , 5 , 4 , 22, 7 , 3 , 1 , 24, 23, 21, 18, 10, 19,  # Acuña     
21, 24, 23, 19, 3 , 5 , 4 , 7 , 11, 16, 20, 22, 12, 9 , 8 , 6 , 2 , 10, 18, 17, 15, 13, 14, 1 ,  # Tagliafico
21, 24, 23, 19, 3 , 5 , 4 , 7 , 11, 16, 20, 22, 12, 9 , 8 , 6 , 2 , 10, 18, 17, 15, 13, 14, 1 ,  # Tagliafico
11, 14, 20, 16, 13, 11, 15, 12, 3 , 7 , 4 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # DePaul    
11, 14, 20, 16, 13, 11, 15, 12, 3 , 7 , 4 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # DePaul    
11, 14, 20, 16, 13, 11, 15, 12, 3 , 7 , 4 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # DePaul    
11, 14, 20, 16, 13, 11, 15, 12, 3 , 7 , 4 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # DePaul    
6 , 8 , 9 , 12, 2 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Messi     
17, 12, 9 , 8 , 6 , 11, 14, 20, 13, 18, NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Suarez    
17, 12, 9 , 8 , 6 , 11, 14, 20, 13, 18, NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Suarez    
11, 13, 14, 15, 16, 20, 18, 10, 1 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # Paredez   
11, 17, 14, 1 , 4 , 12, 5 , 13, 15, 6 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # DiMaria   
11, 17, 14, 1 , 4 , 12, 5 , 13, 15, 6 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # DiMaria   
11, 17, 14, 1 , 4 , 12, 5 , 13, 15, 6 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # DiMaria   
11, 17, 14, 1 , 4 , 12, 5 , 13, 15, 6 , NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,  # DiMaria   
16, 20, 15, NA, NA, NA, NA, NA, NA, NA, NA,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA ,NA    # Alvarez   
),byrow=FALSE, nrow=24, ncol=25); P 

X <- sample(1:25, size = 24);X

# Run TTC
sol <- ttc(s.prefs=P,houses=X);

com <- as.vector(sol$obj); com

print("LIBRES")
for (i in 1:24) {
	a<-which(com==i);
	if(identical(a, integer(0))) {
    print(i)
  }
}
print("LIBRES")

for (i in 1:25) {
	a<-which(P[,i]==com[i]);
	if(identical(a, integer(0))) {
    a<-which(is.na(P[,i]))[1];
	}
  print(a)
}

sol

