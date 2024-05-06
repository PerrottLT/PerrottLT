# Install packages
#install.packages("gapminder")
#install.packages("dplyr")
#install.packages("ggplot2")


# Load packages
library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize

gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

# Summarize to find the median life expectancy
gapminder %>% 
  summarize(medianLifeExp = median(lifeExp))

# group_by can be used to look at timeseries, rather than idividual years each time
gapminder %>%
  group_by(year, continent) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))


# Create dataframe
by_year_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

# expand_limits allows axes min to the set 
ggplot(by_year_continent, aes(x = year, y = totalPop, colour = continent)) +
  geom_point() + 
  expand_limits(y = 0)

# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Plot the change in medianGdpPercap in each continent over time

ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, colour = continent)) +
  geom_point()  + 
  expand_limits(y= 0)

# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(medianLifeExp = median(lifeExp),
            medianGdpPercap = median(gdpPercap))


# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x = medianGdpPercap, y = medianLifeExp, colour = continent)) + 
  geom_point() + 
  expand_limits(y = 0)