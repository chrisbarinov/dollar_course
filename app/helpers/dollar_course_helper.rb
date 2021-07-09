module DollarCourseHelper

  def parse_site(url, selector)
    require 'open-uri'
    html = open(url)
    doc = Nokogiri::HTML(html)
    return doc.css(selector)[0].text.strip
  end

  def get_dollar_course
    #ищем модель c курсом доллара
    begin
      dollar_course = DollarCustomization.find(1)
      #извлекаем ее время и проверяем, действителен ли еще курс доллара, указанный в модели
      if Time.now <= dollar_course[:active_to]
        course = '1$ = ' + dollar_course[:course].to_s + ' ₽'
      #если нет, то парсим сайт
      else
        course = '1$ = ' + parse_site('https://www.cbr.ru/', '.mono-num')
      end
    #если модели нет, парсим сайт
    rescue ActiveRecord::RecordNotFound
      course = '1$ = ' + parse_site('https://www.cbr.ru/', '.mono-num')
    end

    return course
  end
end
