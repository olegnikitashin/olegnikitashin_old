module ApplicationHelper
  def login_helper(klass = '')
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

  def source_helper(layout_name = '')
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you're on the #{layout_name} page!"
      content_tag(:p, greeting, class: 'source-greeting')
    end
  end

  def copyright
    "&copy; #{Time.now.year} | <b>Oleg Nikitashin</b> All rights reserved".html_safe
  end

  def active?(link_path)
    'active' if current_page? link_path
  end

  def nav_items
    [
        {
            url:   root_path,
            title: 'Home'
        },
        {
            url:   about_me_path,
            title: 'About Me'
        },
        {
            url:   contact_path,
            title: 'Contact'
        },
        {
            url:   blogs_path,
            title: 'Blog'
        },
        {
            url:   portfolios_path,
            title: 'Portfolio'
        },
        {
            url:   tech_news_path,
            title: 'Tech News'
        }
    ]
  end

  def nav_helper(klass, tag_type)
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{klass} #{active?(item[:url])}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def errors_to_flash(object)
    flash_messages = []
    object.errors.full_messages.each do |error|
      text = "<script>toastr.error(\"#{error}\");</script>"
      flash_messages << text.html_safe if error
    end
    flash_messages.join("\n").html_safe
  end
end