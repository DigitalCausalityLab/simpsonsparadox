set.seed(75)
n = 1000

Avg.Age_group = sample(seq(10,50,10), n, replace = TRUE)

ex_mean = 10
ex_sd = 15
ch_sd = 15

effect_Avg.Age_exercise = 4
effect_Avg.Age_cholesterol = 4

exercise = rnorm(n, mean = ex_mean, sd = ex_sd) + Avg.Age_group * effect_Avg.Age_exercise

# cholesterol = Avg.Age_group + exercise
cholesterol = 130 + (-0.5) * exercise + rnorm(n, sd = ch_sd) + Avg.Age_group * effect_Avg.Age_cholesterol


data = data.frame("Cholesterol" = cholesterol, "Exercise" = exercise,
                  "Avg.Age" = factor(Avg.Age_group))
data = as_tibble(data)
data
