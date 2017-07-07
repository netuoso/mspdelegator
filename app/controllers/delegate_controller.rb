class DelegateController < ApplicationController

  def index
    @mspbots = Settings.msp_bots
    @steem_per_mvests = SteemConnection.steem_per_mvests
  end

  def delegators
    @delegators = SteemConnection.msp_delegators
  end

  def generate_url
    if permitted_params[:delegator].present? && permitted_params[:sp].present?
      steem_to_vests = calculated_vests(permitted_params[:sp])

      if steem_to_vests == 0.0 || steem_to_vests == Float::INFINITY
        @result = "Error getting current steem_per_mvests conversion rate. Try again later."
      else
        @result = "https://v2.steemconnect.com/sign/delegateVestingShares?delegator=#{permitted_params[:delegator].gsub(/@/,"")}&delegatee=#{permitted_params[:delegatee].gsub(/@/,"")}&vesting_shares=#{steem_to_vests.round(6)}%20VESTS"
      end
    else
      @result = "Ensure you have provided delegator and sp and retry."
    end
  end

  private

  def calculated_vests(sp)
    begin
      (1000000 / SteemConnection.steem_per_mvests.to_f) * sp.to_f
    rescue ZeroDivisionError => e
      Rails.logger.error("Error: #{e}")
      0
    end
  end

  def permitted_params
    params.permit(:delegator,:delegatee,:sp)
  end

end
