view: movement {
  sql_table_name: edgefarm.movement ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: arrival_piggery_id {
    type: number
    sql: ${TABLE}.arrival_piggery_id ;;
  }
  dimension: arrival_room_id {
    type: number
    sql: ${TABLE}.arrival_room_id ;;
  }
  dimension: auto {
    type: yesno
    sql: ${TABLE}.auto ;;
  }
  dimension: avg_weight {
    type: number
    sql: ${TABLE}.avg_weight ;;
  }
  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }
  dimension: confirm {
    type: yesno
    sql: ${TABLE}.confirm ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: delivery_from_id {
    type: number
    sql: ${TABLE}.delivery_from_id ;;
  }
  dimension: delivery_to_id {
    type: number
    sql: ${TABLE}.delivery_to_id ;;
  }
  dimension: departure_piggery_id {
    type: number
    sql: ${TABLE}.departure_piggery_id ;;
  }
  dimension: departure_room_id {
    type: number
    sql: ${TABLE}.departure_room_id ;;
  }
  dimension_group: ended {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ended_at ;;
  }
  dimension: farm_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.farm_id ;;
  }
  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }
  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
  }
  dimension: related_group_id {
    type: number
    sql: ${TABLE}.related_group_id ;;
  }
  dimension: reported {
    type: yesno
    sql: ${TABLE}.reported ;;
  }
  dimension_group: reported {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.reported_at ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	farm.id,
	farm.name,
	farm.contact_name,
	group.id,
	group.name,
	group.nickname,
	count_camera_history.count,
	group_history.count,
	report.count,
	room_history.count
	]
  }

}
