view: grow {
  sql_table_name: edgefarm.grow ;;
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
  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }
  dimension_group: last_access {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_access_at ;;
  }
  dimension: mac_address {
    type: string
    sql: ${TABLE}.mac_address ;;
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
  dimension: process_id {
    type: number
    sql: ${TABLE}.process_id ;;
  }
  dimension: public_ip_address {
    type: string
    sql: ${TABLE}.public_ip_address ;;
  }
  dimension_group: reboot {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.reboot_time ;;
  }
  dimension: serial_number {
    type: string
    sql: ${TABLE}.serial_number ;;
  }
  dimension_group: update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.update_time ;;
  }
  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
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
	grow_camera.count
	]
  }

}
