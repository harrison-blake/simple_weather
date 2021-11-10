class Api::V1::ForecastsController < ApplicationController
  def index
    forecast = ForecastFacade.forecast_from_location(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
