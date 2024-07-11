view: alarm_history {
  sql_table_name: edgefarm.alarm_history ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: alarm_history_category_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.alarm_history_category_id ;;
  }
  dimension: alarm_history_sub_category_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.alarm_history_sub_category_id ;;
  }
  dimension: alarm_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.alarm_id ;;
  }
  dimension: arrival_piggery_id {
    type: number
    sql: ${TABLE}.arrival_piggery_id ;;
  }
  dimension: arrival_room_id {
    type: number
    sql: ${TABLE}.arrival_room_id ;;
  }
  dimension: checked {
    type: yesno
    sql: ${TABLE}.checked ;;
  }
  dimension_group: checked {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.checked_at ;;
  }
  dimension: content {
    type: string
    sql: ${TABLE}.content ;;
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
  dimension: piggery_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.piggery_id ;;
  }
  dimension: related_id {
    type: number
    sql: ${TABLE}.related_id ;;
  }
  dimension: related_table_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.related_table_id ;;
  }
  dimension: room_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.room_id ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	member.id,
	member.username,
	member.name,
	farm.id,
	farm.name,
	farm.contact_name,
	alarm.id,
	alarm.name,
	related_table.id,
	related_table.name,
	piggery.id,
	piggery.name,
	room.id,
	room.name,
	alarm_history_category.id,
	alarm_history_category.name,
	alarm_history_sub_category.id,
	alarm_history_sub_category.name
	]
  }

}
