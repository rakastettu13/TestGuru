module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to(repo, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow noopener')
  end

  def user_links
    if user_signed_in?
      tag.b("Welcome, #{current_user.name} Guru!") +
        link_to('Бейджи', badges_path) +
        link_to('Выйти',
                destroy_user_session_path,
                method: :delete,
                data: { confirm: 'Вы уверенны, что хотите выйти?' })
    else
      link_to('Войти', new_user_session_path) +
        link_to('Зарегистрироваться', new_user_registration_path)
    end
  end
end
