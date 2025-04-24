# install.packages(c("shiny", "shinychat", "here"))
library(shiny)
library(shinychat)

ui <- bslib::page_fluid(
  chat_ui("chat")
)

server <- function(input, output, session) {
  # chat <- ellmer::chat_gemini(system_prompt = "В этом чате ты специалист по языку программирования R.")
  chat <- ellmer::chat_gemini(system_prompt = paste(
    readLines(here::here("system_prompt.md")), colapse = "\n")
  )
  
  observeEvent(input$chat_user_input, {
    stream <- chat$stream_async(input$chat_user_input)
    chat_append("chat", stream)
  })
}

shinyApp(ui, server)
