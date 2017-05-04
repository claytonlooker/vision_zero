view: all_events {
  derived_table: {
    sql: SELECT
        'Bike' as "event_type",
        bike_events.batch_id  AS `batch_id`,
        bike_events.batch_status  AS `batch_status`,
        bike_events.device_id AS `device_id`,
        bike_events.direction AS `direction`,
        bike_events.heading_from AS `heading_from`,
        bike_events.heading_to AS `heading_to`,
        bike_events.intersection AS `intersection`,
        bike_events.legal AS `legal`,
        bike_events.source_system AS `source_system`,
        bike_events.time AS `time`,
        bike_events.tl_phase AS `tl_phase`,
        bike_events.traffic_light_id AS `traffic_light_id`,
        bike_events.is_bike_on_bikelane AS `is_bike_on_bikelane`,
        null as `crosswalk_name`,
        null as `is_vehicle_on_bikelane`,
        null as `is_vehicle_stopped_in_intersection`,
        null as `is_vehicle_stopped_on_cw`,
        null  AS `not_yield_events.device_id1`,
        null  AS `not_yield_events.located_at`,
        null  AS `not_yield_events.yield_by`,
        null  AS `not_yield_events.yield_to`,
        null  AS `not_yield_events.yielding`,
        null as `in_crosswalk`,
        null AS `speed`,
        null AS `vehicle_type`

      FROM bike_events

      UNION ALL
      SELECT
        'Vehicle' AS "event_type",
        vehicle_events.batch_id  AS `batch_id`,
        vehicle_events.batch_status  AS `batch_status`,
        vehicle_events.device_id  AS `device_id`,
        vehicle_events.direction  AS `direction`,
        vehicle_events.heading_from  AS `heading_from`,
        vehicle_events.heading_to  AS `heading_to`,
        vehicle_events.intersection  AS `intersection`,
        vehicle_events.legal  AS `legal`,
        vehicle_events.source_system  AS `source_system`,
        vehicle_events.time  AS `time`,
        vehicle_events.tl_phase  AS `tl_phase`,
        vehicle_events.traffic_light_id  AS `traffic_light_id`,
        null as `is_bike_on_bikelane`,
        crosswalk_name  AS `crosswalk_name`,
        vehicle_events.is_vehicle_on_bikelane  AS `is_vehicle_on_bikelane`,
        vehicle_events.is_vehicle_stopped_in_intersection  AS `is_vehicle_stopped_in_intersection`,
        vehicle_events.is_vehicle_stopped_on_cw  AS `is_vehicle_stopped_on_cw`,
        null  AS `not_yield_events.device_id1`,
        null  AS `not_yield_events.located_at`,
        null  AS `not_yield_events.yield_by`,
        null  AS `not_yield_events.yield_to`,
        null  AS `not_yield_events.yielding`,
        null as `in_crosswalk`,
        null AS `speed`,
        null AS `vehicle_type`

      FROM vehicle_events

      UNION ALL
      SELECT
        'Not Yield' as "event_type",
        not_yield_events.batch_id  AS `batch_id`,
        not_yield_events.batch_status  AS `batch_status`,
        not_yield_events.device_id  AS `device_id`,
        null as `direction`,
        null  AS `heading_from`,
        null  AS `heading_to`,
        not_yield_events.intersection  AS `intersection`,
        null as `legal`,
        not_yield_events.source_system  AS `source_system`,
        not_yield_events.time AS `time`,
        not_yield_events.tl_phase  AS `tl_phase`,
        not_yield_events.traffic_light_id  AS `traffic_light_id`,
        null as `is_bike_on_bikelane`,
        not_yield_events.crosswalk_name  AS `crosswalk_name`,
        null  AS `is_vehicle_on_bikelane`,
        null  AS `is_vehicle_stopped_in_intersection`,
        null  AS `is_vehicle_stopped_on_cw`,
        not_yield_events.device_id1  AS `device_id1`,
        not_yield_events.located_at  AS `located_at`,
        not_yield_events.yield_by  AS `yield_by`,
        not_yield_events.yield_to  AS `yield_to`,
        not_yield_events.yielding  AS `yielding`,
        null as `in_crosswalk`,
        null AS `speed`,
        null AS `vehicle_type`

      FROM not_yield_events

      UNION ALL
      SELECT
        'Pedestrian' as "event_type",
        pedestrian_events.batch_id  AS `batch_id`,
        pedestrian_events.batch_status  AS `batch_status`,
        pedestrian_events.device_id  AS `device_id`,
        null as `direction`,
        null  AS `heading_from`,
        null  AS `heading_to`,
        pedestrian_events.intersection  AS `intersection`,
        null as `legal`,
        pedestrian_events.source_system  AS `source_system`,
        pedestrian_events.time AS `time`,
        pedestrian_events.tl_phase  AS `tl_phase`,
        pedestrian_events.traffic_light_id  AS `traffic_light_id`,
        null as `is_bike_on_bikelane`,
        pedestrian_events.crosswalk_name  AS `crosswalk_name`,
        null  AS `is_vehicle_on_bikelane`,
        null  AS `is_vehicle_stopped_in_intersection`,
        null  AS `is_vehicle_stopped_on_cw`,
        null  AS `device_id1`,
        null  AS `located_at`,
        null  AS `yield_by`,
        null  AS `yield_to`,
        null  AS `yielding`,
        null AS `in_crosswalk`,
        null AS `speed`,
        null AS `vehicle_type`

      FROM pedestrian_events

      UNION ALL
      SELECT
        'Vehicle Speed Toward Intersection' as "event_type",
        vehicle_speed_toward_intersection.batch_id  AS `batch_id`,
        vehicle_speed_toward_intersection.batch_status  AS `batch_status`,
        vehicle_speed_toward_intersection.device_id  AS `device_id`,
        null as `direction`,
        null  AS `heading_from`,
        null  AS `heading_to`,
        vehicle_speed_toward_intersection.intersection  AS `intersection`,
        null as `legal`,
        vehicle_speed_toward_intersection.source_system  AS `source_system`,
        vehicle_speed_toward_intersection.time AS `time`,
        null  AS `tl_phase`,
        null  AS `traffic_light_id`,
        null as `is_bike_on_bikelane`,
        null  AS `crosswalk_name`,
        null  AS `is_vehicle_on_bikelane`,
        null  AS `is_vehicle_stopped_in_intersection`,
        null  AS `is_vehicle_stopped_on_cw`,
        null  AS `device_id1`,
        null  AS `located_at`,
        null  AS `yield_by`,
        null  AS `yield_to`,
        null  AS `yielding`,
        null AS `in_crosswalk`,
        vehicle_speed_toward_intersection.speed as `speed`,
        vehicle_speed_toward_intersection.vehicle_type AS `vehicle_type`

      FROM vehicle_speed_toward_intersection

       ;;
    indexes: ["event_type","time","device_id"]
    persist_for: "10000 hours"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    }

  measure: bike_events {
    type: count
    filters: {
      field: event_type
      value: "Bike"
    }
    drill_fields: [detail*]
    }

  measure: vehicle_events {
    type: count
    filters: {
      field: event_type
      value: "Vehicle"
    }
    drill_fields: [detail*]
    }

  measure: not_yield_events {
    type: count
    filters: {
      field: event_type
      value: "Not Yield"
    }
    drill_fields: [detail*]
    }

  measure: pedestrian_events {
    type: count
    filters: {
      field: event_type
      value: "Pedestrian"
    }
    drill_fields: [detail*]
    }

  measure: vehicle_speed_toward_intersection {
    type: count
    filters: {
      field: event_type
      value: "Vehicle_speed_toward_intersection"
    }
    drill_fields: [detail*]
    }

  measure: average_speed {
    type: average
    sql: ${speed} ;;
    # filters: {
    #   field: event_type
    #   value: "Vehicle_speed_toward_intersection"
    # }
    drill_fields: [detail*]
    }

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
#    html: <img src="http://cdn.free-power-point-templates.com/articles/wp-content/uploads/2012/01/pie-chart.jpg" width=50 /> ;;
    html: {{rendered_value}}<img src="https://localhost:9999/looks/2yq3Btfv65mK7cf4nsZk749pkzVkzxFf.png" width=50 /> ;;
    }

  dimension: direction {
    type: string
    sql: ${TABLE}.direction ;;
  }

  dimension: heading_from {
    type: string

    sql: CASE WHEN heading_from = 'BE'
                THEN 'Beacon East'
              WHEN heading_from = 'BW'
                THEN 'Beacon West'
              WHEN heading_from = 'MN'
                THEN 'Mass North'
              WHEN heading_from = 'MS'
                THEN 'Mass South'
              END;;
  }

  dimension: heading_to {
    type: string
    sql: CASE WHEN heading_to = 'BE'
                THEN 'Beacon East'
              WHEN heading_to = 'BW'
                THEN 'Beacon West'
              WHEN heading_to = 'MN'
                THEN 'Mass North'
              WHEN heading_to = 'MS'
                THEN 'Mass South'
         END;;
    }

  dimension: intersection {
    type: string
    description: "Cross street"
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

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      minute10,
      minute15,
      minute30,
      time_of_day,
      hour,
      hour_of_day,
      date,
      week,
      day_of_week,
      day_of_week_index,
      month,
      month_num,
      quarter,
      year
    ]
    drill_fields: [event_week, event_date, event_hour]
    sql: ${TABLE}.time ;;
  }

  dimension: tl_phase {
    label: "Traffic Light Phase"
    type: string
    sql: ${TABLE}.tl_phase ;;
  }

  dimension: traffic_light_id {
    type: string
    sql: ${TABLE}.traffic_light_id ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: is_bike_on_bikelane {
    view_label: "Bike Events"
    type: string
    sql: ${TABLE}.`is_bike_on_bikelane` ;;
  }

  dimension: crosswalk_name {
    type: string
    sql: ${TABLE}.`crosswalk_name` ;;
  }

  dimension: is_vehicle_on_bikelane {
    view_label: "Vehicle Events"
    type: string
    sql: ${TABLE}.`is_vehicle_on_bikelane`;;
  }

  dimension: is_vehicle_stopped_in_intersection {
    view_label: "Vehicle Events"
    type: string
    sql: ${TABLE}.`is_vehicle_stopped_in_intersection` ;;
  }

  dimension: is_vehicle_stopped_on_cw {
    view_label: "Vehicle Events"
    type: string
    sql: ${TABLE}.`is_vehicle_stopped_on_cw` ;;
  }

  dimension: device_id1 {
    view_label: "Not Yield Events"
    type: string
    sql: ${TABLE}.`device_id1` ;;
  }

  dimension: located_at {
    view_label: "Not Yield Events"
    type: string
    sql: ${TABLE}.`located_at` ;;
  }

  dimension: yield_by {
    view_label: "Not Yield Events"
    type: string
    sql: ${TABLE}.`yield_by` ;;
  }

  dimension: yield_to {
    view_label: "Not Yield Events"
    type: string
    sql: ${TABLE}.`yield_to` ;;
  }

  dimension: yielding {
    view_label: "Not Yield Events"
    type: string
    sql: ${TABLE}.`yielding` ;;
  }

  dimension: speed {
    view_label: "Vehicle Speed Toward Intersection"
    type: number
    sql: ${TABLE}.`speed` ;;
  }

  dimension:  vehicle_type {
    view_label: "Vehicle Speed Toward Intersection"
    type: string
    sql: ${TABLE}.`vehicle_type` ;;
  }

  set: detail {
    fields: [
      batch_id,
      batch_status,
      device_id,
      direction,
      heading_from,
      heading_to,
      intersection,
      is_bike_on_bikelane,
      legal,
      source_system,
      tl_phase,
      traffic_light_id,
      event_type,

    ]
  }
}
