class DevicesController < ApplicationController
def index
    # Start with all devices
    @devices = Device.all

    # If a search query is present, use the search scope
    if params[:query].present?
      # Use the `search` scope defined in the Device model
      # This joins with records and searches across:
      # - Device fields: serial_number, customer, device_type
      # - Record field: ticket_number
      @devices = @devices.search(params[:query])
    end
end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.user_id = current_user.id
    if @device.save
      redirect_to devices_path, notice: 'Device was successfully added.'
    else
      render :new, notice: 'Device could not be added, check the form for errors'
    end
  end

  def show
    @device = Device.find(params[:id])
    @device_records = Record.where(device_id: @device.id)
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      redirect_to devices_path, notice: 'Device was successfully updated.'
    else
      render :edit, notice: 'Device could not be updated, check the form for errors'
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path, notice: 'Device was successfully deleted.'
  end

  private
  def device_params
    params.require(:device).permit(:device_type, :serial_number, :customer, :user_id, :fov)
  end
end
