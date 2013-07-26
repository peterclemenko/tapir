class TaskRunSet

  include Mongoid::Document
  include Mongoid::Timestamps

  include TenantAndProjectScoped

  def task_runs
    TaskRun.where(:task_run_set_id => self.id)
  end

end