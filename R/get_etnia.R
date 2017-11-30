#' @export
get_etnia <- function(child = TRUE, ...){

  get_table(child, info_type = 1) %>%
    dplyr::filter(stringr::str_detect(titulo, "Que (são|aceitam)|Região")) %>%
    dplyr::mutate(regiao = fix_regiao(titulo),
           titulo = fix_etnia(titulo)) %>%
    tidyr::fill(regiao) %>%
    dplyr::filter(!is.na(titulo)) %>%
    dplyr::group_by(regiao) %>%
    dplyr::mutate(porcentagem = total/sum(as.numeric(total)),
           etnia = titulo,
           frequencia = total,
           tipo = ifelse(child, "criancas", "pretendentes")) %>%
    dplyr::ungroup() %>%
    dplyr::select(etnia, frequencia, porcentagem, tipo, regiao)
}

fix_etnia <- function(col){
  stringr::str_extract(col, "brancas?|negras?|amarelas?|pardas?|indígenas?") %>%
    stringr::str_replace("s", "")
}

fix_regiao <- function(col){
  stringr::str_extract(col, "Norte|Nordeste|Centro-Oeste|Sudeste|Sul") %>%
    stringr::str_to_lower()
}
