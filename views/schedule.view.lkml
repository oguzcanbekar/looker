view: schedule {
  sql_table_name: edgefarm.schedule ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: all_day {
    type: yesno
    sql: ${TABLE}.all_day ;;
  }
  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: ended {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ended_at ;;
  }
  dimension: farm_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.farm_id ;;
  }
  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
  }
  dimension: piggery_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.piggery_id ;;
  }
  dimension: room_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.room_id ;;
  }
  dimension_group: started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.started_at ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	farm.id,
	farm.name,
	farm.contact_name,
	piggery.id,
	piggery.name,
	room.id,
	room.name,
	schedule_worker.count
	]
  }

}
