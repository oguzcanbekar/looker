view: count_camera_history {
  sql_table_name: edgefarm.count_camera_history ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: avg_weight {
    type: number
    sql: ${TABLE}.avg_weight ;;
  }
  dimension: count_camera_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.count_camera_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: end_room_id {
    type: number
    sql: ${TABLE}.end_room_id ;;
  }
  dimension_group: ended {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ended_at ;;
  }
  dimension: movement_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.movement_id ;;
  }
  dimension: start_room_id {
    type: number
    sql: ${TABLE}.start_room_id ;;
  }
  dimension_group: started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.started_at ;;
  }
  dimension: stock {
    type: number
    sql: ${TABLE}.stock ;;
  }
  dimension: thumbnail {
    type: string
    sql: ${TABLE}.thumbnail ;;
  }
  dimension: video {
    type: string
    sql: ${TABLE}.video ;;
  }
  dimension: weight_list {
    type: string
    sql: ${TABLE}.weight_list ;;
  }
  measure: count {
    type: count
    drill_fields: [id, count_camera.id, count_camera.name, movement.id]
  }
}
