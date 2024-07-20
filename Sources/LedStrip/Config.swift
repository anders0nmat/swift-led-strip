
import CLedStrip

public enum LedPixelFormat {
	case GRB
	case GRBW

	internal var value: led_pixel_format_t {
		return switch self {
			case .GRB: LED_PIXEL_FORMAT_GRB
			case .GRBW: LED_PIXEL_FORMAT_GRBW
		}
	}
}

public enum LedModel {
	case WS2812
	case SK6812

	internal var value: led_model_t {
		return switch self {
			case .WS2812: LED_MODEL_WS2812
			case .SK6812: LED_MODEL_SK6812
		}
	}
}
