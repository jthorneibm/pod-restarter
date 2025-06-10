class Namespace
    include ActiveModel::Model
    include Kubernetes

    def self.all
        kubernetes_client.api.resource('namespaces').list.map { |n| Namespace.new(n) }
    end
end
