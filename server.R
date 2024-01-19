shinyServer(function(input, output) {

  output$age_scatter_plot <- renderPlot({

    if (!input$age) {
      plot <- plot_unconditional

      if (input$regression_line) {
        plot <- plot_unconditional_regressionline
      }

    } else {
      plot <- plot_conditional

      if (input$regression_line) {
        plot <- plot_conditional_regressionline
      }
    }

    plot
  })

  output$age_dag <- renderPlot({
    if (!input$age) {
      dag <- dag_unconditional
    } else {
      dag <- dag_conditional
    }
    dag
  })

  output$regression_tbl <- render_gt({
    if (!input$age) {
      reg_output <- reg_unconditional
    } else {
      reg_output <- reg_conditional
    }
    reg_output
  })

  # Code to keep app alive after timeout (Heroku timeout after ca. 55 seconds)
  # autoInvalidate <- reactiveTimer(10000)
  # observe({
  #   autoInvalidate()
  #   cat(".")
  # })
})
