view: schedule_worker {
  sql_table_name: edgefarm.schedule_worker ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: schedule_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.schedule_id ;;
  }
  dimension: worker_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.worker_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, schedule.id, worker.id, worker.name]
  }
}
