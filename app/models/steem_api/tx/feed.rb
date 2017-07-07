class SteemApi::Tx::Feed < SteemApi::SqlBase
  self.table_name = :TxFeeds
end

# Structure
#
# SteemApi::Tx::Feed(
#   ID: integer,
#   tx_id: integer,
#   publisher: varchar,
#   exchange_rate_base: money,
#   exchange_rate_quote: money,
#   timestamp: datetime
# )
