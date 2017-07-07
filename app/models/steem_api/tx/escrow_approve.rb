class SteemApi::Tx::EscrowApprove < SteemApi::SqlBase
  self.table_name = :TxEscrowApproves
end

# Structure
#
# SteemApi::Tx::EscrowApprove(
#   ID: integer,
#   tx_id: integer,
#   from: varchar,
#   to: varchar,
#   agent: varchar,
#   who: varchar,
#   escrow_id: integer,
#   approve: boolean,
#   timestamp: datetime
# )
