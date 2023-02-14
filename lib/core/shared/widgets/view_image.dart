
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Scaffold viewImage(String url) {
  return Scaffold(
      appBar: AppBar(),
      body: Hero(
          tag: () {}, child: Center(child: CachedNetworkImage(imageUrl: url))));
}
