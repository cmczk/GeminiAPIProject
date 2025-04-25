# install.packages("ellmer")
library(ellmer)

# .Rprofile must contain Sys.setenv(GOOGLE_API_KEY = "...")

chat <- chat_gemini(
  model = "gemini-2.0-flash",
  system_prompt = "Ты специалист по анализу данных и разработчик на языке R
  В этом чате ты помогаешь генерировать код на языке R."
)

out <- chat$chat(
  "Напиши функцию, которая по заданному городу
  запрашивает текущую погоду из бесплатного API.",
  echo = "text"
)

writeLines(text = out, con = "./answer.md")
