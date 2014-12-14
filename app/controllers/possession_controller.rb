class PossessionController < ApplicationController
  private

  def possession_params
    params.require(:possession).permit(:user_id, :game_id, :type)
  end
end
