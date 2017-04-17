view: vehicle_speed_toward_intersection {
  sql_table_name: visionzero.vehicle_speed_toward_intersection ;;

  dimension: batch_id {
    type: number
    sql: ${TABLE}.batch_id ;;
  }

  dimension: batch_status {
    type: string
    sql: ${TABLE}.batch_status ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: intersection {
    type: string
    sql: ${TABLE}.intersection ;;
  }

  dimension: source_system {
    type: string
    sql: ${TABLE}.source_system ;;
  }

  dimension: speed {
    type: number
    sql: ${TABLE}.speed ;;
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

  dimension: vehicle_type {
    type: string
    sql: ${TABLE}.vehicle_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
