if(!require('bikeshare14')) {
  install.packages('bikeshare14')
  library('bikeshare14')
}

# Load data.table
library(data.table)

# Chapter 1

# Create the data.table X 
X <- data.table(id = c("a", "b", "c"), value = c(0.5, 1.0, 1.5))

# View X
X

# Get number of columns in batrips
col_number <- ncol(batrips)

col_number

# Print the first 8 rows
head(batrips, n = 8)

# Print the last 8 rows
tail(batrips, n = 8)

# Print the structure of batrips
str(batrips)

# Filter third row
row_3 <- batrips[3,]
row_3

# Filter rows 10 through 20
rows_10_20 <- batrips[10:20,]
rows_10_20

# Filter the 1st, 6th and 10th rows
rows_1_6_10 <- batrips[c(1,6,10)]
rows_1_6_10

# Select all rows except the first two
not_first_two <- batrips[!(1:2)]
not_first_two

# Select all rows except 1 through 5 and 10 through 15
exclude_some <- batrips[!c(1:5,10:15)]
exclude_some

# Select all rows except the first and last
not_first_last <- batrips[!c(1,.N)]
not_first_last

batrips <- data.table(batrips)

# Filter all rows where start_station is "MLK Library"
trips_mlk <- batrips[start_station == "MLK Library"]
trips_mlk

# Filter all rows where start_station is "MLK Library" AND duration > 1600
trips_mlk_1600 <- batrips[start_station == "MLK Library" & duration > 1600]

trips_mlk_1600

# Filter all rows where `subscription_type` is not `"Subscriber"`
customers <- batrips[subscription_type != 'Subscriber']
customers

# Filter all rows where start_station is "Ryland Park" AND subscription_type is not "Customer"
ryland_park_subscribers <- batrips[start_station == "Ryland Park" & subscription_type != "Customer"]
ryland_park_subscribers

# Filter all rows where end_station contains "Market"
any_markets <- batrips[end_station %like% "Market"]
any_markets

# Filter all rows where  ends with "Market" 
end_markets <- batrips[end_station %like% "Market$"]
end_markets

# Filter all rows where trip_id is 588841, 139560, or 139562
filter_trip_ids <- batrips[trip_id %in% c(588841,139560,139562)]
filter_trip_ids

# Filter all rows where duration is between [5000, 6000]
duration_5k_6k <- batrips[duration %between% c(5000,6000)]
duration_5k_6k

# Filter all rows with specific start stations
two_stations <- batrips[start_station %chin% c("San Francisco City Hall", "Embarcadero at Sansome")]
two_stations

# Chapter 2

# Select bike_id and trip_id using a character vector
df_way <- batrips[, c("bike_id", "trip_id")]
df_way

# Select start_station and end_station cols without a character vector
dt_way <- batrips[,.(start_station,end_station)]
dt_way

# Deselect start_terminal and end_terminal columns
drop_terminal_cols <- batrips[, !c("start_terminal", "end_terminal")]
drop_terminal_cols

# Calculate median duration using the j argument
median_duration <- batrips[, median(duration)]
median_duration

# Get median duration after filtering
median_duration_filter <- batrips[end_station == "Market at 10th" & subscription_type == "Subscriber", median(duration)]
median_duration_filter

# Compute duration of all trips
trip_duration <- batrips[, difftime(end_date, start_date, units = "min")]
head(trip_duration)

# Calculate the average duration as mean_durn
mean_duration <- batrips[, .(mean_durn = mean(duration))]
mean_duration

# Get the min and max duration values
min_max_duration <- batrips[, .(min_durn = min(duration), max_durn = max(duration))]
min_max_duration

# Calculate the average duration and the date of the last ride
other_stats <- batrips[, .(mean_duration = mean(duration), last_ride = max(end_date))]
other_stats

duration_stats <- batrips[start_station == "Townsend at 7th" & duration < 500, 
                          .(min_dur = min(duration), 
                            max_dur = max(duration))]
duration_stats

# Plot the histogram of duration based on conditions
batrips[start_station == "Townsend at 7th" & duration < 500, hist(duration)]

# Compute the mean duration for every start_station
mean_start_stn <- batrips[, .(mean_duration = mean(duration)), by = start_station]
mean_start_stn

# Compute the mean duration for every start and end station
mean_station <- batrips[,.( mean_duration = mean(duration)), by = .(start_station, end_station)]
mean_station

# Compute the mean duration grouped by start_station and month
mean_start_station <- batrips[, .(mean_duration = mean(duration)), by = .(start_station, month(start_date))]
mean_start_station


# Compute mean of duration and total trips grouped by start and end stations
aggregate_mean_trips <- batrips[, .(mean_duration = mean(duration), total_trips = .N), by = .(start_station, end_station)]
aggregate_mean_trips

# Compute min and max duration grouped by start station, end station, and month
aggregate_min_max <- batrips[, .(min_duration = min(duration), max_duration = max(duration)), by = .(start_station, end_station, month(start_date))]
aggregate_min_max

# Arrange the total trips grouped by start_station and end_station in decreasing order
trips_dec <- batrips[, .N, by = .(start_station, 
                                  end_station)][order(-N)]
trips_dec

# Top five most popular destinations
top_5 <- batrips[, .N, by = .(end_station)][order(-N)][1:5]
top_5

# Compute most popular end station for every start station
popular_end_station <- trips_dec[, .(end_station = end_station[1]), 
                                 by = start_station]
popular_end_station

# Find the first and last ride for each start_station
first_last <- batrips[order(start_date), 
                      .(start_date = start_date[c(1,.N)]),
                      by = start_station]
first_last


relevant_cols <- c("start_station", "end_station", 
                   "start_date", "end_date", "duration")

# Find the row corresponding to the shortest trip per month
shortest <- batrips[, .SD[which.min(duration)], 
                    by = month(start_date), 
                    .SDcols = relevant_cols]
shortest

# Find the total number of unique start stations and zip codes per month
unique_station_month <- batrips[, lapply(.SD, uniqueN), 
                                by = month(start_date), 
                                .SDcols = c("start_station", "zip_code")]
unique_station_month


# Add a new column, duration_hour
batrips[, duration_hour := duration / 3600] 

# Fix spelling in the second row of start_station using the LHS := RHS form
untidy[2, start_station :=  "San Francisco City Hall"]

# Replace negative duration values with NA
untidy[duration < 0, duration := 'NA']

# Add a new column equal to total trips for every start station
batrips[, trips_N := .N, by = start_station]

# Add new column for every start_station and end_station
batrips[, duration_mean := mean(duration), by = .(start_station, end_station)]

# Calculate the mean duration for each month
batrips_new[, mean_dur := mean(duration, na.rm = TRUE), 
            by = month(start_date)]

# Replace NA values in duration with the mean value of duration for that month
batrips_new[, mean_dur := mean(duration, na.rm = TRUE), 
            by = month(start_date)][is.na(duration), duration := mean_dur]

# Delete the mean_dur column by reference
batrips_new[, mean_dur := mean(duration, na.rm = TRUE), 
            by = month(start_date)][is.na(duration), 
                                    duration := mean_dur][, mean_dur := NULL]

# Add columns using the LHS := RHS form
batrips[, c("mean_duration", "median_duration"):= .(mean(duration), median(duration)), 
        by = start_station]


# Add columns using the functional form
batrips[, `:=`(mean_duration = mean(duration), median_duration = median(duration)), 
        by = start_station]

# Add the mean_duration column
batrips[duration > 600,`:=`(mean_duration = mean(duration)), by = .(start_station, end_station)]

