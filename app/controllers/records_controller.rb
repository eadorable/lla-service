class RecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
    @device = Device.find(params[:device_id])
  end

  def edit
    @record = Record.find(params[:id])
    @device = Device.find(params[:device_id])
  end

  def create
    @record = Record.new(record_params)
    @device = Device.find(params[:device_id])
    @record.device_id = @device.id

    @record.user_id = current_user.id

    if @record.save
      redirect_to device_path(@device), notice: 'Record was successfully added.'
    else

      render :new, notice: 'Record could not be added, check the form for errors'
    end
  end

  def update
    @record = Record.find(params[:id])
    @device = Device.find(params[:device_id])
    @record.device_id = @device.id

    if @record.update(record_params)
      redirect_to device_path(@device), notice: 'Record was successfully updated.'
    else
      render :edit, notice: 'Record could not be updated, check the form for errors'
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @device = Device.find(params[:device_id])
    @record.destroy
    redirect_to device_path(@device), notice: 'Record was successfully deleted.'
  end

  private

  def record_params
    params.require(:record).permit(:record_date, :ticket_number, :customer_problem, :lla_diagnose, :action, :user_id,
                                   :device_id)
  end
end
