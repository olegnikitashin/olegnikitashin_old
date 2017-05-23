module ApplicationHelper
  def login_helper(klass)
    if current_user.is_a?(GuestUser)
      (link_to 'Log In', new_user_session_path, class: klass) +
          ' '.html_safe +
      (link_to 'Register', new_user_registration_path, class: klass)
    else
      link_to 'Log Out', destroy_user_session_path, method: :delete, class: klass
    end
  end

  def content_helper
    content_tag(:div, "Hi! I'm a paragraph tag!", class: 'my-special')
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you're on the #{layout_name} page!"
      content_tag(:p, greeting, class: 'source-greeting')
    end
  end

  def copyright
    "&copy; #{Time.now.year} | <b>Oleg Nikitashin</b> All rights reserved".html_safe
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
