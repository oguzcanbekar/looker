
view: room_dayage_weightlist {
  derived_table: {
    sql: SELECT room_id, datediff(cat, birth_date) AS dayage , weight_list
        FROM (
          SELECT a.grow_camera_id 
               , a.room_id
               , b.birth_date
               , substr(a.created_at,1,10) AS cat
               , GROUP_CONCAT(a.weight_list) AS weight_list
            FROM grow_camera_history a
            JOIN `group` b ON a.group_id = b.id
           WHERE 1=1
      --         and a.grow_camera_id = 65
              AND a.weight_list IS NOT null
              AND a.weight_list != ''
              AND b.birth_date IS NOT null
           group BY a.grow_camera_id, substr(a.created_at,1,10), b.birth_date, a.room_id
           ) aa
           ORDER BY 1, 2 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: room_id {
    type: number
    sql: ${TABLE}.room_id ;;
  }

  dimension: dayage {
    type: number
    sql: ${TABLE}.dayage ;;
  }

  dimension: weight_list {
    type: string
    sql: ${TABLE}.weight_list ;;
  }

  set: detail {
    fields: [
        room_id,
	dayage,
	weight_list
    ]
  }
}
