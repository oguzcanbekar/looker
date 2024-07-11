view: room {
  sql_table_name: edgefarm.room ;;
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
  dimension: area {
    type: number
    sql: ${TABLE}.area ;;
  }
  dimension: breeding_area {
    type: number
    sql: ${TABLE}.breeding_area ;;
  }
  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }
  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
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
  dimension: env_settings {
    type: string
    sql: ${TABLE}.env_settings ;;
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
  dimension: overlay {
    type: string
    sql: ${TABLE}.overlay ;;
  }
  dimension: piggery_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.piggery_id ;;
  }
  dimension: target_age {
    type: number
    sql: ${TABLE}.target_age ;;
  }
  dimension: target_weight {
    type: number
    sql: ${TABLE}.target_weight ;;
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
	farm.id,
	farm.name,
	farm.contact_name,
	piggery.id,
	piggery.name,
	alarm.count,
	alarm_history.count,
	feeder.count,
	group.count,
	group_day_report.count,
	grow_camera.count,
	grow_camera_history.count,
	room_history.count,
	schedule.count,
	sensor.count
	]
  }

}
