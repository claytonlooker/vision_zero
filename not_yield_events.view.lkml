view: not_yield_events {
  sql_table_name: visionzero.not_yield_events ;;

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

  dimension: device_id1 {
    type: string
    sql: ${TABLE}.device_id1 ;;
  }

  dimension: intersection {
    type: string
    sql: ${TABLE}.intersection ;;
  }

  dimension: located_at {
    type: string
    sql: ${TABLE}.located_at ;;
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

  dimension: yield_by {
    type: string
    sql: ${TABLE}.yield_by ;;
  }

  dimension: yield_to {
    type: string
    sql: ${TABLE}.yield_to ;;
  }

  dimension: yielding {
    type: string
    sql: ${TABLE}.yielding ;;
  }

  measure: count {
    type: count
    drill_fields: [crosswalk_name]
  }
}
