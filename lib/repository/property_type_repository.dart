import 'package:globalsolutionsflutter1sem/model/property_type.dart';

const residentialType  = PropertyType(name: 'Residencial',  emoji: '🏠');
const commercialType   = PropertyType(name: 'Comercial',    emoji: '🏢');
const industrialType   = PropertyType(name: 'Industrial',   emoji: '🏭');
const ruralType        = PropertyType(name: 'Rural',        emoji: '🌾');
const highRiskType     = PropertyType(name: 'Alto Risco',   emoji: '⚠️');
const premiumType      = PropertyType(name: 'Premium ROI',  emoji: '💰');

List<PropertyType> getAllPropertyTypes() {
  return const [
    residentialType,
    commercialType,
    industrialType,
    ruralType,
    highRiskType,
    premiumType,
  ];
}