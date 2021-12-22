import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

const thousand = 1000;
const million = 1000000;
const billion = 1000000000;
const trillion = 1000000000000;
const quadrillion = 1000000000000000;
const quintillion = 1000000000000000000;

String abrvAmount(int value) {
  if (value >= quintillion) {
    return '${(value / quintillion).toStringAsFixed(2)}Q';
  } else if (value >= quadrillion) {
    return '${(value / quadrillion).toStringAsFixed(2)}q';
  } else if (value >= trillion) {
    return '${(value / trillion).toStringAsFixed(0)}t';
  } else if (value >= billion) {
    return '${(value / billion).toStringAsFixed(0)}B';
  } else if (value >= million) {
    return '${(value / million).toStringAsFixed(0)}M';
  } else if (value >= thousand) {
    return '${(value / thousand).toStringAsFixed(0)}K';
  } else {
    return value.toString();
  }
}
