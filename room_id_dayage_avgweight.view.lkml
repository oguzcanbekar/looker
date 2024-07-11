
view: room_id_dayage_avgweight {
  derived_table: {
    sql: WITH weights AS (
          SELECT
              a.room_id,
              a.id,  -- Assuming id is the primary key of grow_camera_history table
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
      ),
      averages AS (
          SELECT
              room_id,
              dayage,
              AVG(weight) AS average_weight
          FROM
              weights
          GROUP BY
              room_id,
              dayage
      )
      -- Update the grow_camera_history table with the calculated averages
      UPDATE grow_camera_history g
      JOIN (
          SELECT
              w.id,
              a.average_weight AS daybased_average
          FROM
              weights w
          JOIN
              averages a ON w.room_id = a.room_id AND w.dayage = a.dayage
      ) avg_weights ON g.id = avg_weights.id
      SET g.daybased_average = avg_weights.daybased_average ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: update_count {
    type: number
    sql: ${TABLE}.update_count ;;
  }

  set: detail {
    fields: [
        update_count
    ]
  }
}
