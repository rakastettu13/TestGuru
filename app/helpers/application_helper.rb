module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to(repo, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow noopener')
  end

  def flash_message(method)
    tag.p(flash[method], class: 'method') if flash[method]
  end

  def user_links
    if logged_in?
      tag.b("Welcome, #{current_user.name} Guru!") +
        link_to('Выйти',
                logout_path,
                method: :delete,
                data: { confirm: 'Вы уверенны, что хотите выйти?' })
    else
      link_to('Войти', login_path) +
        link_to('Зарегистрироваться', signup_path)
    end
  end
end
