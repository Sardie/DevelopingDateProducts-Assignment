library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Prediction of Species Type using Sepal and Petal"),
        sidebarPanel(
                h4("This app features a simple program to predict the sub-species of iris flowers, 
           by using the sepal length and width, and petal length and width. This app does 
           not yet possess the ability to catch errors. Please enter only valid numerical 
                   values for he prediction"),
                textInput(inputId="S.Length", label="Sepal Length (positive values up to 10.0", value = 5.1),
                textInput(inputId="S.Width", label="Sepal Width (positive values up to 5.0", value = 3.5),
                textInput(inputId="P.Length", label="Petal Length (positive values up to 10.0", value = 1.4),
                textInput(inputId="P.Width", label="Petal Width (positive values up to 5.0", value = 0.2),
                actionButton("goButton", "Predict")
        ),
        mainPanel(
                h4('You entered Sepal Length = '),
                verbatimTextOutput('S.LengthVal'),
                h4('You entered Sepal Width = '),
                verbatimTextOutput('S.WidthVal'),
                h4('You entered Petal Length = '),
                verbatimTextOutput('P.LengthVal'),
                h4('You entered Petal Width = '),
                verbatimTextOutput('P.WidthVal'),
                h4('The predicted sub-species based on the entered values is'),
                verbatimTextOutput('outputVal'),
                h4('---end---')
        )
))