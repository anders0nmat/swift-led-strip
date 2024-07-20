
import CLedStrip

public enum LedPixelFormat: UInt32 {
	case GRB
	case GRBW

	public init?(rawValue: UInt32) {
		switch rawValue {
			case LED_PIXEL_FORMAT_GRB: self = .GRB
			case LED_PIXEL_FORMAT_GRBW: self = .GRBW
			default: self = nil
		}
	}

	public var rawValue: UInt32 {
		return switch self {
			case .GRB: LED_PIXEL_FORMAT_GRB
			case .GRBW: LED_PIXEL_FORMAT_GRBW
		}
	}
}

public enum LedModel: UInt32 {
	case WS2812
	case SK6812

	public init?(rawValue: UInt32) {
		switch rawValue {
			case LED_MODEL_WS2812: self = .WS2812
			case LED_MODEL_SK6812: self = .SK6812
			default: self = nil
		}
	}

	public var rawValue: UInt32 {
		return switch self {
			case .WS2812: LED_MODEL_WS2812
			case .SK6812: LED_MODEL_SK6812
		}
	}
}
