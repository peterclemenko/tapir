class TaskRunSet

  include Mongoid::Document
  include Mongoid::Timestamps
  include TenantAndProjectScoped

  field :num_tasks, type: Integer

  def task_runs
    TaskRun.where(:task_run_set_id => self.id)
  end

end