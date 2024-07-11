view: service_log {
  sql_table_name: edgefarm.service_log ;;
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
  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
  }
  dimension: headers {
    type: string
    sql: ${TABLE}.headers ;;
  }
  dimension: member_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.member_id ;;
  }
  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }
  dimension: query_params {
    type: string
    sql: ${TABLE}.query_params ;;
  }
  dimension: request_body {
    type: string
    sql: ${TABLE}.request_body ;;
  }
  dimension: response_body {
    type: string
    sql: ${TABLE}.response_body ;;
  }
  dimension: status_code {
    type: number
    sql: ${TABLE}.status_code ;;
  }
  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }
  measure: count {
    type: count
    drill_fields: [id, member.id, member.username, member.name]
  }
}
