class SharedNotInitializeException implements Exception {
  @override
  String toString() {
    return 'Your preferences has not initalized right now';
  }
}
