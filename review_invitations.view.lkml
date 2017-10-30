view: review_invitations {
  sql_table_name: review_rocket.review_invitations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: integration_id {
    type: number
    sql: ${TABLE}.integration_id ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: location_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  dimension: message_sid {
    type: string
    sql: ${TABLE}.message_sid ;;
  }

  dimension: meta_data {
    type: string
    sql: ${TABLE}.meta_data ;;
  }

  dimension: mms_url {
    type: string
    sql: ${TABLE}.mms_url ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent_at ;;
  }

  dimension: sent_externally {
    type: yesno
    sql: ${TABLE}.sent_externally ;;
  }

  dimension_group: sent_from_mobile_app {
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
    sql: ${TABLE}.sent_from_mobile_app_at ;;
  }

  dimension: sms_text {
    type: string
    sql: ${TABLE}.sms_text ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      customer_name,
      users.id,
      users.username,
      users.last_name,
      users.first_name,
      organizations.id,
      organizations.business_name,
      locations.id,
      locations.name,
      third_party_reviews.count
    ]
  }
}
