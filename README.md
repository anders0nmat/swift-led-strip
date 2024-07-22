# swift-led-strip

A swift wrapper for [espressif/led_strip](https://components.espressif.com/components/espressif/led_strip)

## Usage

Add the following package to your `Package.swift` dependencies
```swift
.package(url: "https://github.com/anders0nmat/swift-led-strip.git", branch: "main"),
```

Add the following dependency to your `idf_component.yml`
```yml
espressif/led_strip: "^2.4.1"
```

Add the dependency to your target
```swift
.product(name: "LedStrip", package: "swift-led-strip"),
```

Import the package into your module
```swift
import LedStrip
```

## Example Usage

Blink every 500ms in a random color.

`esp_main.swift`:
```swift
import LedStrip

// used for vTaskDelay()
// For more information
// See https://github.com/anders0nmat/swift-embedded-pm?tab=readme-ov-file#interfacing-esp-idf
import CFreeRTOS

@_cdecl("app_main")
func app_main() {
  let strip = LedStrip(pin: 8, ledCount: 1)

  var is_on = false
  while true {
    is_on.toggle()
    switch is_on {
      case true:
        strip.setPixel(at: 0, to: Color(
          red: (0..<64).randomElement()!,
          green: (0..<64).randomElement()!,
          blue: (0..<64).randomElement()!))
      case false:
        strip.clear()
    }
    strip.refresh()

    vTaskDelay(500 / freeRTOS_Tick_Period)
  }
}
```


