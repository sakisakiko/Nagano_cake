class ApplicationController < ActionController::Base
  
  private
  
  #会員登録後遷移先：マイページ
  def after_sign_up_path_for(resource)
       root_path
  end
  
  # ログイン後遷移先
   # 管理者側：管理者トップページ
   # 会員側：トップページ
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a(Admin)
        admin_top_path  
    else
        root_path
    end
  end
  
  # ログアウト後遷移先
   # 管理者側：管理者ログインページ
   # 会員側：トップページ
  
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope.is_a(Admin)
        admin_session_path  
    else
        root_path
    end
  end

end
