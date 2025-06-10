module Kubernetes
    extend ActiveSupport::Concern

    class_methods do
        def kubernetes_client
            K8s::Client.config(
                K8s::Config.new(YAML.safe_load(`kubectl config view --minify --raw=true`)),
                ssl_verify_peer: false
            )
        end
    end

    included do
        attr_accessor :resource
        delegate :metadata, :spec, :status, to: :resource
        delegate :kubernetes_client, to: :class

        def initialize(resource)
            @resource = resource
        end

        def id
            @resource.metadata.name
        end
    end
end