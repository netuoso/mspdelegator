class SteemApi::Tx::AccountWitnessVote < SteemApi::SqlBase
  self.table_name = :TxAccountWitnessVotes
end

# Structure
#
# SteemApi::Tx::AccountWitnessVote(
#   ID: integer, 
#   tx_id: integer, 
#   account: varchar, 
#   witness: varchar, 
#   approve: boolean, 
#   timestamp: datetime
# )
