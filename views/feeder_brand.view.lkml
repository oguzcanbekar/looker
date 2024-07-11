view: feeder_brand {
  sql_table_name: edgefarm.feeder_brand ;;
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
  dimension: sync {
    type: yesno
    sql: ${TABLE}.sync ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
