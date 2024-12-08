class RecordsController < ApplicationController

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

    # @device.id = @record.device_id # Assign the current device to the record

    if @record.save

      redirect_to devices_path, notice: 'Record was successfully added.'
    else

      render :new, notice: 'Record could not be added, check the form for errors'
    end


  end


  private

  def record_params
    params.require(:record).permit(:record_date, :ticket_number, :customer_problem, :lla_diagnose, :action, :user_id, :device_id)
  end

end
