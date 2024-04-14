class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.is_a?(Psychologist)
      evaluatees_path
    else
      new_psychologist_session_path
    end
  end
end
