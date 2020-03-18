class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  protect_from_forgery with: :null_session

  def execute
    # query variables
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]

    # auth
    user = User.where(token: params[:device_id]).first
    if(user == nil) 
      user = User.create!(token: params[:device_id], gems: 50, email: "")
    end
    context = {
      user: user,
      exercise_muscle_loader: Dataloader.new do |ids|
        # take array of exercise ids
        # get array of muscle ids 
        #call muscle loader with your array of muscle ids
        # return muscles
      end,
      muscle_loader: Dataloader.new do |ids|
        Muscle.find(*ids)
      end,
      equipment_loader: Dataloader.new do |ids|
        Equipment.find(*ids)
      end
    }
    
    # execute
    result = SampleSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
