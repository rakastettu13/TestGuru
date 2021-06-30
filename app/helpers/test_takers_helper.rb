module TestTakersHelper
  def message(test_taker)
    text = if test_taker.successful?
             "<p style='color:Green'>#{test_taker.percentage_of_passing}% </p><p>Тест пройден</p>"
           else
             "<p style='color:Red'>#{test_taker.percentage_of_passing}% </p><p>Тест не пройден</p>"
           end
    text.html_safe
  end
end
