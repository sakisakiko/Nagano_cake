Rails.application.routes.draw do
  
   root to:"public/homes#top"
   get '/about'=>'public/homes#about',as: 'about'
   resources:items,only:[:index,:show]
   
   resources:cart_items,only:[:create,:index,:update,:destroy]
   delete '/cart_items/destroy_all'=>'public/cart_items#destroy_all',as: 'destroy_all'
   
   resources:orders,only:[:create,:new,:index,:show]
   post '/orders/confirm'=>'public/orders#confirm',as: 'confirm'
   get '/orders/complete'=>'public/orders#complete',as: 'complete'
   
   
   resources:addresses,only:[:index,:edit,:create,:update,:destroy]
   
  
   get '/customers/my_page'=>'public/customers#show',as: 'my_page'
   get '/customers/information/edit'=>'public/customers#edit',as: 'information_edit'
   patch '/customers/information'=>'public/customers#update',as: 'information'
   get '/customers/unsubscribe'=>'public/customers#unsubscribe',as: 'unsubscribe'
   patch '/customers/withdraw'=>'public/customers#withdraw',as: 'withdraw'
   
   
  
  
  namespace :admin do
    get '/admin'=>'admin/homes#top', as: 'admin_top'
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
