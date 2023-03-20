# Generate scatter plots
plot_unconditional <-  ggplot(data, aes(y = Cholesterol, x = Exercise
                                      )) +
  geom_point(size = 2) +
  theme_classic()

plot_conditional <- ggplot(data, aes(y = Cholesterol, x = Exercise,
                                     shape = Avg.Age, color = Avg.Age)) +
  geom_point(size = 2) +
  theme_classic() + theme(legend.position = c(0.95, 0.2))

plot_unconditional_regressionline <- plot_unconditional +
  geom_smooth(formula = y ~ x, method = "lm", se = FALSE, color = "red")

plot_conditional_regressionline <- plot_conditional +
  geom_smooth(formula = y ~ x, method = "lm", se = FALSE, color = "red")
