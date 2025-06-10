class PodsController < ApplicationController
  before_action :set_pod, only: %i[ destroy ]

  # GET /pods or /pods.json
  def index
    @pods = Pod.all params[:namespace_id]
  end

  # DELETE /pods/1 or /pods/1.json
  def destroy
    @pod.destroy!

    respond_to do |format|
      format.html { redirect_to namespace_pods_path, status: :see_other, notice: "Pod #{@pod.id} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pod
      @pod = Pod.find(params[:namespace_id], params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pod_params
      params.fetch(:pod, {})
    end
end
