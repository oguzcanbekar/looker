view: room_history {
  sql_table_name: edgefarm.room_history ;;
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
  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }
  dimension: movement_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.movement_id ;;
  }
  dimension: related_room_id {
    type: number
    sql: ${TABLE}.related_room_id ;;
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
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	room.id,
	room.name,
	movement.id,
	group.id,
	group.name,
	group.nickname
	]
  }

}
