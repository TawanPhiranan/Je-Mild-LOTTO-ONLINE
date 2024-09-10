// models.dart
class MatchResult {
  final String drawnNumber;
  final double prizeMoney;

  MatchResult({
    required this.drawnNumber,
    required this.prizeMoney,
  });

  // จาก Map เป็น MatchResult
  factory MatchResult.fromMap(Map<String, dynamic> map) {
    return MatchResult(
      drawnNumber: map['drawnNumber'] as String,
      prizeMoney: map['prizeMoney'] as double,
    );
  }

  // จาก MatchResult เป็น Map
  Map<String, dynamic> toMap() {
    return {
      'drawnNumber': drawnNumber,
      'prizeMoney': prizeMoney,
    };
  }
}
