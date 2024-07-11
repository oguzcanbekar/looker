view: target_feeding {
  sql_table_name: edgefarm.target_feeding ;;
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
  dimension: feeding {
    type: string
    sql: ${TABLE}.feeding ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, farm.id, farm.name, farm.contact_name]
  }
}
