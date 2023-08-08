view: ndt_looker_user {
  derived_table: {
    explore_source: user {
      column: id {}
      column: first_name {}
      column: last_name {}
      column: external_avatar_url {}
      column: eula_accepted_version {}
      column: count {}
    }
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: first_name {
    description: ""
  }
  dimension: last_name {
    description: ""
  }
  dimension: external_avatar_url {
    description: ""
  }
  dimension: eula_accepted_version {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
}

# If necessary, uncomment the line below to include explore_source.
# include: "looker_test_lmbg.model.lkml"

view: ndt_looker_user_version {
  derived_table: {
    explore_source: user {
      column: first_name {}
      column: last_name {}
      column: id {}
      column: models_dir {}
      column: version_set_id {}
      column: versions { field: version_set.versions }
      column: version_id { field: version_set.id }
      column: version_count { field: version_set.count }
      column: count {}
      filters: {
        field: user.models_dir
        value: "-NULL"
      }
    }
  }
  dimension: first_name {
    description: ""
  }
  dimension: last_name {
    description: ""
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: models_dir {
    description: ""
  }
  dimension: version_set_id {
    description: ""
    type: number
  }
  dimension: versions {
    description: ""
  }
  dimension: version_id {
    description: ""
    type: number
  }
  dimension: version_count {
    description: ""
    type: number
  }
  dimension: count {
    description: ""
    type: number
  }
}


# view: ndt_looker_user {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
