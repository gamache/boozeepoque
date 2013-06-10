class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @event_inquiry = EventInquiry.new
  end

  def event_inquiry
    @inq = EventInquiry.create(event_inquiry_params)
    respond_to do |format|
      format.html {redirect_to :index}
      format.json {render json: @inq, status: 201}
    end
  end

private

  def event_inquiry_params
    params.require(:event_inquiry).permit(EventInquiry::PARAMS)
  end

end
