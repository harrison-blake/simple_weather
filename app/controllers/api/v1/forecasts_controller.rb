class Api::V1::ForecastsController < ApplicationController
  def index
    forecast = ForecastFacade(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
