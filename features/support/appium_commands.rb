def fill_in(el, text)
  wait_for_element_exist(el)
  case el['tipo_busca']
  when 'XPATH'
    element = $driver.find_element(:xpath, el['value'])
  when 'ID'
    element = $driver.find_element(:id, el['value'])
  when 'ACCESSIBILITY_ID'
    element = $driver.find_element(:accessibility_id, el['value'])
  when 'CLASS'
    element = $driver.find_element(:class, el['value'])
  end
  # element.clear
  element.send_keys text
  $logger.info("Preencheu o campo #{el} usando o tipo de busca #{el['tipo_busca']} com o valor #{text}")
end

def click(el)
  wait_for_element_exist(el)
  case el['tipo_busca']
  when 'XPATH'
    $driver.find_element(:xpath, el['value']).click
  when 'ID'
    $driver.find_element(:id, el['value']).click
  when "ACCESSIBILITY_ID"
    $driver.find_element(:accessibility_id, el['value']).click
  when 'CLASS'
    $driver.find_element(:class, el['value']).click
  end
  $logger.info('Clicou no botão ' + el['value'] + ' usando o tipo de busca ' + el['tipo_busca'])
end

def click_by_text(text)
  find_element(:xpath, "//*[contains(@text,\"#{text}\")]").click
end

def wait_for_element_exist(el)
  case el['tipo_busca']
  when 'XPATH'
    $wait.until {element_exists? el}
  when 'ID'
    $wait.until {element_exists? el}
  when "ACCESSIBILITY_ID"
    $wait.until {element_exists? el}
  when 'CLASS'
    $wait.until {element_exists? el}
  end
  $logger.info("Aguardou a existência do elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
end

def element_exists?(el)
  $logger.info("Verificando se existe o elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
  case el['tipo_busca']
  when 'XPATH'
    return $wait.until {find_elements(:xpath, el['value']).count > 0}
  when 'ID'
    return $wait.until {find_elements(:id, el['value']).count > 0}
  when 'ACCESSIBILITY_ID'
    return $wait.until {find_elements(:accessibility_id, el['value']).count > 0}
  when 'CLASS'
    return $wait.until {find_elements(:class, el['value']).count > 0}
  end
end

def check_element(el)
  case tipo_busca
  when "XPATH"
    wait_for_xpath_to_exist el
    element = $driver.find_element(:xpath, el)
  when "ID"
    wait_for_id_to_exist el
    element = $driver.find_element(:id, el)
  when "ACCESSIBILITY_ID"
    wait_for_accessibility_id_to_exist el
    element = $driver.find_element(:accessibility_id, el)
  when "CLASS"
    wait_for_class_to_exist el
    element = $driver.find_element(:class, el)
  end
end

def get_text(el)
  wait_for_element_exist(el)
  $logger.info('Está buscando o texto do elemento ' + el['value'] + ' usando o tipo de busca ' + el['tipo_busca'])
  case el['tipo_busca']
  when 'XPATH'
    return $driver.find_element(:xpath, el['value']).text
  when 'ID'
    return $driver.find_element(:id, el['value']).text
  when 'ACCESSIBILITY_ID'
    return $driver.find_element(:accessibility_id, el['value']).text
  when 'CLASS'
    return $driver.find_element(:class, el['value']).text
  end
end

def text_exists?(text)
  $driver.find_elements(:xpath, "//*[contains(@text,\"#{text}\")]").count > 0
end

def scroll_to(startX, startY, endX, endY, time)
  Appium::TouchAction.new.swipe(start_x: startX, start_y: startY, end_x: endX , end_y: endY, duration: time).perform
end
