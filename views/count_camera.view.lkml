view: count_camera {
  sql_table_name: edgefarm.count_camera ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: area_settings {
    type: string
    sql: ${TABLE}.area_settings ;;
  }
  dimension: auto_calibration {
    type: yesno
    sql: ${TABLE}.auto_calibration ;;
  }
  dimension: child_device_ip_address {
    type: string
    sql: ${TABLE}.child_device_ip_address ;;
  }
  dimension: child_device_mac_address {
    type: string
    sql: ${TABLE}.child_device_mac_address ;;
  }
  dimension: count_id {
    type: number
    sql: ${TABLE}.count_id ;;
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
  dimension: forwarded_rtsp {
    type: string
    sql: ${TABLE}.forwarded_rtsp ;;
  }
  dimension: height {
    type: number
    sql: ${TABLE}.height ;;
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
  dimension: rtsp {
    type: string
    sql: ${TABLE}.rtsp ;;
  }
  dimension: sensor_height {
    type: number
    sql: ${TABLE}.sensor_height ;;
  }
  dimension: thumbnail {
    type: string
    sql: ${TABLE}.thumbnail ;;
  }
  dimension: vpi_settings {
    type: string
    sql: ${TABLE}.vpi_settings ;;
  }
  dimension: wiper_time {
    type: number
    sql: ${TABLE}.wiper_time ;;
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
	count_camera_history.count,
	spray.count
	]
  }

}
