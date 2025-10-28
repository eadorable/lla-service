class DevicesController < ApplicationController
  require 'prawn'
  require 'prawn/table'
def index
  # If a search query is present, use the search scope
  if params[:query].present?
    @devices = Device.search(params[:query])
  else
    # If no search query and "show_all" is present, show all devices
    if params[:show_all].present?
      @devices = Device.all
    else
      # If no search and no "show_all", show an empty array
      @devices = []
    end
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
    
    respond_to do |format|
      format.html
      format.pdf { render_pdf }
    end
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

  def render_pdf
    pdf = Prawn::Document.new
    
    # Title
    pdf.text "Device Records", size: 20, style: :bold
    pdf.move_down 10
    
    # Device Information
    pdf.text "Device: #{@device.device_type}", size: 12
    pdf.text "FoV(mm): #{@device.fov}", size: 12
    pdf.text "Device Number: #{@device.serial_number}", size: 12
    pdf.text "Customer: #{@device.customer}", size: 12
    pdf.move_down 15
    
    # Records Table
    if @device_records.present?
      table_data = [
        ["Date", "Ticket Number", "Customer Error", "LLA Diagnose", "Action"]
      ]
      
      @device_records.each do |record|
        table_data << [
          record.record_date.to_date.to_s,
          record.ticket_number,
          record.customer_problem,
          record.lla_diagnose,
          record.action
        ]
      end
      
      pdf.table(table_data, width: 540) do |table|
        table.header = true
        table.row(0).font_style = :bold
      end
    else
      pdf.text "No records available."
    end
    
    send_data pdf.render, filename: "device_#{@device.serial_number}.pdf", type: "application/pdf"
  end

  def device_params
    params.require(:device).permit(:device_type, :serial_number, :customer, :user_id, :fov)
  end


end
