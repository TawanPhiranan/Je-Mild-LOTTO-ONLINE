// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromJson(jsonString);

import 'dart:convert';

List<OrderResponse> orderResponseFromJson(String str) => List<OrderResponse>.from(json.decode(str).map((x) => OrderResponse.fromJson(x)));

String orderResponseToJson(List<OrderResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderResponse {
    String lottoNumber;

    OrderResponse({
        required this.lottoNumber,
    });

    factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        lottoNumber: json["lottoNumber"],
    );

    Map<String, dynamic> toJson() => {
        "lottoNumber": lottoNumber,
    };
}
