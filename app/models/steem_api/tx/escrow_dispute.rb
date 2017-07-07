class SteemApi::Tx::EscrowDispute < SteemApi::SqlBase
  self.table_name = :TxEscrowDisputes
end

# Structure
#
# SteemApi::Tx::EscrowDispute(
#   ID: integer,
#   tx_id: integer,
#   from: varchar,
#   to: varchar,
#   agent: varchar,
#   who: varchar,
#   escrow_id: integer,
#   timestamp: datetime
# )
