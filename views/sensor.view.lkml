view: sensor {
  sql_table_name: edgefarm.sensor ;;
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
  dimension_group: last_access {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_access_at ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
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
  dimension: serial_number {
    type: string
    sql: ${TABLE}.serial_number ;;
  }
  dimension: ttn_application_id {
    type: string
    sql: ${TABLE}.ttn_application_id ;;
  }
  dimension: ttn_device_id {
    type: string
    sql: ${TABLE}.ttn_device_id ;;
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
	room.id,
	room.name,
	sensor_history.count
	]
  }

}
