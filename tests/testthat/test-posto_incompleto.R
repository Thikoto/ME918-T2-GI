library(testthat)
devtools::load_all()

test_that("posto_incompleto", {
  expect_error(betas(dados_teste, matrix(c(dados_teste$x_seq, dados_teste$x_seq2, dados_teste$x3), ncol = 3), dados_teste$y_erro), "posto completo", info = "X não possui posto completo")
})
