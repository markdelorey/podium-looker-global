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
    sql: ${TABLE}.review_count;;
  }

  dimension: review_rating {
    type: number
    sql: ${TABLE}.review_rating;;
  }

  dimension: overall_review_rating {
    type: number
    sql: COALESCE(1.0 * (${review_rating} * ${review_count}) / NULLIF(${review_count},0),0) ;;
  }

  measure: aggregate_rating_numerator {
    hidden: yes
    type: sum
    sql: ${review_rating} * ${review_count} ;;
  }

  measure: aggregate_count {
    type: sum
    sql: ${review_count} ;;
  }

  measure: aggregate_rating {
    type: number
    sql: CASE WHEN ${aggregate_count} > 0 THEN ${aggregate_rating_numerator} / ${aggregate_count} ELSE NULL END;;
  }

  measure: google_aggregate_rating_numerator {
    hidden: yes
    type: sum
    sql: ${review_rating} * ${review_count} ;;
    filters: {
      field: location_sites.site
      value: "google"
    }
  }

  measure: google_aggregate_count {
    type: sum
    sql: ${review_count} ;;
    filters: {
      field: location_sites.site
      value: "google"
    }
  }

  measure: google_aggregate_rating {
    type: number
    sql: CASE WHEN ${google_aggregate_count} > 0 THEN ${google_aggregate_rating_numerator} / ${google_aggregate_count} ELSE NULL END;;
  }

  measure: facebook_aggregate_rating_numerator {
    hidden: yes
    type: sum
    sql: ${review_rating} * ${review_count} ;;
    filters: {
      field: location_sites.site
      value: "facebook"
    }
  }

  measure: facebook_aggregate_count {
    type: sum
    sql: ${review_count} ;;
    filters: {
      field: location_sites.site
      value: "facebook"
    }
  }

  measure: facebook_aggregate_rating {
    type: number
    sql: CASE WHEN ${facebook_aggregate_count} > 0 THEN ${facebook_aggregate_rating_numerator} / ${facebook_aggregate_count} ELSE NULL END;;
  }

  measure: count {
    type: count
    drill_fields: [id, location_sites.id, location_sites.display_name]
  }

}
