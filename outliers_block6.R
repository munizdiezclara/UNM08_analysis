library("rstatix")

#Create probable response variable, as we are using the uncertain condition
stage1 <- stage1 %>%
  mutate(prob_response = case_when((cue1 == 1 | cue1 == 3) & cue_o_mouse.clicked_name == "o1_image" ~ 1,
                                   (cue1 == 1 | cue1 == 3) & cue_o_mouse.clicked_name == "o2_image" ~ 0, 
                                   (cue1 == 2 | cue1 == 4) & cue_o_mouse.clicked_name == "o1_image" ~ 0,
                                   (cue1 == 2 | cue1 == 4) & cue_o_mouse.clicked_name == "o2_image" ~ 1))
stage1$condition <- as.factor(stage1$condition)
mean_stage1_block6 <- filter(stage1, block == 6) %>%
  group_by(pNum, condition) %>%
  summarise(mean_response = mean(prob_response, na.rm = TRUE))

outliers_block1 <- mean_stage1_block6 %>%
  identify_outliers("mean_response")