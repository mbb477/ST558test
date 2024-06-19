temps_data <- read_table(file = "https://www4.stat.ncsu.edu/~online/datasets/cityTemps.txt") 
temps_data
library(tidyr)
temps_data |>
  pivot_longer(cols = 2:8, 
               names_to = "day", 
               values_to = "temp")
temps_data
install.packages("DBI")
install.packages("RSQLite")
??read_functions

# Reading from a 

install.packages("bigrquery")

objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)
funs

library(tidyverse)
library(nycflights13)
flights

flights$dest
flights |> 
  filter(arr_delay >= 120, dest %in% c("HOU", "IAH"), 
         carrier %in% c("UA", "AA", "DL"), 
         month %in% c("July", "August", "September"), 
         arr_delay > 120 & dep_delay <= 0,
         dep_delay >= 60 & (dep_delay - arr_delay) > 30)
filtered_flights

fastest_flights <- flights |>
  mutate(speed = distance/air_time) |>
  arrange((speed))
fastest_flights$speed

flights |>
  arrange(desc(distance))

flights |>
  select(dep_time, dep_time, dep_time)
flights |> 
  select(dep_time, dep_delay:arr_time, arr_delay)

flights |> 
  select(!sched_dep_time, !sched_arr_time)

?any_of()
variables <- c("year", "month", "day", "dep_delay", "arr_delay")
flights |>
  select(-any_of(variables))
	Rename air_time to air_time_min to indicate units of measurement and 
	move it to the beginning of the data frame.
flights$air_time
flights |>
  rename(air_time_min = air_time) |>
  relocate(air_time_min)
  
flights |> select(contains("TIME"))


daily <- flights |>  
  group_by(year, month, day)
daily

daily_flights <- daily |> 
  summarize(n = n())
Alternatively, change the default behavior by setting a different value, e.g., "drop" to drop all grouping or "keep" to preserve the same groups.

flights %>%
  group_by(carrier) %>%
  summarize(mean_arrival_delay = mean(arr_delay, na.rm = TRUE))


flights |> 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE), 
    n = n(),
    .by = c(origin, dest)
  )

flights |> 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE), 
    n = n(),
    .by = carrier
  )

flights |>
  group_by(carrier) |>
  summarize(mean_dep_delay = mean(dep_delay, na.rm = TRUE))



flights |>
  group_by(carrier) |>
  summarize(mean_dep_delay = mean(dep_delay, na.rm = TRUE), n = n())

  
flights |> 
  group_by(carrier, dest) |> 
  summarize(n()))



flights |> 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE), 
    n = n(),
    .by = c(carrier, dest)
  )

flights |>
  group_by(carrier, dest) |>
  summarize(mean_dep_delay = mean(dep_delay, na.rm = TRUE), n = n())


flights |>
  group_by(dest) |>
  slice_max(dep_delay, n = -1) |>
  relocate(dest)

flights |>
  group_by(dest, carrier) |>
  count()

df <- tibble(
  x = 1:5,
  y = c("a", "b", "a", "a", "b"),
  z = c("K", "K", "L", "L", "K")
)
df
df2 <- df |>
  group_by(y)
df2

df |>
  arrange(y)


df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x))


df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x))

df |>
  group_by(y, z) |>
  mutate(mean_x = mean(x))

install.packages("styler")



Restyle the following pipelines following the guidelines above.

flights |>
  filter(dest=="IAH") |>
  group_by(year,month,day) |>
  summarize(n=n(), 
            delay=mean(arr_delay, na.rm=TRUE)) |>
  filter(n>10)

tuberculosis
flights$flight

library(dplyr)
library(nycflights13)

duplicate_hours <- weather |>
  group_by(year, month, day, hour, origin) |>
  summarize(count = n(), .groups = "drop") |>
  filter(count > 1) 
duplicate_hours

duplicated_weather <- weather |>
  inner_join(duplicate_hours, by = c("year", "month", "day", "hour", "origin"))
duplicated_weather


holiday_flights <-
  flights |>
  filter(
    (month == 12 & day == 24) | 
    (month == 12 & day == 25) | 
    (month == 1 & day == 1) 
    ) |>
  group_by(month, day)
holiday_flights  




flights |>
  filter(
    (month == 12 & day == 24) | 
      (month == 12 & day == 25) | 
      (month == 1 & day == 1) 
  ) |>
  group_by(month, day)
airlines
flights
weather
nycflights
nycflights13
library(nycflights13)
nycflight
flighst
flights
browseVignettes("nycflights13")
flights$weather
flights
weather
flights2 <- flights |> 
  select(year, time_hour, origin, dest, tailnum, carrier)
