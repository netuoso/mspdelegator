class SteemApi::Vo::FillConvertRequest < SteemApi::SqlBase
  self.table_name = :VOFillConvertRequest
end

# Structure
#
# SteemApi::Vo::FillConvertRequest(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   owner: varchar,
#   requestid: integer,
#   amount_in: varchar,
#   amount_out: varchar
# )
