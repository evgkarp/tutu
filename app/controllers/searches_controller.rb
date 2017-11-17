class SearchesController < ApplicationController
  def show
    @found_routes = Search.start(params[:from_station_id], params[:to_station_id])
    @from_station = Search.from_station(params[:from_station_id])
    @to_station = Search.to_station(params[:to_station_id])
  end
end
