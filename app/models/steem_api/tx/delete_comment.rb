class SteemApi::Tx::DeleteComment < SteemApi::SqlBase
  self.table_name = :TxDeleteComments
end

# Structure
#
# SteemApi::Tx::DeleteComment(
#   ID: integer,
#   tx_id: integer,
#   author: varchar,
#   permlink: varchar_max,
#   timestamp: datetime
# )
