class LettersController < ApplicationController
  def index
    #shows list of letters
    @letters = Letter.all
    @lead = Lead.find_by_id(params[:lead_id])
  end
  def create
    @lead = Lead.find_by_id(params[:letter][:lead_id])
    @letter = Letter.find_by_id(params[:letter][:id])

    require 'action_view'
    require "prawn"
    Prawn::Font::AFM.hide_m17n_warning = true
    pdf = Prawn::Document.new(:page_size => 'LETTER')
    pdf.image open("http://localhost:3000/" +  Company.first.images.to_s), width: 250, position: :center
    pdf.move_down 80
    pdf.text DateTime.now.strftime("%d %B, %Y")
    pdf.move_down 50
    pdf.text @lead.fullname
    pdf.text @lead.address
    pdf.text @lead.city + ', ' + @lead.state + ' ' + @lead.zip
    pdf.move_down 20
    pdf.text 'Dear ' + @lead.first_name + ',', leading: 10
    pdf.text @letter.description
    pdf.move_down 20
    pdf.text 'Sincerely,'
    pdf.move_down 20
    pdf.text User.find_by_id(@lead.user_id).fullname
    pdf.text 'Legacy Exteriors, LLC'
    pdf.draw_text 'PH: 608-221-3000', at: [0, 0]
    pdf.draw_text 'Legacy Exteriors, LLC', at: [215, 20]
    pdf.draw_text '4125 Terminal Dr. McFarland WI 53558', at: [165, 0]
    pdf.draw_text 'FAX: 608-221-3000', at: [430, 0]

    send_data pdf.render, :filename =>  @lead.first_name + '-' + @lead.last_name +  "-letter.pdf", disposition: 'inline', :type => "application/pdf"
  end

  private
  def permitted_params
    params.require(:letter).permit(:name, :description, :letter, :lead_id)
  end
end
