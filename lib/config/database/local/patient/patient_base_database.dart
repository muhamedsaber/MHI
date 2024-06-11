import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

abstract class BaseDatabase<T> {
  final String boxKey;

  BaseDatabase(this.boxKey);

  Future<void> _openBox() async {
    if (!Hive.isBoxOpen(boxKey)) {
      await Hive.openBox(boxKey);
    }
  }

  Box _getBox() {
    return Hive.box(boxKey);
  }

  Future<List<T>> getItems(T Function(Map<String, dynamic>) fromJson) async {
    await _openBox();
    return _getBox()
        .values
        .map((e) => fromJson(jsonDecode(e)))
        .toList()
        .cast<T>();
  }

  Future<bool> saveItem(
      {required String id,
      required T model,
      required Map<String, dynamic> Function(T) toJson}) async {
    try {
      await _openBox();
      await _getBox().put(id, jsonEncode(toJson(model)));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteItem({required String id}) async {
    try {
      await _openBox();
      await _getBox().delete(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteAll() async {
    await _openBox();
    await _getBox().clear();
    debugPrint("Successfully deleted all items in $boxKey");
  }

  Future<bool> isItemSaved(
      {required String id,
      required T Function(Map<String, dynamic>) fromJson}) async {
    await _openBox();
    List<T> items = await getItems(fromJson);
    return items.any((item) => (item as dynamic).doctorId == id);
  }
}
