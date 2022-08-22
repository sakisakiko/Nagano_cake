class ApplicationController < ActionController::Base
 
    def after_sign_in_path_for(resource)
      # 後で修正
      about_path
    end

end
