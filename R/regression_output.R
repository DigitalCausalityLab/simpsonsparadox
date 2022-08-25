# Generate regression output
lm_unconditional <- data %>% lm(Cholesterol ~ Exercise, data =.) %>%
  summary()

reg_unconditional <- tibble("Age Group" =  c("10 - 50")) %>%
  mutate("Estimate" = c(lm_unconditional$coefficients[2, "Estimate"])) %>%
  mutate("p.value" = c(lm_unconditional$coefficients[2, 4])) %>%
  gt() %>%
  cols_label(`Age Group` = md("**Age Group**"),
             Estimate = md("**Estimate**"),
             p.value = md("**Pr(>|t|)**")) %>%
  fmt_number(columns = 2:3,
             decimals = 3)


reg_conditional <- data %>% group_by(Avg.Age) %>%
  group_map(~ broom::tidy(lm(Cholesterol ~ Exercise, data = .x))) %>%
  bind_rows() %>% filter(term == "Exercise") %>%
  mutate("Age Group" = levels(data$Avg.Age)) %>%
  # mutate(p.value = round(p.value,4)) %>%
  rename(Estimate = estimate) %>%
  select("Age Group", Estimate, p.value) %>%
  gt() %>%
  cols_label(`Age Group` = md("**Age Group**"),
             Estimate = md("**Estimate**"),
             p.value = md("**Pr(>|t|)**")) %>%
  fmt_number(columns = 2:3,
             decimals = 3)
