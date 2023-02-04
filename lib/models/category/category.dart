import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';
part 'category.g.dart';

List<Category> categoiesFromJson(dynamic str) =>
    List<Category>.from((str).map((e) => Category.fromJson(e)));

@freezed
abstract class Category with _$Category {
  factory Category(
      {required String categoryName,
      required String categoryId,
      required String categoryImage}) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
