module DelegateHelper

  def witness_votes_received(account)
    votes_for_account = SteemApi::Tx::AccountWitnessVote.where(witness: account)
    grouped_votes = votes_for_account.group_by(&:account)
    grouped_votes = grouped_votes.collect { |account,votes| {account: account, last_vote_is_approve: votes.last.approve} }
    grouped_votes.select { |vote_pair| vote_pair[:last_vote_is_approve] == true }.count
  end

  def witness_votes_cast(account)
    votes_for_witness = SteemApi::Tx::AccountWitnessVote.where(account: account)
    grouped_votes = votes_for_witness.group_by(&:witness)
    grouped_votes = grouped_votes.collect { |account,votes| {account: account, last_vote_is_approve: votes.last.approve} }
    grouped_votes.select { |vote_pair| vote_pair[:last_vote_is_approve] == true }.count
  end

end
