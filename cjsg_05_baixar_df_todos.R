df_10 <- tjba_baixar_df(livre = "locação AND temporada", pagina = 10)

df_10 <- df_10$data$filter$decisoes

df_junto <- bind_rows(df_0, df_1, df_2, df_3, df_4, df_5, df_6, df_7, df_8, df_9, df_10)