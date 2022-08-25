shinyUI(dashboardPage(
  title = "Simpsons Paradox: Cholesterol Example",
  # Layout option defined in "R/Packages_Colors.R"
  skin = dashboard_skin,
  # Layout option defined in "R/Packages_Colors.R"
  dbHeader,
  # Adjust Sidebar (left)
  dashboardSidebar(
    sidebarMenu(
      # Item in Sidebar
      # Watch out for `tabName`: Must be matched by definition
      # of the 'tabItem' below
      menuItem("Simpson's Paradox", tabName = "simpson",icon = icon("chart-line")),
      menuItem("Code", tabName = "code", icon = icon("github")),
      menuItem("References", tabName = "references", icon = icon("book")))
  ),
  # Adjust Body of Dashboard
  dashboardBody(
    # Layout option defined in "R/Packages_Colors.R"
    tags$head(tags$style(HTML(
      ".box.box-solid.box-primary>.box-header {
        color:#fff;
        background:#000000
        }
        .box.box-solid.box-primary{
        border-bottom-color:#000000;
        border-left-color:#000000;
        border-right-color:#000000;
        border-top-color:#000000;
        }"),
      HTML("
        .box.box-solid.box-success>.box-header {
        color:#000000;
        background:#ffda3e
        }
        .box.box-solid.box-success{
        border-bottom-color:#ffda3e;
        border-left-color:#ffda3e;
        border-right-color:#ffda3e;
        border-top-color:#ffda3e;
        }"))),
    # Layout for math formula
    withMathJax(),
    # Layout option defined in "R/Packages_Colors.R"
    chooseSliderSkin(slider_skin,color = slider_color),
    # Boxes need to be put in a row (or column), overall width has to be 12
    tabItems(
      tabItem(tabName = "simpson",
              h2("Simpson's Paradox: Cholesterol Example"),
              p("This app illustrates the Simpson's Paradox based on the Cholesterol Example in Glymour et al. (2016, Section 1.2). In this example, we want to assess the effect of exercise on cholesterol in various age groups. The scatter plot below suggests that overall more exercise leads to higher cholesterol. However, if we consider each of the age groups separately, the sign of the effect is negative."),
              h2("Does More Exercise lead to Higher Cholesterol?"),
              p(""),
              h2("Regression Output and Directed Acyclic Graph (DAG)"),
              p("Regression output corresponding to sample selection, i.e., do (not) only condition on age."),
              p("Click on the checkbox to see how scatter plot, regression line, regression output and DAG change when we condition on the confounder 'age'."),
              fluidRow(
                box(
                  fluidRow(
                    box(
                      title = "Options", solidHeader = TRUE, status = boxcol_1,
                      checkboxInput("age",
                                    "Conditioning on age group",
                                    value = FALSE),
                      checkboxInput("regression_line",
                                    "Show regression line",
                                    value = TRUE),
                      width = 12
                    ),
                    box(
                      title = "Regression Output", solidHeader = TRUE, status = boxcol_1,
                      gt_output("regression_tbl"),
                      width = 12
                    )),
                  width = 4),
                box(
                  fluidRow(
                    box(
                      title = "Scatter Plot", solidHeader = TRUE, status = boxcol_2,
                      plotOutput("age_scatter_plot", height = 450),
                      width = 12),
                    box(
                      title = "DAG", solidHeader = TRUE, status = boxcol_2,
                      plotOutput("age_dag", height = 450),
                      width = 12
                    )),
                  width = 8)
              )
      ),
      tabItem(tabName = "code",
              h2("Code"),
              p("The code is available at the GitHub repository",
                tags$a("https://github.com/DigitalCausalityLab/simpsonsparadox.", href="https://github.com/DigitalCausalityLab/simpsonsparadox")
              ),
              p("In case you find a bug or have suggestion for improvements, please open an issue in",
                tags$a("GitHub.", href = "https://github.com/DigitalCausalityLab/simpsonsparadox/issues")
              )
      ),
      tabItem(tabName = "references",
              h2("References"),
              p("Glymour, Madelyn, Judea Pearl, and Nicholas P. Jewell. Causal inference in statistics: A primer. John Wiley & Sons, 2016.")
      )
    )
  )
)
)
