module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to 'Log Out', destroy_user_session_path, method: :delete
    else
      (link_to 'Log In', new_user_session_path) +
      '<br>'.html_safe +
      (link_to 'Register', new_user_registration_path)
    end
  end

  def content_helper
    content_tag(:div, "Hi! I'm a paragraph tag!", class: 'my-special')
  end

  def source_helper
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}!"
      content_tag(:p, greeting, class: 'source-greeting')
    end
  end

  def copyright
    "&copy; #{Time.now.year} | <b>Oleg Nikitashin</b>".html_safe
  end
end
