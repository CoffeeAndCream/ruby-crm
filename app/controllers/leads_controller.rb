class LeadsController < ApplicationController
  helper_method :sort_column, :sort_direction
  has_scope :zip, :user, :city, :fullname, :first_name, :last_name, :address, :city, :customer


  def index
    @leads = apply_scopes(Lead).where(:customer => false).search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 25)
  end
  def show
    @lead = Lead.find_by(id: params[:id])
    @user = User.find_by_id(@lead.user_id)
  end
  def new
    authenticate_active_admin_user!
    @lead = Lead.new
  end
  def edit
    @lead = Lead.find_by(id: params[:id])
  end

  def convert
    @lead = Lead.find_by(id: params[:lead_id])
    @user = User.find_by_id(@lead.user_id)

    unless @lead.customer
      @lead.update_attributes(customer: true)
      if @user.nil?
        redirect_to :action => 'show', :id => @lead
      else
        UserMailer.lead_email(@user, @lead).deliver_now
        redirect_to :action => 'show', :id => @lead
      end
    else
      redirect_to :back, :info => @lead.fullname.to_s + ' is a contact.'
    end
  end

  def create
    @lead = Lead.new(permitted_params)
    if @lead.save
      @lead.update_attributes(created_at: DateTime.now)
      redirect_to lead_path(@lead)
    else
      @lead = Lead.where(address: params[:address])
      redirect_to new_lead_path, :danger => "A lead already exists with that name and address. <a href=" + lead_path(@lead) + ">Click</a>".html_safe
    end
  end
  def update
    @lead = Lead.find_by_id(params[:id])
    @lead.update_attributes(permitted_params)
    redirect_to :action => 'show', :id => @lead
  end
  def update_contract
    @lead = Lead.find_by_id(params[:lead][:lead_id])
    @lead.update_attributes(:contract_total => params[:lead][:contract_total])
    respond_to do |format|
      format.html {}
      format.js { render 'leads/payments/update_contract.js.erb'}
    end
  end
  def upload_photos
    @lead = Lead.find_by_id(params[:lead_id])
    puts params['/leads/'+@lead.id.to_s+'/upload_photos'][:images].inspect
    puts @lead.inspect
    @lead.images += params['/leads/'+@lead.id.to_s+'/upload_photos'][:images]
    if @lead.save
      redirect_to lead_path(@lead)
    else
      redirect_to lead_path(@lead)
    end
  end
  def destroy
    unless authenticate_active_admin_user!
      @lead = Lead.find_by(id: params[:id])
      @lead.destroy
      redirect_to leads_path, info: "Lead destroyed"
    end
  end
  def lead_sheet
    require 'action_view'
    require "prawn"
    @lead = Lead.find_by_id(params[:lead_id])
    Prawn::Font::AFM.hide_m17n_warning = true
    pdf = Prawn::Document.new(:page_size => 'LETTER')
    pdf.text @lead.first_name + " " + @lead.last_name + " - Lead Sheet", :size => 20, align: :center, leading: 10

    unless @lead.events.last.nil?
      pdf.indent(30) do
        pdf.text "<b>Appointment</b>", inline_format: true, align: :center, :size => 15
        event = @lead.events.last
        unless event.nil?
          pdf.text '<b>' + event.start.strftime('%I:%M %p') + '</b> - <b>' + event.ends.strftime('%I:%M %p') + '</b>', align: :center, inline_format: true
          pdf.text event.start.strftime('%A') +', ' + event.start.strftime('%m/%d/%Y'), align: :center, inline_format: true
          pdf.text event.title, leading: 25, align: :center
        end
      end
    end

    data = []
    unless @lead.address.nil?
      data.push(["Address", @lead.address + ', ' + @lead.city + ', ' + @lead.state + ' ' + @lead.zip])
    end
    unless @lead.phone.nil?
      data.push(["Phone Number", ActionController::Base.helpers.number_to_phone(@lead.phonenumber, area_code: true)])
    end
    unless @lead.user_id.nil?
      data.push(["Salesperson", User.find_by_id(@lead.user_id).fullname])
    else
      data.push(["Salesperson", "<i>No Salesperson Assigned</i>"])
    end
    unless @lead.services.nil?
      data.push(["Services", (@lead.services.reject(&:empty?).map { |i| Service.find_by_id(i).name }).join(', ')])
    else
      data.push(["Services", "<i>No Services Assigned</i>"])
    end
    data.push(["Source", @lead.source])
    pdf.indent(30) do
      pdf.table data, :cell_style => { border_color: 'dddddd', inline_format: true} do |table|
        table.row_colors = ['f7f7f7', 'ffffff']
        table.column(0).font_style = :bold
        table.column(0).width = 100
        table.column(1).width = 350
      end
    end
    pdf.stroke do
      pdf.move_down 30
      pdf.horizontal_rule
      pdf.move_down 30
    end
    pdf.indent(30) do
      pdf.text "<b>Comments and Event Notes</b>", inline_format: true, align: :left, :size => 14, leading: 5
    end
    unless @lead.comments.nil? || @lead.comments.empty?
      pdf.indent(40) do
        @lead.comments.each do |comment|
          pdf.text "• " + comment.comment, inline_format: true
          pdf.indent(10) do
            pdf.text "<i>" + comment.created_at.strftime('%m/%d/%Y - %I:%M:%S%P') + "</i>", inline_format: true, size: 10, leading: 5
          end
        end
      end
    else
      pdf.indent(40) do
        pdf.text "No comments.", leading: 5
      end
    end
    unless @lead.events.last.nil?
      pdf.indent(40) do
        event = @lead.events.last
        unless event.description.empty?
          pdf.text "• " + event.description, inline_format: true
          pdf.indent(10) do
            pdf.text "<i>" + event.created_at.strftime('%m/%d/%Y - %I:%M:%S%P') + "</i>", inline_format: true, size: 10, leading: 5
          end
        else
          pdf.text "No event notes.", leading: 5
        end
      end
    end
    pdf.stroke do
      pdf.move_down 30
      pdf.horizontal_rule
      pdf.move_down 30
    end
    pdf.indent(0) do
      pdf.text "<b>Notes</b>", inline_format: true, align: :left, :size => 14
    end
    10.times {
      pdf.stroke do
        pdf.move_down 10
        pdf.horizontal_rule
        pdf.move_down 10
      end
    }
    send_data pdf.render, :filename =>  @lead.first_name + '-' + @lead.last_name +  "-leadsheet.pdf", disposition: 'inline', :type => "application/pdf"

    #require 'pdfkit'
    #@lead = Lead.find_by_id(params[:lead_id])
    #render layout: false
  end

  private
  def permitted_params
    params.require(:lead).permit(:first_name, :last_name, :address, :phone, :email, :lead_id, :sort_column, :sort_direction,:city,:state,:zip, :fullname, :contract_total,
    :visit_date, :comments, :page, :contacted, :visited, :begin_project, :finished_project, :send_thank_you, :user_id, :source, :lead_task, :customer_task, :project_task, images: [], :services => [])
  end

end
