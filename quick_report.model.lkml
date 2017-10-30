connection: "redshift"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: review_invitations {
  label: "Custom Reports - Reviews + Invites"
  join: users {
    sql_on:  ${review_invitations.user_id} = ${users.id};;
    relationship: one_to_one
    type: left_outer
  }
  join: third_party_reviews {
    sql_on: ${third_party_reviews.review_invitation_id} = ${review_invitations.id};;
    relationship: one_to_one
    type:  full_outer
  }
  join: locations {
    sql_on: CASE WHEN ${review_invitations.id} IS NULL THEN ${third_party_reviews.location_id} = ${locations.id} ELSE ${review_invitations.location_id} = ${locations.id} END ;;
    relationship:  many_to_one
    type: left_outer
  }
  join: organizations {
    sql_on:  ${locations.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
    type:  left_outer
  }
}

explore: review_snapshots {
  label: "Custom Reports - Rating Snapshots"
  join: location_sites {
    sql_on:  ${review_snapshots.location_site_id} = ${location_sites.id} ;;
    sql_where: (${location_sites.deleted_raw} IS NULL AND ${location_sites.site} != 'yelp');;

    relationship:  many_to_one
    type: inner
  }
  join: locations {
    sql_on: ${location_sites.location_id} = ${locations.id};;
    relationship:  many_to_one
    type: inner
  }
  join: organizations {
    sql_on:  ${locations.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
    type:  inner
  }
}
