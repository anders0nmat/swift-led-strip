
public struct Color {
	var red: UInt32
	var green: UInt32
	var blue: UInt32

	public init(red: UInt32, green: UInt32, blue: UInt32) {
		self.red = red
		self.green = green
		self.blue = blue
	}

	public static let white = Self(red: 255, green: 255, blue: 255)
	public static let gray = Self(red: 128, green: 128, blue: 128)
	public static let black = Self(red: 0, green: 0, blue: 0)

	public static let red = Self(red: 255, green: 0, blue: 0)
	public static let yellow = Self(red: 255, green: 255, blue: 0)
	public static let green = Self(red: 0, green: 255, blue: 0)
	public static let cyan = Self(red: 0, green: 255, blue: 255)
	public static let blue = Self(red: 0, green: 0, blue: 255)
	public static let purple = Self(red: 255, green: 0, blue: 255)
}
