class SteemApi::Vo::ShutdownWitness < SteemApi::SqlBase
  self.table_name = :VOShutdownWitnesses
end

# Structure
#
# SteemApi::Vo::ShutdownWitness(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   owner: varchar
# )
