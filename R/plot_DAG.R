# DAG
dag_unconditional <- confounder_triangle(x = "Exercise", y = "Cholesterol", z = "Avg.Age", x_y_associated = TRUE) %>%
  ggdag_adjust(
    var = NULL,
    text = FALSE,
    use_labels = "label"
  ) +
  theme_dag(panel.background = element_rect(fill = "#ffffff", colour = "#ffffff"))

dag_conditional <- confounder_triangle(x = "Exercise", y = "Cholesterol", z = "Avg.Age", x_y_associated = TRUE) %>%
  ggdag_adjust(
    var = "z",
    text = FALSE,
    use_labels = "label") +
  theme_dag(panel.background = element_rect(fill = "#ffffff", colour = "#ffffff"))
