library(ellmer)

chat <- chat_gemini()

personal_data_str <- type_object(
  age = type_integer("Возраст в годах, целое число"),
  name = type_string("Имя"),
  job = type_string("Занимаемая на работе должность")
)

text <- "Привет, меня зовут Евгений, мне 25 лет, с 2024 года я работаю ведущим аналитиком данных в Паритетбанке."

personal_data <- chat$extract_data(text, type = personal_data_str)

# классификация настроения комментария

text <- "
Купленный товар работает отлично, к нему никаких претензий,
но обслуживание клиентов было ужасным,
я больше не буду у них покупать.
"

type_sentiment <- type_object(
  "Извлеки оценки настроений заданного текста. Сумма оценок настроений должна быть равна 1.",
  positive_score = type_number("Положительная оценка, число от 0.0 до 1.0"),
  negative_score = type_number("Отрицательная оценка, число от 0.0 до 1.0"),
  neutral_score = type_number("Нейтральная оценка, число от 0.0 до 1.0")
)

str(chat$extract_data(text, type = type_sentiment))
