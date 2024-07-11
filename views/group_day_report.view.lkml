view: group_day_report {
  sql_table_name: edgefarm.group_day_report ;;
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
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: feeding_amount {
    type: number
    sql: ${TABLE}.feeding_amount ;;
  }
  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
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
	group.id,
	group.name,
	group.nickname,
	room.id,
	room.name
	]
  }

}
