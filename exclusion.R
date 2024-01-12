library(tidyverse)
library(afex)
library(BayesFactor)
library(apa)
library(emmeans)
library("writexl")
load("C:/Users/munizdie/OneDrive - Lancaster University/Experiments/Recognition Memory/UNM08/UNM08_analysis/UNM08_proc_data.RData")


block1 <- filter(stage1, block == 1) %>%
  group_by(pNum) %>%
  summarise (block1 = mean(correct_answer, na.rm = TRUE))
block6 <- filter(stage1, block == 6) %>%
  group_by(pNum, condition) %>%
  summarise (block6 = mean(correct_answer, na.rm = TRUE))

blocks16 <- cbind(block1, block6)

block1_mean <- filter(stage1, block == 1) %>%
  summarise (block1 = mean(correct_answer, na.rm = TRUE))
