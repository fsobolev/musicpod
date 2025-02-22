import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:metadata_god/metadata_god.dart';
import '../../../string_x.dart';
import 'genres.dart';

class Audio {
  /// The local path if available.
  final String? path;

  /// The remote URL if available.
  final String? url;

  /// The [AudioType]
  final AudioType? audioType;

  /// The url of the image if remote.
  final String? imageUrl;

  /// The description of the audio file or stream.
  final String? description;

  /// Website link or feed url in case of podcasts.
  final String? website;

  /// The title of the audio file or stream.
  final String? title;

  /// The duration of the audio file or stream. It can be null if was not set
  final double? durationMs;

  /// The artist(s) of the audio file or stream.
  final String? artist;

  /// The album of the audio file or stream.
  final String? album;

  /// The album artist(s) of the audio file or stream.
  final String? albumArtist;

  /// The track number of the audio file or stream.
  final int? trackNumber;

  /// The track total of the audio file or stream.
  final int? trackTotal;

  /// The discNumber of the audio file or stream.
  final int? discNumber;

  /// The discTotal of the audio file or stream.
  final int? discTotal;

  /// The date the audio was released.
  final int? year;

  /// The genre of the audio file or stream.
  final String? genre;

  /// The picture's MIME type. Only for local audio.
  final String? pictureMimeType;

  /// The image data. Only for local audio.
  final Uint8List? pictureData;

  /// The file size of the audio file.
  final int? fileSize;

  /// Optional art that can belong to a parent element.
  final String? albumArtUrl;

  const Audio({
    this.path,
    this.url,
    this.audioType,
    this.imageUrl,
    this.description,
    this.website,
    this.title,
    this.durationMs,
    this.artist,
    this.album,
    this.albumArtist,
    this.trackNumber,
    this.trackTotal,
    this.discNumber,
    this.discTotal,
    this.year,
    this.genre,
    this.pictureMimeType,
    this.pictureData,
    this.fileSize,
    this.albumArtUrl,
  });

