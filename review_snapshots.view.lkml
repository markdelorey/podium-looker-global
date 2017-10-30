view: review_snapshots {
  sql_table_name: review_rocket.review_snapshots ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: backfill {
    type: yesno
    sql: ${TABLE}.backfill ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: location_site_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.location_site_id ;;
  }

  dimension: review_count {
    type: number
    sql: ${TABLE}.review_count ;;
  }

  dimension: review_rating {
    type: number
    sql: ${TABLE}.review_rating ;;
  }

  measure: count {
    type: count
    drill_fields: [id, location_sites.id, location_sites.display_name]
  }
}
