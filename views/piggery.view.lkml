view: piggery {
  sql_table_name: edgefarm.piggery ;;
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
  dimension: floor {
    type: number
    sql: ${TABLE}.floor ;;
  }
  dimension: image {
    type: string
    sql: ${TABLE}.image ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: overlay {
    type: string
    sql: ${TABLE}.overlay ;;
  }
  dimension: working {
    type: yesno
    sql: ${TABLE}.working ;;
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
	alarm.count,
	alarm_history.count,
	count_.count,
	count_camera.count,
	feeder.count,
	group.count,
	grow.count,
	grow_camera.count,
	room.count,
	schedule.count,
	sensor.count
	]
  }

}
