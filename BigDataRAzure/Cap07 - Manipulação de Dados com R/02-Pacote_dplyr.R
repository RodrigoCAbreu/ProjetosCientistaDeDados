# Limpeza, Formatação e Manipulação de Dados em R 
# dplyr - Transformação de Dados

# Instalando os pacotes
install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)


# Carregando o dataset
sono_df <- read_csv("sono.csv")
View(sono_df)
head(sono_df)
class(sono_df)
str(sono_df)


# Função glimpse() pode ser usada no lugar da função str()
glimpse(sono_df)


# Aplicando mutate
#Utilizada para modificar o conjunto de dados, Ex: criação de uma nova coluna
glimpse(mutate(sono_df, peso_libras = sono_total / 0.45359237))


# Contagem e histograma
count(sono_df, cidade)
count(sono_df, nome)
hist(sono_df$sono_total)


# Amostragem
sample_n(sono_df, size = 10)


# select()
sleepData <- select(sono_df, nome, sono_total)
head(sleepData)
class(sleepData)
select(sono_df, nome)
select(sono_df, nome:cidade)
select(sono_df, nome:pais) # seleciona um range de colunas


# filter()
filter(sono_df, sono_total >= 16)
filter(sono_df, sono_total >= 16, peso >= 80)
filter(sono_df, cidade %in% c("Recife", "Curitiba"))


# arrange(), ordenação pela coluna cidade (alfabética)
sono_df %>% arrange(cidade) %>% head

#Selecionando as colunas e ordenando por cidade sono total
sono_df %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>% 
  head

sono_df %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>% 
  filter(sono_total >= 16)

sono_df %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, desc(sono_total)) %>% 
  filter(sono_total >= 16)

#Cria uma nova coluna em tempo de execução
# mutate()
head(sono_df)
sono_df %>% 
  mutate(novo_indice = sono_total / peso) %>%
  head

head(sono_df)


sono_df %>% 
  mutate(novo_indice = sono_total / peso, 
         peso_libras = peso / 0.45359237) %>%
  head


# summarize()
# calcula a média do sono_total
sono_df %>% 
  summarise(media_sono = mean(sono_total))

sono_df %>% 
  summarise(media_sono = mean(sono_total), 
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n()) #total de registros


# group_by()
sono_df %>% 
  group_by(cidade) %>%
  summarise(avg_sono = mean(sono_total), 
            min_sono = min(sono_total), 
            max_sono = max(sono_total),
            total = n())


# Operador: %>%
head(select(sono_df, nome, sono_total))

sono_df %>% 
  select(nome, sono_total) %>% 
  head


sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)


sono_df
View(sono_df)


sono_df2 <- sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)

View(sono_df2)



