view: alarm_history_sub_category {
  sql_table_name: edgefarm.alarm_history_sub_category ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, alarm_history.count]
  }
}
