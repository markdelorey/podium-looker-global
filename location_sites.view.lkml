view: location_sites {
  sql_table_name: review_rocket.location_sites ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension_group: last_deep {
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
    sql: ${TABLE}.last_deep_at ;;
  }

  dimension_group: last_shallow {
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
    sql: ${TABLE}.last_shallow_at ;;
  }

  dimension: location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: site_order_position {
    type: number
    sql: ${TABLE}.site_order_position ;;
  }

  measure: count {
    type: count
    drill_fields: [id, display_name, locations.id, locations.name, review_snapshots.count]
  }
}
