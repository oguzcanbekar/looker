view: report {
  sql_table_name: edgefarm.report ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
  }
  dimension: movement_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.movement_id ;;
  }
  dimension: report_category_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.report_category_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, movement.id, report_category.id, report_category.name]
  }
}
