Rails.application.routes.draw do
get("/", { :controller => "inputs", :action => "index"})
  # Routes for the Input resource:

  # CREATE
  post("/insert_input", { :controller => "inputs", :action => "create" })
          
  # READ
  get("/inputs", { :controller => "inputs", :action => "index" })
  
  get("/inputs/:path_id", { :controller => "inputs", :action => "show" })
  
  # UPDATE
  
  post("/modify_input/:path_id", { :controller => "inputs", :action => "update" })
  
  # DELETE
  get("/delete_input/:path_id", { :controller => "inputs", :action => "destroy" })

  #------------------------------

  # Routes for the Email resource:

  # CREATE
  post("/insert_email", { :controller => "emails", :action => "create" })
          
  # READ
  get("/emails", { :controller => "emails", :action => "index" })
  
  get("/emails/:path_id", { :controller => "emails", :action => "show" })
  
  # UPDATE
  
  post("/modify_email/:path_id", { :controller => "emails", :action => "update" })
  
  # DELETE
  get("/delete_email/:path_id", { :controller => "emails", :action => "destroy" })

  #------------------------------

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
