
view: roomid_dayage_avgweight {
  derived_table: {
    sql: SELECT
          room_id,
          dayage,
          AVG(weight) AS average_weight
      FROM (
          SELECT
              a.room_id,
              DATEDIFF(SUBSTR(a.created_at, 1, 10), b.birth_date) AS dayage,
              CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(a.weight_list, ',', numbers.n), ',', -1) AS DECIMAL(10, 2)) AS weight
          FROM
              grow_camera_history a
          JOIN
              `group` b ON a.group_id = b.id
          JOIN (
              SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
              SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL
              SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL
              SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
          ) numbers
          ON CHAR_LENGTH(a.weight_list) - CHAR_LENGTH(REPLACE(a.weight_list, ',', '')) >= numbers.n - 1
          WHERE
              a.weight_list IS NOT NULL
              AND a.weight_list != ''
              AND b.birth_date IS NOT NULL
      ) AS weights
      GROUP BY
          room_id,
          dayage
      ORDER BY
          room_id,
          dayage ;;
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

  dimension: average_weight {
    type: number
    sql: ${TABLE}.average_weight ;;
  }

  set: detail {
    fields: [
        room_id,
	dayage,
	average_weight
    ]
  }
}
