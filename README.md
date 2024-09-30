# ME918-T2-GI - Pacote "Regressao"

Este pacote implementa funções úteis para realizar e analisar modelos de **regressão linear** no R. Ele facilita o processo de ajuste de modelos lineares e oferece ferramentas adicionais para diagnóstico e visualização.

## Funcionalidades

O pacote inclui as seguintes funções principais:

- `betas()`: Esta função calcula os coeficientes estimados (\(\hat{\beta}\)) da regressão linear utilizando a fórmula matricial ![Fórmula em LaTeX](https://latex.codecogs.com/png.latex?\hat{\beta}%20=%20(X^T%20X)^{-1}%20X^T%20y)
- `preditos()`: Esta função calcula os valores preditos com base nas variáveis independentes e nos coeficientes estimados pelo modelo de regressão.
- `residuos()`: Esta função calcula os resíduos (diferença entre os valores observados e os preditos) para um modelo de regressão linear.
- `novos_preditos()`: Esta função realiza predições para novos dados com base em um modelo de regressão ajustado manualmente.
- `grafico()`: Esta função gera um gráfico comparando os valores observados com os valores preditos para o modelo de regressão.

## Instalação

Para instalar este pacote diretamente do GitHub, você pode usar o `devtools`:

```r
# Se ainda não tem o devtools instalado, execute:
install.packages("devtools")

# Instale o pacote a partir do GitHub
devtools::install_github("seu-usuario/seu-repositorio")
```

## Exemplo de uso

```r
# Carregar o pacote
library(Regressao)

# Carregar um conjunto de dados de exemplo
data(mtcars)

# Ajustar um modelo de regressão linear
betas_estimados <- betas(matrix(c(mtcars$cyl, mtcars$hp, mtcars$disp), ncol = 3), mtcars$mpg)

# Verificar os coeficientes ajustados
valores_preditos <- preditos(mtcars, matrix(c(mtcars$cyl, mtcars$hp, mtcars$disp), ncol = 3), betas_estimados)

# Diagnóstico de resíduos
residuos_obtido <- residuos(mtcars$mpg, valores_preditos)

# Fazer previsões com novos dados
novos_dados <- data.frame(x1 = c(2.5, 3.0), x2 = c(120, 150), x3 = c(120, 150))
novos_preditos(novos_dados, betas_estimados)

# Visualizar a regressão
graficos = grafico(mtcars$mpg, valores_preditos, residuos_obtido)
```
