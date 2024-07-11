view: feeder_history {
  sql_table_name: edgefarm.feeder_history ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: fed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fed_at ;;
  }
  dimension: feeder_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.feeder_id ;;
  }
  dimension: feeding_method {
    type: yesno
    sql: ${TABLE}.feeding_method ;;
  }
  measure: count {
    type: count
    drill_fields: [id, feeder.id, feeder.name]
  }
}
