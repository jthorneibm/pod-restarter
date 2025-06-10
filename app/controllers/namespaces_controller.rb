class NamespacesController < ApplicationController
  # GET /namespaces or /namespaces.json
  def index
    @namespaces = Namespace.all
  end
end
