class SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opt = {})
    if resource.id.present?
      render json: resource, status: :ok
    else
      render json: { errors: "invalid tokens" }, status: :bad_request
    end
  end

  def respond_to_on_destroy
    head :no_content
  end
end
