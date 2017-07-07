class SteemApi::Tx::AccountRecover < SteemApi::SqlBase
  self.table_name = :TxAccountRecovers
end

# Structure
#
# SteemApi::Tx::AccountRecover(
#   ID: integer,
#   tx_id: integer,
#   recovery_account: varchar,
#   account_to_recover: varchar,
#   recovered: boolean,
#   timestamp: datetime
# )
