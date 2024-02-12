class State {
  final String? name;
  final String? id;

  State({
    this.name,
    this.id,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
