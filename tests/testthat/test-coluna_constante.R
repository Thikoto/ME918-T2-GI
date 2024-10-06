library(testthat)
devtools::load_all()

test_that("coluna_constante", {
  expect_error(betas(dados_teste, matrix(c(dados_teste$x_constante, dados_teste$x2, dados_teste$x3), ncol = 3), dados_teste$y_erro), "singular", info = "Matriz X^T*X não é invertível.")
})
