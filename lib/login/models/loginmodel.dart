// To parse required this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.data,
        required this.tokenDetails,
        required this.message,
    });

    Data data;
    TokenDetails tokenDetails;
    String message;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: Data.fromJson(json["data"]),
        tokenDetails: TokenDetails.fromJson(json["tokenDetails"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "tokenDetails": tokenDetails.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        required this.userId,
        required this.fullName,
        required this.email,
        required this.profilePhoto,
        required this.stripeUserId,
        required this.location,
        required this.isActive,
        required this.category,
        required this.role,
    });

    String userId;
    String fullName;
    String email;
    dynamic profilePhoto;
    dynamic stripeUserId;
    Location? location;
    bool? isActive;
    dynamic category;
    String? role;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        fullName: json["fullName"],
        email: json["email"],
        profilePhoto: json["profilePhoto"],
        stripeUserId: json["stripeUserId"],
        location: Location.fromJson(json["location"]),
        isActive: json["isActive"],
        category: json["category"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "email": email,
        "profilePhoto": profilePhoto,
        "stripeUserId": stripeUserId,
        "location": location == null  ? "null": location!.toJson() ,
        "isActive": isActive,
        "category": category,
        "role": role,
    };
}

class Location {
    Location({
        required this.type,
        required this.coordinates,
    });

    String type;
    List<double> coordinates;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

class TokenDetails {
    TokenDetails({
        required this.accessToken,
        required this.refreshToken,
    });

    String accessToken;
    String refreshToken;

    factory TokenDetails.fromJson(Map<String, dynamic> json) => TokenDetails(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };
}
