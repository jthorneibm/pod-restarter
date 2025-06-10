class Pod
    include ActiveModel::Model
    include Kubernetes

    def self.all(namespace)
        kubernetes_client.api('v1').resource('pods', namespace: namespace).list.map do |pod|
            Pod.new pod
        end
    end

    def self.find(namespace, name)
        Pod.new kubernetes_client.api('v1').resource('pods', namespace: namespace).get(name)
    end

    def save
        kubernetes_client.api('v1').resource('pods', namespace: metadata.namespace).update_resource(@resource)
    end

    def destroy!
        kubernetes_client.api('v1').resource('pods', namespace: metadata.namespace).delete(metadata.name)
    end
end
