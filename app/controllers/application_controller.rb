class ApplicationController < ActionController::Base
    #adminでログインした場合の移行先ページ
    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
          admin_path
      else
          root_path
      end
    end

    #userでログインした場合の移行先ページ
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :user
          root_path
      elsif resource_or_scope == :admin
          new_admin_session_path
      else
          root_path
      end
    end
  
end
