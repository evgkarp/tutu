class WagonsController < ApplicationController
  before_action :set_train, only: [:new, :create]
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to @train
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to wagon_path(@wagon)
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url
  end

  private

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:type,
                                  :upper_seats,
                                  :lower_seats,
                                  :side_upper_seats,
                                  :side_lower_seats,
                                  :seats,
                                  :number,
                                  :train_id)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
