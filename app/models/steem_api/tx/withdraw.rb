class SteemApi::Tx::Withdraw < SteemApi::SqlBase
  self.table_name = :TxWithdraws
end

# Structure
#
# SteemApi::Tx::Withdraw(
#   ID: integer,
#   tx_id: integer,
#   account: varchar,
#   vesting_shares: money,
#   timestamp: datetime
# )
