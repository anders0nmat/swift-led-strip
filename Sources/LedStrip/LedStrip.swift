
import CLedStrip

public final class LedStrip {
	public enum SignalSource {
		case rmt
		case spi
	}

	private var handle: led_strip_handle_t

	public init(
	pin: Int32,
	ledCount count: UInt32,
	pixelFormat: LedPixelFormat = .GRB,
	model: LedModel = .WS2812,
	signalSource: SignalSource = .rmt,
	invertOutput: Bool = false,
	useDMA: Bool = false) {
		var handle = led_strip_handle_t(bitPattern: 0)

		var config = led_strip_config_t(
			strip_gpio_num: pin,
			max_leds: count,
			led_pixel_format: pixelFormat.value,
			led_model: model.value,
			flags: .init(
				invert_out: invertOutput ? 1 : 0)
		)

		switch signalSource {
		case .rmt:
			var rmt_config = led_strip_rmt_config_t(
				clk_src: RMT_CLK_SRC_DEFAULT,
				resolution_hz: 10_000_000,
				mem_block_symbols: 0, // Use default
				flags: .init(
					with_dma: useDMA ? 1 : 0
				)
			)

			guard led_strip_new_rmt_device(&config, &rmt_config, &handle) == ESP_OK else {
				fatalError("Error creating RMT device")
			}
		case .spi:
			var spi_config = led_strip_spi_config_t(
				clk_src: SPI_CLK_SRC_DEFAULT,
				spi_bus: SPI2_HOST,
				flags: .init(
					with_dma: useDMA ? 1 : 0
				)
			)

			guard led_strip_new_spi_device(&config, &spi_config, &handle) == ESP_OK else {
				fatalError("Error creating SPI device")
			}
		}
		guard let handle else {
			fatalError("Error creating LED handle")
		}
		self.handle = handle
	}

	deinit {
		led_strip_del(handle)
	}

	public func clear() { led_strip_clear(handle) }
	public func refresh() { led_strip_refresh(handle) }

	public func setPixel(at index: UInt32, to color: Color) {
		led_strip_set_pixel(handle, index, color.red, color.green, color.blue)
	}
}
