library(ellmer)

chat <- chat_gemini(
  model = "gemini-2.0-flash"
)

chat$chat("Какое сейчас время по Минску?")

get_current_time <- function(tz = "UTC") {
  format(Sys.time(), tz = tz, usetz = T)
}

chat$register_tool(tool(
  get_current_time,
  "Получить текущее время в указанном часовом поясе",
  tz = type_string(
    "Часовой пояс. По умолчанию `\"UTC\"`.",
    required = F
  )
))

chat$chat("Какое сейчас время по Минску?")
