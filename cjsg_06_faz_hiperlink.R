faz_link <- paste0("https://jurisprudenciaws.tjba.jus.br/inteiroTeor/", df_junto$hash)

df_links <- df_junto %>% mutate(link=faz_link)

df_links$link <- writexl::xl_hyperlink(unlist(df_links$link))