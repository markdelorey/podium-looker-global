view: messages {
  sql_table_name: black_mamba.messages ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: api_client_id {
    type: number
    sql: ${TABLE}.api_client_id ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension_group: inserted {
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
    sql: ${TABLE}.inserted_at ;;
  }

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
  }

  dimension: resource_uid {
    type: string
    sql: ${TABLE}.resource_uid ;;
  }

  dimension: review_invitation_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.review_invitation_id ;;
  }

  dimension: review_invitation_url {
    type: string
    sql: ${TABLE}.review_invitation_url ;;
  }

  dimension: sender_name {
    type: string
    sql: ${TABLE}.sender_name ;;
  }

  dimension: sid {
    type: string
    sql: ${TABLE}.sid ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: step_id {
    type: number
    sql: ${TABLE}.step_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
      sender_name,
      users.id,
      users.username,
      users.last_name,
      users.first_name,
      review_invitations.id,
      review_invitations.customer_name
    ]
  }
}
