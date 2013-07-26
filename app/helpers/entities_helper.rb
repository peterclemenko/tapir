module EntitiesHelper

  ### TODO - There's probably a better way to do this
  ### even if it means using method_missing

  #def entities_path
  #  "/entities"
  #end

  # We currently handle invalid entities via this helper. If an entity has 
  # been deleted, simply return a blank string. It's not ideal, but should 
  # do the trick for now.
  #def entity_path(entity=nil,whatever=nil)
  #  if entity
  #    url_for entity #, entity.id #/entities/#{entity._id}"
  #  else
  #    "{deleted}"
  #  end
  #end

  def entities_account_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_doc_file_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_domain_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_email_address_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_finding_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_facebook_account_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_host_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_image_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_klout_account_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_linkedin_account_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_net_block_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_net_svc_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_note_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_organization_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_parsable_file_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_pdf_file_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_physical_location_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_search_result_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_search_string_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_person_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_twitter_account_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_username_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_web_application_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_web_page_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_web_form_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_xls_file_path(id=nil)
    "/entities/#{id}"  
  end


end
