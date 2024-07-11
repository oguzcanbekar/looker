view: spray {
  sql_table_name: edgefarm.spray ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: count_camera_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.count_camera_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: grow_camera_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.grow_camera_id ;;
  }
  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }
  dimension: serial_number {
    type: string
    sql: ${TABLE}.serial_number ;;
  }
  measure: count {
    type: count
    drill_fields: [id, grow_camera.id, grow_camera.name, count_camera.id, count_camera.name]
  }
}
