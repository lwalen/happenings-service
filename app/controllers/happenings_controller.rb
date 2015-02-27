class HappeningsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_filter :get_access_code
  before_filter :check_access_code

  def index
    @happenings = Happening.all
  end

  def create
    subject = params[:subject]
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    if Happening.create(subject: subject, start_date: start_date, end_date: end_date)
      render json: {status: 201, message: 'Happening created.'}, status: 201
    else
      render json: {status: 500, message: 'Failed to create happening.'}, status: 500
    end
  end

  def destroy
    if Happening.find(params[:id]).destroy
      render json: {status: 201, message: 'Happening deleted.'}, status: 201
    else
      render json: {status: 500, message: 'Failed to delete happening.'}, status: 500
    end
  end

  private

  def get_access_code
    @access_code = Setting[:access_code]

    unless @access_code
      render json: {status: 500, message: 'Access code not set.'}, status: 500
    end
  end

  def check_access_code
    if params[:access_code] != @access_code
      render json: {
        status: 401, 
        message: 'Invalid access code. Access forbidden.'
      }, status: 401
      return
    end
  end

end
