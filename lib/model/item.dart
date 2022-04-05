class Item {
  String _description;
  bool _completed;
  String? _id;

  //<editor-fold desc="Data Methods">

  Item({
    required String description,
    required bool completed,
    String? id,
  })  : _description = description,
        _completed = completed,
        _id = id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          runtimeType == other.runtimeType &&
          _description == other._description &&
          _completed == other._completed &&
          _id == other._id);

  @override
  int get hashCode =>
      _description.hashCode ^ _completed.hashCode ^ _id.hashCode;

  @override
  String toString() {
    return 'Item{' +
        ' description: $_description,' +
        ' completed: $_completed,' +
        ' id: $_id,' +
        '}';
  }

  Item copyWith({
    String? description,
    bool? completed,
    String? id,
  }) {
    return Item(
      description: description ?? this._description,
      completed: completed ?? this._completed,
      id: id ?? this._id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': this._description,
      'completed': this._completed, // leave id out
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      description: map['description'] as String,
      completed: map['completed'] as bool,
      id: map['id'] as String?,
    );
  }

  bool get completed => _completed;

  String? get id => _id;

  String get description => _description;

//</editor-fold>
}