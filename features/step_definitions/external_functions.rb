def take_screenshot(text = 'screenshot')
  time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
  @browser.screenshot.save "./screenshots/#{text}_#{time}.png"
end
