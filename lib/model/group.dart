class Group {
  String _name;
  String? _id;

  //<editor-fold desc="Data Methods">

  Group({
    required String name,
    required String? id,
  })  : _name = name,
        _id = id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group &&
          runtimeType == other.runtimeType &&
          _name == other._name &&
          _id == other._id);

  @override
  int get hashCode => _name.hashCode ^ _id.hashCode;

  @override
  String toString() {
    return 'Group{' + ' name: $_name,' + ' id: $_id,' + '}';
  }

  Group copyWith({
    String? name,
    String? id,
  }) {
    return Group(
      name: name ?? this._name,
      id: id ?? this._id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this._name, // leave id out
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      name: map['name'] as String,
      id: map['id'] as String?,
    );
  }

  String? get id => _id;
  String get name => _name;

//</editor-fold>
}