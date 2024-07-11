view: target_weight {
  sql_table_name: edgefarm.target_weight ;;
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
  dimension: farm_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.farm_id ;;
  }
  dimension: grade_1 {
    type: number
    sql: ${TABLE}.grade_1 ;;
  }
  dimension: grade_1_plus {
    type: number
    sql: ${TABLE}.grade_1_plus ;;
  }
  dimension: grade_2 {
    type: number
    sql: ${TABLE}.grade_2 ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: weight {
    type: string
    sql: ${TABLE}.weight ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, farm.id, farm.name, farm.contact_name]
  }
}
