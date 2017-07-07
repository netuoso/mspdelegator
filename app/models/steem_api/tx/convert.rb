class SteemApi::Tx::Convert < SteemApi::SqlBase
  self.table_name = :TxConverts
end

# Structure
#
# SteemApi::Tx::Convert(
#   ID: integer,
#   tx_id: integer,
#   owner: varchar,
#   requestid: integer,
#   amount: money,
#   timestamp: datetime
# )
