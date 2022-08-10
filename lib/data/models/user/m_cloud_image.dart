// To parse this JSON data, do
//
//     final cloudImage = cloudImageFromJson(jsonString);

import 'dart:convert';

CloudImage cloudImageFromJson(String str) => CloudImage.fromJson(json.decode(str));

String cloudImageToJson(CloudImage data) => json.encode(data.toJson());

class CloudImage {
    CloudImage({
       required this.assetId,
       required this.publicId,
       required this.version,
        this.versionId,
        this.signature,
        this.width,
        this.height,
        this.format,
        this.resourceType,
        // this.createdAt,
        this.tags,
        this.bytes,
        this.type,
        this.etag,
        this.placeholder,
        this.url,
       required this.secureUrl,
        this.accessMode,
        this.originalFilename,
    });

    String assetId;
    String publicId;
    int? version;
    String ?versionId;
    String ?signature;
    int? width;
    int ?height;
    String? format;
    String ?resourceType;
    // DateTime? createdAt;
    List<dynamic> ?tags;
    int ?bytes;
    String ?type;
    String ?etag;
    bool ?placeholder;
    String ?url;
    String secureUrl;
    String ?accessMode;
    String ?originalFilename;

    factory CloudImage.fromJson(Map<String, dynamic> json) => CloudImage(
        assetId: json["asset_id"],
        publicId: json["public_id"],
        version: json["version"],
        versionId: json["version_id"],
        signature: json["signature"],
        width: json["width"],
        height: json["height"],
        format: json["format"],
        resourceType: json["resource_type"],
        // createdAt: DateTime.parse(json["created_at"]),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        bytes: json["bytes"],
        type: json["type"],
        etag: json["etag"],
        placeholder: json["placeholder"],
        url: json["url"],
        secureUrl: json["secure_url"],
        accessMode: json["access_mode"],
        originalFilename: json["original_filename"],
    );

    Map<String, dynamic> toJson() => {
        "asset_id": assetId,
        "public_id": publicId,
        "version": version,
        "version_id": versionId,
        "signature": signature,
        "width": width,
        "height": height,
        "format": format,
        "resource_type": resourceType,
       
        "bytes": bytes,
        "type": type,
        "etag": etag,
        "placeholder": placeholder,
        "url": url,
        "secure_url": secureUrl,
        "access_mode": accessMode,
        "original_filename": originalFilename,
    };
}
