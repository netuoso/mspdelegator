class SteemApi::Tx::AccountWitnessProxy < SteemApi::SqlBase
  self.table_name = :TxAccountWitnessProxies
end

# Structure
#
# SteemApi::Tx::AccountWitnessProxy(
#   ID: integer,
#   tx_id: integer,
#   account: varchar,
#   Proxy: varchar,
#   timestamp: datetime
# )
