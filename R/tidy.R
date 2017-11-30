#' @export
get_idades <- function(child = TRUE, ...){
  if(child){
    d <- get_table(child, info_type = 3, ...)
  } else {
    d <- get_table(child, info_type = 1, ...)
  }
  d %>%
    filter(stringr::str_detect(titulo, " ano")) %>%
    mutate(titulo = fix_idades(titulo),
           total = fix_numbers(total),
           porcentagem = total/sum(as.numeric(total)),
           idade = titulo,
           frequencia = total,
           tipo = ifelse(child, "criancas", "pretendentes")) %>%
    select(idade, frequencia, porcentagem, tipo)
}

fix_idades <- function(col){
  stringr::str_extract(col, "(com|até|menos de) [0-9]+ anos?")
}
