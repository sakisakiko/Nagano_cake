Rails.application.routes.draw do
    
  scope module: :public do
       root to:"homes#top"
       get '/about'=>'homes#about',as: 'about'
       resources:items,only:[:index,:show]
       
       resources:cart_items,only:[:create,:index,:update,:destroy]
       delete '/cart_items/destroy_all'=>'cart_items#destroy_all',as: 'destroy_all'
       
       resources:orders,only:[:create,:new,:index,:show]
       post '/orders/confirm'=>'orders#confirm',as: 'confirm'
       get '/orders/complete'=>'orders#complete',as: 'complete'
       
       
       resources:addresses,only:[:index,:edit,:create,:update,:destroy]
       
      
       get '/customers/my_page'=>'customers#show',as: 'my_page'
       get '/customers/information/edit'=>'customers#edit',as: 'information_edit'
       patch '/customers/information'=>'customers#update',as: 'information'
       get '/customers/unsubscribe'=>'customers#unsubscribe',as: 'unsubscribe'
       patch '/customers/withdraw'=>'customers#withdraw',as: 'withdraw'
  end
  
  namespace :admin do
    get '/'=>'homes#top', as: 'top'
    resources:customers,only:[:index,:show,:edit,:update]
    resources:genres,only:[:create,:index,:edit,:update]
    resources:items,only:[:new,:create,:index,:show,:edit,:update]
    
    resources:orders,only:[:show,:update] do
     resources:order_details,only:[:update]
    end
    
  end
 
  #顧客用
  #URL/customers/sign_in...
  devise_for :customers,skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #管理者用
  # URL/admin/sign_in...
  devise_for:admin,skip: [:registrations,:passwords],controllers: {
    sessions: "admin/sessions"
  }
  
end
