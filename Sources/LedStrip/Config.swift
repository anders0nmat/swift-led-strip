
import CLedStrip

public enum LedPixelFormat: led_pixel_format_t {
	case GRB
	case GRBW

	public init?(rawValue: led_pixel_format_t) {
		switch rawValue {
			case LED_PIXEL_FORMAT_GRB: self = .GRB
			case LED_PIXEL_FORMAT_GRBW: self = .GRBW
			default: self = nil
		}
	}

	public var rawValue: led_pixel_format_t {
		return switch self {
			case .GRB: LED_PIXEL_FORMAT_GRB
			case .GRBW: LED_PIXEL_FORMAT_GRBW
		}
	}
}

public enum LedModel: led_model_t {
	case WS2812
	case SK6812

	public init?(rawValue: led_model_t) {
		switch rawValue {
			case LED_MODEL_WS2812: self = .WS2812
			case LED_MODEL_SK6812: self = .SK6812
			default: self = nil
		}
	}

	public var rawValue: led_model_t {
		return switch self {
			case .WS2812: LED_MODEL_WS2812
			case .SK6812: LED_MODEL_SK6812
		}
	}
}
