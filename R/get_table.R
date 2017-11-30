get_idades <- function(child = TRUE){
  if(child){
    get_table(child, info_type = 3)
  } else {
    get_table(child, info_type = 1)
  }
}

get_table <- function(child = TRUE, info_type = 1, sit_crianca = "DISPONIVEL", sit_pretendente = "DISPONIVEL"){

  u0 <- httr::GET("http://www.cnj.jus.br/cnanovo/pages/publico/index.jsf")

  vs <- xml2::read_html(u0) %>%
    rvest::html_form() %>%
    magrittr::extract2(2) %>%
    magrittr::use_series(fields) %>%
    magrittr::use_series(javax.faces.ViewState) %>%
    magrittr::use_series(value)

  httr::POST(
    body = build_params(child, info_type, vs, sit_crianca, sit_pretendente),
    handle = u0) %>%
    xml2::read_html() %>%
    rvest::html_table() %>%
    magrittr::extract2(2) %>%
    janitor::clean_names() %>%
    abjutils::rm_accent_from_names() %>%
    dplyr::mutate(total = fix_numbers(total))
}

build_params <- function(child, info_type, vs, sit_crianca, sit_pretendente){
  params <- list(
    javax.faces.partial.ajax = "true",
    javax.faces.partial.execute = "@all",
    javax.faces.partial.render = help_child(child),
    formRelatorio = "formRelatorio",
    sitPret = sit_pretendente,
    flgEstran = "N",
    sitCrianca = sit_crianca,
    javax.faces.ViewState = vs
  )

  if(child){
    params[["basic2"]] <- info_type
    params[["javax.faces.source"]] <- "j_idt49"
    params[["j_idt49"]] <- "j_idt49"
  } else {
    params[["basic1"]] <- info_type
    params[["javax.faces.source"]] <- "j_idt33"
    params[["j_idt33"]] <- "j_idt33"
  }

  params
}

help_child <- function(child){
  ifelse(child, "formRelatorioCriancas:tbl", "formRelatorioPretendente:tbl2")
}

fix_numbers <- function(col){
  col %>%
    stringr::str_replace_all("[^0-9]","") %>%
    as.numeric()
}
