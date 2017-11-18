class TicketsController < ApplicationController
  before_action :set_train, only: [:new, :create]
  before_action :set_from_station, only: [:new, :create]
  before_action :set_to_station, only: [:new, :create]
  before_action :set_ticket, only: [:show, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = @train.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:number,
                                   :full_name,
                                   :passport_number,
                                   :from_station_id,
                                   :to_station_id,
                                   :wagon_id)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_from_station
    @from_station = RailwayStation.find(params[:from_station_id])
  end

  def set_to_station
    @to_station = RailwayStation.find(params[:to_station_id])
  end
end
