class TaskRunsController < ApplicationController

  before_filter :authenticate_user!

  # GET /task_runs
  # GET /task_runs.json
  def index
    @task_runs = TaskRun.all

    @data= { 
      "sEcho" => 0,
      "iTotalRecords" => @task_runs.count,
      "iTotalDisplayRecords" => @task_runs.count,
      "aaData" =>  @task_runs.map do |task_run|
         ["<a href=\"/task_runs/#{task_run._id}\">#{task_run}</a>"]
        end
    }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data }
    end
  end

  # GET /task_runs/1
  # GET /task_runs/1.json
  def show
    @task_run = TaskRun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_run }
    end
  end

  # GET /task_runs/new
  # GET /task_runs/new.json
  def new
    @task_run = TaskRun.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_run }
    end
  end

  # GET /task_runs/1/edit
  def edit
    @task_run = TaskRun.find(params[:id])
  end

  # POST /task_runs
  # POST /task_runs.json
  def create
    @task_run = TaskRun.new(params[:tapir_task_run])

    respond_to do |format|
      if @task_run.save
        format.html { redirect_to @task_run, notice: 'Task run was successfully created.' }
        format.json { render json: @task_run, status: :created, location: @task_run }
      else
        format.html { render action: "new" }
        format.json { render json: @task_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_runs/1
  # PUT /task_runs/1.json
  def update
    @task_run = TaskRun.find(params[:id])

    respond_to do |format|
      if @task_run.update_attributes(params[:tapir_task_run])
        format.html { redirect_to @task_run, notice: 'Task run was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_runs/1
  # DELETE /task_runs/1.json
  def destroy
    @task_run = TaskRun.find(params[:id])
    @task_run.destroy

    respond_to do |format|
      format.html { redirect_to task_runs_url }
      format.json { head :ok }
    end
  end
end
