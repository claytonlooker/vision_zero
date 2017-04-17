view: pedestrian_events {
  sql_table_name: visionzero.pedestrian_events ;;

  dimension: batch_id {
    type: number
    sql: ${TABLE}.batch_id ;;
  }

  dimension: batch_status {
    type: string
    sql: ${TABLE}.batch_status ;;
  }

  dimension: crosswalk_name {
    type: string
    sql: ${TABLE}.crosswalk_name ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: in_crosswalk {
    type: string
    sql: ${TABLE}.in_crosswalk ;;
  }

  dimension: intersection {
    type: string
    sql: ${TABLE}.intersection ;;
  }

  dimension: legal {
    type: string
    sql: ${TABLE}.legal ;;
  }

  dimension: source_system {
    type: string
    sql: ${TABLE}.source_system ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      hour_of_day,
      time_of_day,
      date,
      week,
      month,
      quarter,
      year
    ]

  }

  dimension: tl_phase {
    type: string
    sql: ${TABLE}.tl_phase ;;
  }

  dimension: traffic_light_id {
    type: string
    sql: ${TABLE}.traffic_light_id ;;
  }

  measure: count {
    type: count
    drill_fields: [crosswalk_name]
  }
}
