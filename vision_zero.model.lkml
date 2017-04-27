connection: "visionzero"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

week_start_day: sunday

explore: all_events {}

explore: bike_events {}

explore: not_yield_events {}

explore: pedestrian_events {}

explore: vehicle_events {}

explore: vehicle_speed_toward_intersection {}

map_layer: my_neighborhood_layer {
  file: "neighborhoods.topojson"
  property_key: "community"
}

# explore: all_events2 {
#   join: bike_events {
#     sql_on: ${all_events.time_hour} = ${bike_events.time_hour} date;;
#   }
#   join: not_yield_events {
#     sql_on: ${all_events.time_hour} = ${not_yield_events.time_hour} ;;
#   }
#   join: pedestrian_events {
#     sql_on: ${all_events.time_hour} = ${pedestrian_events.time_hour} ;;
#   }
#   join: vehicle_events {
#     sql_on: ${all_events.time_hour} = ${vehicle_events.time_hour} ;;
#   }
#   join: vehicle_speed_toward_intersection {
#     sql_on: ${all_events.time_hour} = ${vehicle_speed_toward_intersection.time_hour} ;;
#   }
#
# }
#
