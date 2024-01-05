tjba_baixar_df <- function(
    livre = "",
    pagina = 0,
    dataInicial = "1980-02-01T03:00:00.000Z"){
  
  #Corpo da requisição
  payload <- list(
    operationName = "filter",
    variables = list(
      decisaoFilter = list(
        assunto = livre,
        orgaos = list(),
        relatores = list(),
        classes = list(),
        dataInicial = dataInicial,
        segundoGrau = TRUE,
        turmasRecursais = TRUE,
        tipoAcordaos = TRUE,
        tipoDecisoesMonocraticas = TRUE,
        ordenadoPor = "dataPublicacao"
      ),
      pageNumber = pagina,
      itemsPerPage = 10
    ),
    query = "query filter($decisaoFilter: DecisaoFilter!, $pageNumber: Int!, $itemsPerPage: Int!) { filter(decisaoFilter: $decisaoFilter, pageNumber: $pageNumber, itemsPerPage: $itemsPerPage) { decisoes { dataPublicacao relator { id nome __typename } orgaoJulgador { id nome __typename } classe { id descricao __typename } conteudo tipoDecisao ementa hash numeroProcesso __typename } relatores { key value __typename } orgaos { key value __typename } classes { key value __typename } pageCount itemCount __typename } }"
  )
  
  #Requisição
  r <- httr::POST(url = url, body = payload, httr::accept_json(), encode = "json")
  
  df <- httr::content(r, simplifyDataFrame = TRUE)
  
  return(df)
  
}