view: sensor_history {
  sql_table_name: edgefarm.sensor_history ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: co2 {
    type: number
    sql: ${TABLE}.co2 ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: humidity {
    type: number
    sql: ${TABLE}.humidity ;;
  }
  dimension: sensor_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sensor_id ;;
  }
  dimension: temperature {
    type: number
    sql: ${TABLE}.temperature ;;
  }
  measure: count {
    type: count
    drill_fields: [id, sensor.id, sensor.name]
  }
}
