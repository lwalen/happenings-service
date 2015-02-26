class VisitsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_filter :get_access_code

  def index
    if params[:access_code] != @access_code
      render json: 'not allowed', status: 401
      return
    end

    @visits = Visit.all
  end

  def create
    person = params[:person]
    start_on = Date.parse(params[:start_on])
    end_on = Date.parse(params[:end_on])

    if params[:access_code] != @access_code
      render json: 'not allowed', status: 401
      return
    end

    if Visit.create(person: person, start_on: start_on, end_on: end_on)
      render json: 'success', status: 201
    else
      render json: 'failure', status: 500
    end
  end

  def destroy
    if params[:access_code] != @access_code
      render json: 'not allowed', status: 401
      return
    end

    if Visit.find(params[:id]).destroy
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

end
