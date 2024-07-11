view: farm {
  sql_table_name: edgefarm.farm ;;
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
  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: address_detail {
    type: string
    sql: ${TABLE}.address_detail ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }
  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
  }
  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }
  dimension: contact_phone {
    type: string
    sql: ${TABLE}.contact_phone ;;
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
  dimension: image {
    type: string
    sql: ${TABLE}.image ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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
	contact_name,
	alarm.count,
	alarm_history.count,
	count_.count,
	count_camera.count,
	feeder.count,
	group.count,
	grow.count,
	grow_camera.count,
	member_farm.count,
	movement.count,
	partner.count,
	piggery.count,
	room.count,
	schedule.count,
	sensor.count,
	target_feeding.count,
	target_weight.count,
	worker.count
	]
  }

}
