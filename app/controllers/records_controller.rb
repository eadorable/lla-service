class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id # Assign the current user to the record

    if @record.save
      redirect_to records_path, notice: 'Record was successfully created.'
    else
      puts @record.errors.full_messages # Outputs any validation errors
      flash.now[:notice] = 'Record could not be created, check the form for errors'
      render :new
    end
  end

  private

  def record_params
    params.require(:record).permit(:record_date, :serial_number, :ticket_number, :device_type, :customer_problem, :lla_diagnose, :action, :user_id, :customer)
  end
end
