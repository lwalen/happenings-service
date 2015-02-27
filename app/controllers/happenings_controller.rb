class HappeningsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_filter :get_access_code
  before_filter :check_access_code

  def index
    @happenings = Happening.all
  end

  def create
    person = params[:person]
    start_on = Date.parse(params[:start_on])
    end_on = Date.parse(params[:end_on])

    if Happening.create(person: person, start_on: start_on, end_on: end_on)
      render json: 'success', status: 201
    else
      render json: 'failure', status: 500
    end
  end

  def destroy
    if Happening.find(params[:id]).destroy
      render json: 'success', status: 201
    else
      render json: 'failure', status: 500
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
