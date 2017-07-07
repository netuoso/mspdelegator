class DelegateController < ApplicationController

  def index
    @mspbots = Settings.msp_bots
  end

  def delegators
    @delegators = SteemConnection.delegators
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
      (1000000 / steem_per_mvests.to_f) * sp.to_f
    rescue ZeroDivisionError => e
      Rails.logger.error("Error: #{e}")
      0
    end
  end

  def steem_per_mvests
    begin
      steemd_response = RestClient::Request.execute(method: :get, url: "https://steemd.com", timeout: 3, open_timeout: 3).body
      Nokogiri::XML.parse(steemd_response).css('.hash3').first.text.match(/^steem_per_mvests(\d*.\d*)/)[1]
    rescue => e
      Rails.logger.error("Error: #{e}")
      Settings.steem_per_mvests
    end
  end

  def permitted_params
    params.permit(:delegator,:delegatee,:sp)
  end
end
