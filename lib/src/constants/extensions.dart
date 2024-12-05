extension ListWidget<T> on List<T> {
  void insertIf(bool conditional, int index, T item) {
    if (conditional) {
      insert(index, item);
    }
  }
}
