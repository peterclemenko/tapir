module EntitiesHelper

  ### TODO - There's probably a better way to do this
  ### even if it means using method_missing

  def entities_account_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_doc_file_path(id=nil)
    "/entities/#{id}"  
  end

  def entities_dns_record_path(id=nil)
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
  
  # Return the valid entity types
  def get_valid_type_class_names
    types = Entities::Base.descendants.map{|x| x.name.split("::").last}
  types.sort_by{ |t| t.downcase }
  end

  private  
    # Return the valid entity types
    def _get_valid_types
      types = Entities::Base.descendants
    end

end
