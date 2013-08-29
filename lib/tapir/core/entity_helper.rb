module Entities
module EntityHelper

  def to_s
    "#{self.class} #{self.name}"
  end
  
  def entity_type
    self.class.to_s.downcase.split("::").last
  end

  #
  # This method lets you query the available tasks for this entity type
  #
  def tasks
    TapirLogger.instance.log "Getting tasks for #{self}"
    tasks = TaskManager.instance.get_tasks_for(self)
  tasks.sort_by{ |t| t.name.downcase }
  end

  #
  # This method lets you run a task on this entity
  #
  def run_task(task_name, task_run_set_id, options={})
    TapirLogger.instance.log "Asking task manager to queue task #{task_name} run on #{self} with options: #{options} - part of taskrun set: #{task_run_set_id}"
    TaskManager.instance.queue_task_run(task_name, task_run_set_id, self, options)
  end

  #
  # This method lets you find all available children
  #
  def children
    TapirLogger.instance.log "Finding children for #{self}"
    EntityManager.instance.find_children(self.id, self.class.to_s)
  end

  #
  # This method lets you find all available children, but doesn't check to see if they actually exist.
  #
  def nocheck_children
    TapirLogger.instance.log "Finding unsafe children for #{self}"
    EntityMapping.where(:parent_id => id)
  end

  #
  # This method lets you find all available parents
  #
  def parents
    TapirLogger.instance.log "Finding parents for #{self}"
    EntityManager.instance.find_parents(self.id, self.class.to_s)
  end

  #
  # This method lets you find all available parents
  #
  def parent_tasks
    TapirLogger.instance.log "Finding task runs for #{self}"
    EntityManager.instance.find_task_runs(self.id, self.class.to_s)
  end

  def task_runs
    TapirLogger.instance.log "Finding task runs for #{self}"
    EntityManager.instance.find_task_runs(self.id, self.class.to_s)
  end

  #
  # This method associates a child with this entity
  #
  def associate_child(params)
    # Pull out the relevant parameters
    new_entity = params[:child]
    task_run = params[:task_run]
        
    # And set us up as a parent through an entity_mapping
    # new_entity._map_parent(params)
    
     # And associate the entity as a child through an entity mapping
    TapirLogger.instance.log "Associating #{self} with child entity #{new_entity}"
    _map_child(params)
  end

  def _map_child(params)
    TapirLogger.instance.log "Creating new child mapping #{self} => #{params[:child]}"

    # Create a new entity mapping, unless they happen to be the same object (is that possible?)
    EntityMapping.create(
      :parent_id => self.id,
      :parent_type => self.class.to_s,
      :child_id => params[:child].id,
      :child_type => params[:child].class.to_s,
      :task_run_id => params[:task_run].id || nil) unless self.id == params[:child].id
  end

end
end
