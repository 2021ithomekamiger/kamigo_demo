class HomeController < ApplicationController
  include Kamigo::Clients::LineClient

  # before_action :authenticate_user
  def share_bot
  end

  def share_bot_flex
  end

  def member_join
    @profiles = params.dig(:payload, :joined, :members).map{|member| get_profile(member.dig(:userId)) }
  end

  def test
    user_id = params.dig(:source_user_id)
    if user_id == "Ud479d7e568247ce0985bfd146a82c18f"
      @message = "你是作者，可以進行操作"
    else
      @message = "你沒有權限進行操作"
    end
  end

  private

  def get_profile(user_id)
    case params[:source_type]
    when 'group'
      response = client.get_group_member_profile(
        params[:source_group_id],
        user_id
      )
    when 'room'
      response = client.get_room_member_profile(
        params[:source_group_id],
        user_id
      )
    else
      response = client.get_profile(user_id)
    end
    JSON.parse(response.body)
  end
end

