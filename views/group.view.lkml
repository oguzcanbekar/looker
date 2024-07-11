view: group {
  sql_table_name: edgefarm.`group` ;;
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
  dimension_group: arrival {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.arrival_date ;;
  }
  dimension: avg_weight {
    type: number
    sql: ${TABLE}.avg_weight ;;
  }
  dimension_group: birth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.birth_date ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: deactivated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deactivated_at ;;
  }
  dimension: farm_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.farm_id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
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
	name,
	nickname,
	farm.id,
	farm.name,
	farm.contact_name,
	piggery.id,
	piggery.name,
	room.id,
	room.name,
	group_day_report.count,
	group_history.count,
	grow_camera_history.count,
	movement.count,
	room_history.count
	]
  }

}
