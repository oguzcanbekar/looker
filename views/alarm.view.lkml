view: alarm {
  sql_table_name: edgefarm.alarm ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: active_status {
    type: yesno
    sql: ${TABLE}.active_status ;;
  }
  dimension: all_day {
    type: yesno
    sql: ${TABLE}.all_day ;;
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
  dimension: farm_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.farm_id ;;
  }
  dimension: level {
    type: yesno
    sql: ${TABLE}.level ;;
  }
  dimension: member_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.member_id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: piggery_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.piggery_id ;;
  }
  dimension: room_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.room_id ;;
  }
  dimension_group: send_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.send_end_time ;;
  }
  dimension: send_interval {
    type: yesno
    sql: ${TABLE}.send_interval ;;
  }
  dimension_group: send_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.send_start_time ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	member.id,
	member.username,
	member.name,
	farm.id,
	farm.name,
	farm.contact_name,
	piggery.id,
	piggery.name,
	room.id,
	room.name,
	alarm_history.count
	]
  }

}
