view: vehicle_events {
  sql_table_name: visionzero.vehicle_events ;;

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

  dimension: direction {
    type: string
    sql: ${TABLE}.direction ;;
  }

  dimension: heading_from {
    type: string
    sql: ${TABLE}.heading_from ;;
  }

  dimension: heading_to {
    type: string
    sql: ${TABLE}.heading_to ;;
  }

  dimension: intersection {
    type: string
    sql: ${TABLE}.intersection ;;
  }

  dimension: is_vehicle_on_bikelane {
    type: string
    sql: ${TABLE}.is_vehicle_on_bikelane ;;
  }

  dimension: is_vehicle_stopped_in_intersection {
    type: string
    sql: ${TABLE}.is_vehicle_stopped_in_intersection ;;
  }

  dimension: is_vehicle_stopped_on_cw {
    type: string
    sql: ${TABLE}.is_vehicle_stopped_on_cw ;;
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