flights2 |> 
  left_join(weather 
flights2            
pl(anes


x <- c(c("TRUE", 3), "hat")
x
str(x)
seq(from = 1, to = 10, by = 1)
1:10
x <- 1:10
x
runif(5, 20, 30)


x <- rep(0.2, times = 6)
y <- c(1, 3, 4, -1, 5, 6)
my_matrix <- c(x, y)
my_matrix

iris
my_iris <-as.matrix(iris)
my_iris
attributes(my_iris)

mat <- matrix(c(1:4, 20:17), ncol = 2)
mat
mat[2]
mat[3]
is.matrix(mat)
mat[6]

iris[1,, drop = FALSE]
str(iris[1,, drop = FALSE])
is.list(iris[1, ])
is.vector(iris[1, ])


iris$Sepal.Length
str(iris$Sepal.Length)
is.vector(iris$Sepal.Length)

iris
head(iris[ ,2])
iris
iris[1]


tb <- tibble(
  x = 1:4,
  y = c(10, 4, 1, 21)
)
tb[1]
tb[[1]]
str(tb[1])
str(tb[[1]])
is.vector(tb[1])
is.data.frame(tb[1])
is.data.frame(tb[[1]])



l <- list(
  a = 1:3, 
  b = "a string", 
  c = pi, 
  d = list(-1, -5)
)
1

str(l[[1:2]])     
#> List of 2
#>  $ a: int [1:3] 1 2 3
#>  $ b: chr "a string"



str(l[[1]])
str(l[1])
airports
weather

flights3 <-
  flights |>
  select(year, time_hour, origin, dep_delay) |>
  left_join(weather |> select(origin, time_hour, temp, wind_speed, precip)) |>
  arrange(desc(dep_delay))
flights3
print(flights3, n = )


top_dest <- flights2 |>
  count(dest, sort = TRUE) |>
  head(10)
top_dest

flights$time_hour

flights3 <- flights |>
  mutate(hour = lubridate::hour(time_hour)) |>
  group_by(year, month, day, hour) |>
  summarize(total_delay = sum(dep_delay + arr_delay, na.rm = TRUE)) |>
  ungroup() |>
  arrange(desc(total_delay)) |>
  slice_head(n = 48)
flights3
  
flights4 <-
  flights3 |>
  left_join(weather, by = c("year", "month", "day", "hour"))
view(flights4)

flights


top_dest <- flights |>
  count(dest, sort = TRUE) |>
  head(10)
top_dest

top_dest_flights <- flights |>
  filter(dest %in% top_dest$dest)

top_dest_flights <- flights |>
  semi_join(top_dest, by = "dest")

top_dest_flights <- flights |>
  semi_join(top_dest, by = "dest")


top_dest_flights
top_dest_flights$dest

final_top_dest_flights <-
  flights |>
  semi_join(top_dest, by = dest)
  
weather

flights |>
  anti_join(weather, join_by(time_hour)) |>
  distinct(time_hour)


planes


flights2b <- flights2 |>
  anti_join(planes, join_by(tailnum)) 
view(flights2b)
view(distinct(flights2b))
unique(flights2b)


weather
airlines

flights3 <-
  flights |>
  left_join(airports |> select (faa, lat_origin = lat, lon_origin = lon), 
            join_by(origin == faa))
flights_latlon <-
  flights3 |>
  left_join(airports |> select(faa, lat_dest = lat, lon_dest = lon),
            join_by(dest == faa))
flights_latlon
flights_latlon$lat_dest


df1 <- tibble(key = c(1, 2, 2), val_x = c("x1", "x2", "x3"))
df2 <- tibble(key = c(1, 2, 2), val_y = c("y1", "y2", "y3"))
df1
df2
install.packages("psych")
?describe()
??describe
install.packages("lattice")
install.packages("GGally")
install.packages("gapminder")
install.packages("gganimate")
install.packages("gifski")
install.packages("esquisse")



library(tidyverse)
library(readxl)
app_data <- read_excel("app_data.xlsx", sheet = 1)
app_data <- app_data |>
  mutate(BMI = as.numeric(BMI),
         US_Number = as.character(US_Number),
         SexF = factor(Sex, levels = c("female", "male"), labels = c("Female", "Male")),
         DiagnosisF = as.factor(Diagnosis),
         SeverityF = as.factor(Severity))
app_data


table(app_data$SexF, app_data$DiagnosisF)
table(app_data$SexF, app_data$DiagnosisF, app_data$SeverityF)


three_way <- table(app_data$SexF, app_data$DiagnosisF, app_data$SeverityF)


three_way[, , 1]
three_way[, 1, 1]

library(tidyverse)
app_data |>
  drop_na(SexF, DiagnosisF) |>
  group_by(SexF, DiagnosisF) |>
  summarize(count = n())
install.packages("palmerpenguins")
penguins
library(palmerpenguins)
penguins
penguins_data <- as_tibble(penguins)
?penguins
ggplot(data = penguins, mapping = aes(x = species, y = bill_depth_mm, 
                                      color = species) 
       ) +
  geom_boxplot()
ggplot(data = penguins) + 
  geom_point()
?geom_point()


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = TRUE)


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()




ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )
mpg
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "pink", shape = 17)
ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy, color = "blue"))


library(ggplot2)

ggplot(mpg, aes(x = displ, y = hwy, color = displ < 5)) + 
  geom_point()
diamonds
??diamonds
view(diamonds)
ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 1000)
flights |> 
  group_by(year, month, day) |> 
  summarize(
    proportion_delayed = mean(dep_delay <= 60, na.rm = TRUE),
    count_long_delay = sum(arr_delay >= 300, na.rm = TRUE),
    .groups = "drop"
  )
diamonds_count <- diamonds |>
  group_by(carat) |>
  summarize(
    n = n())
diamonds_count |>
  filter(carat == 1.0 | carat == 0.99)


iris
class(iris)


k01 <- function(abcdef, bcde1, bcde2) {
  list(a = abcdef, b1 = bcde1, b2 = bcde2)
}
k01
str(k01(1, 3, b2 = 1))
str(k01)
str(list(a = abcdef, b1 = bcde1, b2 = bcde2))
list(a = abcdef, b1 = bcde1, b2 = bcde2)



# Can abbreviate long argument names:
str(k01(2, 3, a = 1))
weather <- "rainy"
action <- switch(weather,
                 "sunny" = "Go for a walk",
                 "cloudy" = "Stay indoors",
                 "rainy" = "Take an umbrella",
                 default = "Check the weather forecast"
)
cat(action)
foo <- function() {
  y <- 5  # y is a local variable
  print(y)
}

foo()  # Output: 5
y


l <- function(x) x + 1

m <- function() {
  l <- function(x) x * 2
  l(10) 
}

  
  
  
  
  
  
m()

