class SteemApi::Vo::Interest < SteemApi::SqlBase
  self.table_name = :VOInterests
end

# Structure
#
# SteemApi::Vo::Interest(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   owner: varchar,
#   Interest: money
# )