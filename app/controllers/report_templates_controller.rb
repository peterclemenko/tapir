class ReportTemplatesController < ApplicationController
  # GET /report_templates
  # GET /report_templates.json
  def index
    @report_templates = Tapir::ReportTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report_templates }
    end
  end

  # GET /report_templates/1
  # GET /report_templates/1.json
  def show
    @report_template = Tapir::ReportTemplate.find(params[:id])

    if @report_template.name == "Findings Report"
      @entities = Tapir::Entities::Finding.all
    elsif @report_template.name == "Organization Report"
      @entities = Tapir::Entities::Organization.all
    else
      @entities = Tapir::Entities::Base.all
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report_template }
    end
  end
end
