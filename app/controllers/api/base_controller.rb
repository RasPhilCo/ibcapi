class Api::BaseController < ActionController::Base
  before_filter :cors_set_access_control_headers

  def options
    head :ok
  end

  private
    def cors_set_access_control_headers
          headers['Access-Control-Allow-Origin'] = '*'
          headers['Access-Control-Allow-Methods'] = 'POST, PUT, GET, OPTIONS'
          headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(',')
    end

    # def set_pagination(name, options = {})
    #   scope = instance_variable_get("@#{name}")
    #   request_params = request.query_parameters
    #   url_without_params = request.original_url.slice(0..(request.original_url.index("?")-1)) unless request_params.empty?
    #   url_without_params ||= request.original_url
   
    #   page = {}
    #   page[:first] = 1 if scope.total_pages > 1 && !scope.first_page?
    #   page[:last] = scope.total_pages  if scope.total_pages > 1 && !scope.last_page?
    #   page[:next] = scope.current_page + 1 unless scope.last_page?
    #   page[:prev] = scope.current_page - 1 unless scope.first_page?
   
    #   pagination_links = []
    #   page.each do |k,v|
    #     new_request_hash= request_params.merge({:page => v})
    #     pagination_links << "<#{url_without_params}?#{new_request_hash.to_param}>;rel=\"#{k}\">"
    #   end
    #   headers[:Link] = pagination_links.join(",")
    # end
end