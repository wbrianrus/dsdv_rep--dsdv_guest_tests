connection: "dsdv-gcp_public-covid19_demo"

# include all the views
include: "/views/**/*.view"

datagroup: dsdv_guest_tests_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dsdv_guest_tests_default_datagroup

explore: covid_nyt_us_states {}
