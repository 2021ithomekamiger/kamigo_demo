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

  def draw_dice
    user_id = params.dig(:source_user_id)
    dices = [1, 2, 3, 4, 5, 6]

    if user_id == "Ud479d7e568247ce0985bfd146a82c18f"
        dices += [6, 6, 6, 6]
    end

    @message = "你擲出的骰子點數為：#{dices.sample}"
  end

  def test
    user_id = params.dig(:source_user_id)
    if user_id == "Ud479d7e568247ce0985bfd146a82c18f"
      @message = "你是作者，可以進行操作"
    else
      @message = "你沒有權限進行操作"
    end
  end

  def fun_slot1
    part1 = ["頭1", "頭2", "頭3"].sample
    part2 = ["中1", "中2", "中3"].sample
    part3 = ["尾1", "尾2", "尾3"].sample
    @message = "#{part1}#{part2}#{part3}"
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

