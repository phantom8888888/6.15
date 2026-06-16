import 'package:flutter/material.dart';

class CityModel {
  final String id;
  final String name;
  final String nameEn;
  final String province;
  final String description;
  final String heroImage;
  final Color themeColor;
  final List<Attraction> attractions;
  final List<Food> foods;
  final List<TravelRoute> routes;
  final AIContent aiContent;

  const CityModel({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.province,
    required this.description,
    required this.heroImage,
    required this.themeColor,
    required this.attractions,
    required this.foods,
    required this.routes,
    required this.aiContent,
  });
}

class Attraction {
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final String category;
  final String openHours;
  final String ticketPrice;

  const Attraction({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.category,
    required this.openHours,
    required this.ticketPrice,
  });
}

class Food {
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final int priceLevel;
  final bool isMustTry;

  const Food({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.priceLevel,
    required this.isMustTry,
  });
}

class TravelRoute {
  final String title;
  final String duration;
  final String difficulty;
  final List<String> stops;
  final String description;
  final String bestSeason;

  const TravelRoute({
    required this.title,
    required this.duration,
    required this.difficulty,
    required this.stops,
    required this.description,
    required this.bestSeason,
  });
}

class AIContent {
  final String summary;
  final List<String> tips;
  final String bestTimeToVisit;
  final String transportAdvice;

  const AIContent({
    required this.summary,
    required this.tips,
    required this.bestTimeToVisit,
    required this.transportAdvice,
  });
}
