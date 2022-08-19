# Generate regression output
reg_unconditional <- lm(Cholesterol ~ Exercise, data) %>%
  tbl_regression() %>% as_gt()

# TODO: Fix implementation and output
# reg_conditional <- data %>% group_by(Avg.Age) %>%
#   do(tidy(lm(Cholesterol ~ Exercise, data = .)))

age_groups <- levels(data$Avg.Age)
models <- lapply(age_groups, function(x) models = lm(Cholesterol ~ Exercise, data[data$Avg.Age == x,]))
reg_conditional <- lapply(models, tbl_regression) %>%
  tbl_merge(tab_spanner = age_groups) %>%
  as_gt()
