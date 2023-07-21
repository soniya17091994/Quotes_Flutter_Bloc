// To parse this JSON data, do
//
//     final imageDataModel = imageDataModelFromJson(jsonString);

import 'dart:convert';

ImageDataModel imageDataModelFromJson(String str) =>
    ImageDataModel.fromJson(json.decode(str));

String imageDataModelToJson(ImageDataModel data) => json.encode(data.toJson());

class ImageDataModel {
  int total;
  int totalPages;
  List<Result> results;

  ImageDataModel({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory ImageDataModel.fromJson(Map<String, dynamic> json) => ImageDataModel(
        total: json["total"],
        totalPages: json["total_pages"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String id;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String altDescription;
  List<Breadcrumb> breadcrumbs;
  Urls urls;
  ResultLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  Sponsorship? sponsorship;
  ResultTopicSubmissions topicSubmissions;
  User user;
  List<Tag> tags;

  Result({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    required this.altDescription,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    this.sponsorship,
    required this.topicSubmissions,
    required this.user,
    required this.tags,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: List<Breadcrumb>.from(
            json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
        urls: Urls.fromJson(json["urls"]),
        links: ResultLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"] == null
            ? null
            : Sponsorship.fromJson(json["sponsorship"]),
        topicSubmissions:
            ResultTopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x.toJson())),
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship?.toJson(),
        "topic_submissions": topicSubmissions.toJson(),
        "user": user.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
      };
}

class Breadcrumb {
  String slug;
  String title;
  int index;
  TypeEnum type;

  Breadcrumb({
    required this.slug,
    required this.title,
    required this.index,
    required this.type,
  });

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        slug: json["slug"],
        title: json["title"],
        index: json["index"],
        type: typeEnumValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
        "index": index,
        "type": typeEnumValues.reverse[type],
      };
}

enum TypeEnum { LANDING_PAGE, SEARCH }

final typeEnumValues = EnumValues(
    {"landing_page": TypeEnum.LANDING_PAGE, "search": TypeEnum.SEARCH});

class ResultLinks {
  String self;
  String html;
  String download;
  String downloadLocation;

  ResultLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Sponsorship {
  List<String> impressionUrls;
  String tagline;
  String taglineUrl;
  User sponsor;

  Sponsorship({
    required this.impressionUrls,
    required this.tagline,
    required this.taglineUrl,
    required this.sponsor,
  });

  factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
        impressionUrls:
            List<String>.from(json["impression_urls"].map((x) => x)),
        tagline: json["tagline"],
        taglineUrl: json["tagline_url"],
        sponsor: User.fromJson(json["sponsor"]),
      );

  Map<String, dynamic> toJson() => {
        "impression_urls": List<dynamic>.from(impressionUrls.map((x) => x)),
        "tagline": tagline,
        "tagline_url": taglineUrl,
        "sponsor": sponsor.toJson(),
      };
}

class User {
  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks links;
  ProfileImage profileImage;
  String? instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  bool acceptedTos;
  bool forHire;
  Social social;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    required this.links,
    required this.profileImage,
    this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toJson(),
      };
}

class UserLinks {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
      };
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
      );

  Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
      };
}

class Tag {
  TypeEnum type;
  String title;
  Source? source;

