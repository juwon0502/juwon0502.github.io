rankings <- read.csv(
  "Academic/2021-2022/Spring/SDS 322/Unit 2/Project/Data/Top 100 Players Master Dataset.csv"
  )

qb_stats <- read.csv("Academic/2021-2022/Spring/SDS 322/Unit 2/Project/Data/qb_stats.csv")
rb_stats <- read.csv("Academic/2021-2022/Spring/SDS 322/Unit 2/Project/Data/rb_stats.csv")
te_stats <- read.csv("Academic/2021-2022/Spring/SDS 322/Unit 2/Project/Data/te_stats.csv")
wr_stats <- read.csv("Academic/2021-2022/Spring/SDS 322/Unit 2/Project/Data/wr_stats.csv")
def_stats <- read.csv("Academic/2021-2022/Spring/SDS 322/Unit 2/Project/Data/def_stats.csv")

rankings

library(tidyverse)

untidy_rankings <- rankings %>% unite(rank_team_pos, c("Rank", "Team", "Position")) %>%
  pivot_wider(names_from = Year,
              values_from = rank_team_pos)

untidy_rankings

#qb <- 

rankings %>% filter(Position == "QB") %>% 
  inner_join(qb_stats, by = c("Year", "Player")) %>%
  ggplot(aes(x = Rank, y = Rate)) + geom_point()


untidy_rankings <- rankings %>% pivot_wider(names_from = Year, 
                         values_from = c(Rank, Team)) 


write.csv(untidy_rankings, 
          "Academic/2021-2022/Spring/SDS 322/Unit 2/Project/Data/Ranking.csv")


rankings <- read.csv("Academic/2021-2022/Spring/SDS 322/Unit 2/Project/Data/Ranking.csv")

rankings <- rankings %>% pivot_longer(cols = c("X2010":"X2020"),
                          names_to = "Year",
                          values_to = "rank_team_pos") %>%
  separate(rank_team_pos, into = (c("Rank","Team","Position")), convert = T) %>%
  separate(Year, into = (c("x1","Year")), sep = (1:1), convert = T) %>%
  select(-X, - x1) %>% drop_na() %>%
  arrange(Year, Rank)

head(rankings1, 10)
rankings
