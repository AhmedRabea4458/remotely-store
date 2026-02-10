class ApiError {
  final String message;
  final int? status;
  ApiError({required this.message, this.status});
  @override
  String toString() {
    return "$message";
  }
}
