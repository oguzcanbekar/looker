view: grow_camera_history {
  sql_table_name: edgefarm.grow_camera_history ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: activity {
    type: number
    sql: ${TABLE}.activity ;;
  }
  dimension: activity_list {
    type: string
    sql: ${TABLE}.activity_list ;;
  }
  dimension: avg_weight {
    type: number
    sql: ${TABLE}.avg_weight ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: feeding_amount {
    type: number
    sql: ${TABLE}.feeding_amount ;;
  }
  dimension: feeding_list {
    type: string
    sql: ${TABLE}.feeding_list ;;
  }
  dimension: feeding_stock {
    type: number
    sql: ${TABLE}.feeding_stock ;;
  }
  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }
  dimension: grow_camera_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.grow_camera_id ;;
  }
  dimension: pollution {
    type: yesno
    sql: ${TABLE}.pollution ;;
  }
  dimension: room_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.room_id ;;
  }
  dimension: stock {
    type: number
    sql: ${TABLE}.stock ;;
  }
  dimension: thumbnail {
    type: string
    sql: ${TABLE}.thumbnail ;;
  }
  dimension: unit_details {
    type: string
    sql: ${TABLE}.unit_details ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  grow_camera.id,
  grow_camera.name,
  room.id,
  room.name,
  group.id,
  group.name,
  group.nickname
  ]
  }

}
