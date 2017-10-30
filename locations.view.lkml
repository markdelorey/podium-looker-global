view: locations {
  sql_table_name: review_rocket.locations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: address_obj {
    type: string
    sql: ${TABLE}.address_obj ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
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

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified_at ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: mms_custom {
    type: string
    sql: ${TABLE}.mms_custom ;;
  }

  dimension: mms_enabled {
    type: yesno
    sql: ${TABLE}.mms_enabled ;;
  }

  dimension: mms_image {
    type: string
    sql: ${TABLE}.mms_image ;;
  }

  dimension: monthly_review_quota {
    type: number
    sql: ${TABLE}.monthly_review_quota ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: no_resend_interval_days {
    type: number
    sql: ${TABLE}.no_resend_interval_days ;;
  }

  dimension: nps_mix_pct {
    type: number
    sql: ${TABLE}.nps_mix_pct ;;
  }

  dimension: organization_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: podium_number {
    type: string
    sql: ${TABLE}.podium_number ;;
  }

  dimension: ratings_by_site {
    type: string
    sql: ${TABLE}.ratings_by_site ;;
  }

  dimension: sms_content {
    type: string
    sql: ${TABLE}.sms_content ;;
  }

  dimension: sms_content_fallback {
    type: string
    sql: ${TABLE}.sms_content_fallback ;;
  }

  dimension: total_reviews_by_site {
    type: string
    sql: ${TABLE}.total_reviews_by_site ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      organizations.id,
      organizations.business_name,
      review_invitations.count,
      third_party_reviews.count,
      users.count
    ]
  }
}
