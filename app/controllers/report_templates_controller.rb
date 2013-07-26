class ReportTemplatesController < ApplicationController

  before_filter :authenticate_user!

  # GET /report_templates
  # GET /report_templates.json
  def index
    @report_templates = ReportTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report_templates }
    end
  end

  # GET /report_templates/1
  # GET /report_templates/1.json
  def show
    @report_template = ReportTemplate.find(params[:id])
    
    eval(@report_template.setup)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report_template.setup }
      format.xml { render xml: @report_template.setup }
    end
  end

end
