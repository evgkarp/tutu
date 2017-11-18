class SearchesController < ApplicationController
  def show
    @search_result = Search.new(params[:from_station_id], params[:to_station_id])
  end
end