  Tag({
    required this.type,
    required this.title,
    this.source,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        type: typeEnumValues.map[json["type"]]!,
        title: json["title"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "type": typeEnumValues.reverse[type],
        "title": title,
        "source": source?.toJson(),
      };
}

class Source {
  Ancestry ancestry;
  String title;
  String subtitle;
  String description;
  String metaTitle;
  String metaDescription;
  CoverPhoto coverPhoto;

  Source({
    required this.ancestry,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.coverPhoto,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        ancestry: Ancestry.fromJson(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: CoverPhoto.fromJson(json["cover_photo"]),
      );

  Map<String, dynamic> toJson() => {
        "ancestry": ancestry.toJson(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto.toJson(),
      };
}

class Ancestry {
  TypeClass type;
  TypeClass? category;
  TypeClass? subcategory;

  Ancestry({
    required this.type,
    this.category,
    this.subcategory,
  });

  factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
        type: TypeClass.fromJson(json["type"]),
        category: json["category"] == null
            ? null
            : TypeClass.fromJson(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : TypeClass.fromJson(json["subcategory"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type.toJson(),
        "category": category?.toJson(),
        "subcategory": subcategory?.toJson(),
      };
}

class TypeClass {
  String slug;
  String prettySlug;

  TypeClass({
    required this.slug,
    required this.prettySlug,
  });

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "pretty_slug": prettySlug,
      };
}

class CoverPhoto {
  String id;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String altDescription;
  Urls urls;
  ResultLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  CoverPhotoTopicSubmissions topicSubmissions;
  bool? premium;
  bool? plus;
  User user;

  CoverPhoto({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    required this.altDescription,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    this.sponsorship,
    required this.topicSubmissions,
    this.premium,
    this.plus,
    required this.user,
  });

  factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: ResultLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions:
            CoverPhotoTopicSubmissions.fromJson(json["topic_submissions"]),
        premium: json["premium"],
        plus: json["plus"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toJson(),
        "premium": premium,
        "plus": plus,
        "user": user.toJson(),
      };
}

class CoverPhotoTopicSubmissions {
  Animals? nature;
  Animals? wallpapers;
  Animals? architectureInterior;
  Animals? colorOfWater;
  Animals? animals;

  CoverPhotoTopicSubmissions({
    this.nature,
    this.wallpapers,
    this.architectureInterior,
    this.colorOfWater,
    this.animals,
  });

  factory CoverPhotoTopicSubmissions.fromJson(Map<String, dynamic> json) =>
      CoverPhotoTopicSubmissions(
        nature:
            json["nature"] == null ? null : Animals.fromJson(json["nature"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : Animals.fromJson(json["wallpapers"]),
        architectureInterior: json["architecture-interior"] == null
            ? null
            : Animals.fromJson(json["architecture-interior"]),
        colorOfWater: json["color-of-water"] == null
            ? null
            : Animals.fromJson(json["color-of-water"]),
        animals:
            json["animals"] == null ? null : Animals.fromJson(json["animals"]),
      );

  Map<String, dynamic> toJson() => {
        "nature": nature?.toJson(),
        "wallpapers": wallpapers?.toJson(),
        "architecture-interior": architectureInterior?.toJson(),
        "color-of-water": colorOfWater?.toJson(),
        "animals": animals?.toJson(),
      };
}

class Animals {
  Status status;
  DateTime? approvedOn;

  Animals({
    required this.status,
    this.approvedOn,
  });

  factory Animals.fromJson(Map<String, dynamic> json) => Animals(
        status: statusValues.map[json["status"]]!,
        approvedOn: json["approved_on"] == null
            ? null
            : DateTime.parse(json["approved_on"]),
      );

  Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "approved_on": approvedOn?.toIso8601String(),
      };
}

enum Status { APPROVED, REJECTED }

final statusValues =
    EnumValues({"approved": Status.APPROVED, "rejected": Status.REJECTED});

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}

class ResultTopicSubmissions {
  Animals? nature;
  Animals? travel;
  Animals? wallpapers;
  Animals? colorOfWater;
  Animals? spirituality;
  Animals? animals;

  ResultTopicSubmissions({
    this.nature,
    this.travel,
    this.wallpapers,
    this.colorOfWater,
    this.spirituality,
    this.animals,
  });

  factory ResultTopicSubmissions.fromJson(Map<String, dynamic> json) =>
      ResultTopicSubmissions(
        nature:
            json["nature"] == null ? null : Animals.fromJson(json["nature"]),
        travel:
            json["travel"] == null ? null : Animals.fromJson(json["travel"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : Animals.fromJson(json["wallpapers"]),
        colorOfWater: json["color-of-water"] == null
            ? null
            : Animals.fromJson(json["color-of-water"]),
        spirituality: json["spirituality"] == null
            ? null
            : Animals.fromJson(json["spirituality"]),
        animals:
            json["animals"] == null ? null : Animals.fromJson(json["animals"]),
      );

  Map<String, dynamic> toJson() => {
        "nature": nature?.toJson(),
        "travel": travel?.toJson(),
        "wallpapers": wallpapers?.toJson(),
        "color-of-water": colorOfWater?.toJson(),
        "spirituality": spirituality?.toJson(),
        "animals": animals?.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
