module TestTakersHelper
  def message(percentage_of_passing)
    text = if percentage_of_passing >= 85
             "<p style='color:Green'>#{percentage_of_passing}% </p><p>Тест пройден</p>"
           else
             "<p style='color:Red'>#{percentage_of_passing}% </p><p>Тест не пройден</p>"
           end
    text.html_safe
  end
end
