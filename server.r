library(shiny)
library(caret)

data(iris)

data <- iris
prediction <- function(S.Length, S.Width, P.Length, P.Width) {
        inTrain <- createDataPartition(y=data$Species, p=0.7, list=FALSE)
        training <- data[inTrain,]
        testing <- data[-inTrain,]
        inTrain <- NULL
        
        set.seed(32343)
        model <- train(Species~., data=training, method="lda")
        pred <- predict(model, testing)
        length(pred[pred == testing$Species])/nrow(testing)
        newData <- data.frame(S.Length, S.Width, P.Length, P.Width)
        names(newData) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
        pred <- predict(model, newData)
        pred <- as.character(pred)

}

shinyServer(
        function(input, output){
                output$S.LengthVal <- renderText({input$S.Length})
                output$S.WidthVal <- renderText({input$S.Width})
                output$P.LengthVal <- renderText({input$P.Length})
                output$P.WidthVal <- renderText({input$P.Width})
                output$outputVal <- renderText({
                        input$goButton
                        isolate(prediction(as.numeric(input$S.Length), as.numeric(input$S.Width), as.numeric(input$P.Length), as.numeric(input$P.Width)))
                })
                
        }
)

