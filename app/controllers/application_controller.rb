class ApplicationController < ActionController::Base
    after_action  :store_location

    def store_location
        if (request.fullpath != "/users/sign_in" &&
            request.fullpath != "/users/sign_up" &&
            request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
            !request.xhr?) # don't store ajax calls
            session[:previous_url] = request.fullpath 
        end
    end

    def after_sign_up_path_for(resource)
        root_path
    end

    def after_sign_in_path_for(resource)
        logger.debug "sign_in_for呼ばれた"
        #if (session[:previous_url] == root_path)
         # super
        #else
        session[:previous_url] || root_path
        #end
    end

    def after_sign_out_path_for(resource)
        #logger.debug "sign_out_for呼ばれた"
        #if (session[:previous_url] == root_path)
        #  super
        #else
        session[:previous_url] || root_path
        #end
    end
end
