class HttpLogger {
  final String tag;
  final String message;
  HttpLogger(this.tag, this.message) {
    print('$tag: $message');
  }
}
