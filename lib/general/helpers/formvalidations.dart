class FormFieldValidators {
  /// 🔹 Required field
  static String? required(String? value, {String fieldName = 'This field'}) {
      if (value == null || value.trim().isEmpty) {
        return '$fieldName is required';
      }
    return null;
  }

  /// 🔹 Email validation
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email address';
    return null;
  }

  /// 🔹 Phone number validation (10 digits)
  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value)) return 'Enter a valid 10-digit number';
    return null;
  }

  /// 🔹 Username validation
  static String? username(String? value) {
    if (value == null || value.trim().isEmpty) return 'Username is required';
    if (value.length < 3) return 'Username must be at least 3 characters';
    final regex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!regex.hasMatch(value)) {
      return 'Only letters, numbers and underscores are allowed';
    }
    return null;
  }

  /// 🔹 Number / integer validation
  static String? number(String? value, {String fieldName = 'Value'}) {
    if (value == null || value.trim().isEmpty) return '$fieldName is required';
    if (double.tryParse(value) == null) return 'Enter a valid number';
    return null;
  }

  /// 🔹 Price validation (must be > 0)
  static String? price(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter price';
    final parsed = double.tryParse(value);
    if (parsed == null) return 'Enter valid number';
    if (parsed <= 0) return 'Price must be greater than 0';
    return null;
  }

  static String? offerPrice(String? value, double regularPrice) {
    if (value == null || value.trim().isEmpty) return 'Enter offer price';
    final parsed = double.tryParse(value);
    if (parsed == null) return 'Enter valid number';
    if (parsed <= 0) return 'Offer price must be greater than 0';
    if (parsed >= regularPrice) return 'Offer price must be less than regular price';
    return null;
  }

  /// 🔹 Password validation (strong password)
  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';

    // At least one uppercase, one lowercase, one digit, one special char
    final regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$',
    );
    if (!regex.hasMatch(value)) {
      return 'Password must include uppercase, lowercase, number & symbol';
    }
    return null;
  }

  /// 🔹 Confirm password validation
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return 'Confirm your password';
    if (value != password) return 'Passwords do not match';
    return null;
  }

  /// 🔹 Minimum length validation
  static String? minLength(
    String? value,
    int length, {
    String fieldName = 'Field',
  }) {
    if (value == null || value.isEmpty) return '$fieldName is required';
    if (value.length < length) {
      return '$fieldName must be at least $length characters';
    }
    return null;
  }

  /// 🔹 Maximum length validation
  static String? maxLength(
    String? value,
    int length, {
    String fieldName = 'Field',
  }) {
    if (value != null && value.length > length) {
      return '$fieldName must be less than $length characters';
    }
    return null;
  }

  /// 🔹 Date validation
  static String? date(String? value) {
    if (value == null || value.trim().isEmpty) return 'Date is required';
    try {
      DateTime.parse(value);
      return null;
    } catch (_) {
      return 'Enter a valid date (YYYY-MM-DD)';
    }
  }

  /// 🔹 URL validation
  static String? url(String? value) {
    if (value == null || value.isEmpty) return 'URL is required';
    final urlRegex = RegExp(
      r'^(https?:\/\/)?([\w-]+(\.[\w-]+)+)([\/\w .-]*)*\/?$',
    );
    if (!urlRegex.hasMatch(value)) return 'Enter a valid URL';
    return null;
  }

  /// 🔹 Pin Code / ZIP validation (6 digits)
  static String? pinCode(String? value) {
    if (value == null || value.isEmpty) return 'PIN code is required';
    final pinRegex = RegExp(r'^[0-9]{6}$');
    if (!pinRegex.hasMatch(value)) return 'Enter a valid 6-digit PIN code';
    return null;
  }

  /// 🔹 Custom regex validator
  static String? custom(String? value, RegExp pattern, String message) {
    if (value == null || value.isEmpty) return message;
    if (!pattern.hasMatch(value)) return message;
    return null;
  }
}