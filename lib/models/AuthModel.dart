// To parse this JSON data, do
//
//     final authJson = authJsonFromJson(jsonString);

import 'dart:convert';

AuthJson authJsonFromJson(String str) => AuthJson.fromJson(json.decode(str));

String authJsonToJson(AuthJson data) => json.encode(data.toJson());

class AuthJson {
    int code;
    dynamic message;
    Payload payload;
    dynamic exceptionClass;

    AuthJson({
        required this.code,
        this.message,
        required this.payload,
        this.exceptionClass,
    });

    factory AuthJson.fromJson(Map<String, dynamic> json) => AuthJson(
        code: json["code"],
        message: json["message"],
        payload: Payload.fromJson(json["payload"]),
        exceptionClass: json["exception_class"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "payload": payload.toJson(),
        "exception_class": exceptionClass,
    };
}

class Payload {
    String accessToken;
    String refreshToken;
    int exp;

    Payload({
        required this.accessToken,
        required this.refreshToken,
        required this.exp,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        exp: json["exp"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "exp": exp,
    };
}