  Audio copyWith({
    String? path,
    String? url,
    String? name,
    AudioType? audioType,
    String? imageUrl,
    String? description,
    String? website,
    String? title,
    double? durationMs,
    String? artist,
    String? album,
    String? albumArtist,
    int? trackNumber,
    int? trackTotal,
    int? discNumber,
    int? discTotal,
    int? year,
    String? genre,
    String? pictureMimeType,
    Uint8List? pictureData,
    int? fileSize,
    String? albumArtUrl,
  }) {
    return Audio(
      path: path ?? this.path,
      url: url ?? this.url,
      audioType: audioType ?? this.audioType,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      website: website ?? this.website,
      title: title ?? this.title,
      durationMs: durationMs ?? this.durationMs,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      albumArtist: albumArtist ?? this.albumArtist,
      trackNumber: trackNumber ?? this.trackNumber,
      trackTotal: trackTotal ?? this.trackTotal,
      discNumber: discNumber ?? this.discNumber,
      discTotal: discTotal ?? this.discTotal,
      year: year ?? this.year,
      genre: genre ?? this.genre,
      pictureMimeType: pictureMimeType ?? this.pictureMimeType,
      pictureData: pictureData ?? this.pictureData,
      fileSize: fileSize ?? this.fileSize,
      albumArtUrl: albumArtUrl ?? this.albumArtUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (path != null) {
      result.addAll({'path': path});
    }
    if (url != null) {
      result.addAll({'url': url});
    }
    if (audioType != null) {
      result.addAll({'audioType': audioType!.name});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (website != null) {
      result.addAll({'website': website});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (durationMs != null) {
      result.addAll({'durationMs': durationMs});
    }
    if (artist != null) {
      result.addAll({'artist': artist});
    }
    if (album != null) {
      result.addAll({'album': album});
    }
    if (albumArtist != null) {
      result.addAll({'albumArtist': albumArtist});
    }
    if (trackNumber != null) {
      result.addAll({'trackNumber': trackNumber});
    }
    if (trackTotal != null) {
      result.addAll({'trackTotal': trackTotal});
    }
    if (discNumber != null) {
      result.addAll({'discNumber': discNumber});
    }
    if (discTotal != null) {
      result.addAll({'discTotal': discTotal});
    }
    if (year != null) {
      result.addAll({'year': year});
    }
    if (genre != null) {
      result.addAll({'genre': genre});
    }
    if (pictureMimeType != null) {
      result.addAll({'pictureMimeType': pictureMimeType});
    }
    if (pictureData != null) {
      result.addAll({'pictureData': base64Encode(pictureData!)});
    }
    if (fileSize != null) {
      result.addAll({'fileSize': fileSize});
    }
    if (albumArtUrl != null) {
      result.addAll({'albumArtUrl': albumArtUrl});
    }

    return result;
  }

  factory Audio.fromMap(Map<String, dynamic> map) {
    return Audio(
      path: map['path'],
      url: map['url'],
      audioType: map['audioType'] != null
          ? AudioType.values.byName(map['audioType'])
          : null,
      imageUrl: map['imageUrl'],
      description: map['description'],
      website: map['website'],
      title: map['title'],
      durationMs: map['durationMs']?.toDouble(),
      artist: map['artist'],
      album: map['album'],
      albumArtist: map['albumArtist'],
      trackNumber: map['trackNumber']?.toInt(),
      trackTotal: map['trackTotal']?.toInt(),
      discNumber: map['discNumber']?.toInt(),
      discTotal: map['discTotal']?.toInt(),
      year: map['year']?.toInt(),
      genre: map['genre'],
      pictureMimeType: map['pictureMimeType'],
      pictureData:
          map['pictureData'] != null ? base64Decode(map['pictureData']) : null,
      fileSize: map['fileSize']?.toInt(),
      albumArtUrl: map['albumArtUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Audio.fromJson(String source) => Audio.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Audio(path: $path, url: $url,  audioType: $audioType, imageUrl: $imageUrl, description: $description, website: $website, title: $title, durationMs: $durationMs, artist: $artist, album: $album, albumArtist: $albumArtist, trackNumber: $trackNumber, trackTotal: $trackTotal, discNumber: $discNumber, discTotal: $discTotal, year: $year, genre: $genre, pictureMimeType: $pictureMimeType, pictureData: $pictureData, fileSize: $fileSize, albumArtUrl: $albumArtUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Audio &&
        ((other.url != null && other.url == url) ||
            (other.path != null && other.path == path));
  }

  @override
  int get hashCode {
    return path.hashCode ^ url.hashCode;
  }
}

enum AudioType {
  local,
  radio,
  podcast;
}

Audio createLocalAudio({
  required String path,
  required Metadata data,
}) {
  final fileName = File(path).uri.pathSegments.lastOrNull;
  final albumName =
      '${data.album}${data.discTotal != null && data.discNumber != null && data.discTotal! > 1 ? ' ${data.discNumber}' : ''}';
  final genre =
      data.genre?.startsWith('(') == true && data.genre?.endsWith(')') == true
          ? tagGenres[data.genre?.replaceAll('(', '').replaceAll(')', '')]
              ?.capitalizeEveryWord()
          : data.genre;

  return Audio(
    path: path,
    audioType: AudioType.local,
    artist: data.artist,
    title: (data.title?.isNotEmpty == true ? data.title : fileName) ?? path,
    album: data.album == null ? null : albumName,
    albumArtist: data.artist,
    discNumber: data.discNumber,
    discTotal: data.discTotal,
    durationMs: data.duration?.inMilliseconds.toDouble(),
    fileSize: data.fileSize,
    genre: genre,
    pictureData: data.picture?.data,
    pictureMimeType: data.picture?.mimeType,
    trackNumber: data.trackNumber,
    year: data.year,
  );
}
