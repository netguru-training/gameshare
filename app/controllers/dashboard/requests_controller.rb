module Dashboard
  class RequestsController < ApplicationController
    expose(:requests_from) { Request.where(user_id_from: current_user) }
    expose(:requests_to) { Request.where(user_id_to: current_user ) }
    expose(:request_item) { Request.find(params[:request_id]) }

    def index
    end

    def accept
      if request_item.abc!
        redirect_to dashboard_requests_path, notice: 'Accepted.'
      else
        redirect_to dashboard_requests_path, flash: { error: 'Cannot accept.' }
      end
    end

    def reject
      if request_item.reject!
        redirect_to dashboard_requests_path, notice: 'Rejected.'
      else
        redirect_to dashboard_requests_path, flash: { error: 'Cannot reject.' }
      end
    end
  end
end
