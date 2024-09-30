set.seed(1234)
x1 <- rnorm(150, 56, 1)
x2 <- rnorm(150, 89, 1.5)
x3 <- rnorm(150, 15, 3)
x_constante <- rep(20, 150)
x_seq <- seq(1:150)
x_seq2 <- 2*x_seq
erro <- rnorm(150, 0, 5)
y_erro <- 23 + 3.2*x1 - 0.7*x2 + 5.8*x3 + erro
y_sem_erro <- 23 + 3.2*x1 - 0.7*x2 + 5.8*x3

dados_teste <- data.frame(y_erro, y_sem_erro, x1, x2, x3, x_constante, x_seq, x_seq2)

save(dados_teste, file = "dados/dados_teste.rda")
