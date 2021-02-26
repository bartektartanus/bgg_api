import 'package:html_unescape/html_unescape.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';
import '../utils/list.dart';

@immutable
abstract class XmlDecoder<T> {
  const XmlDecoder();

  /// Decodes [xml] to generic object T
  T decode(XmlNode xml);

  @protected
  int? readIntAttribute(XmlNode xml, String attribute) =>
      int.tryParse(readStringAttribute(xml, attribute) ?? '');

  @protected
  int? readId(XmlNode xml) => int.tryParse(xml.getAttribute('id') ?? '');

  @protected
  int? readIntValue(XmlNode xml, String path) {
    var value = readStringValue(xml, path);
    return value != null ? int.tryParse(value) : null;
  }

  @protected
  String? readStringUnescaped(XmlNode xml, String path) {
    var string = readString(xml, path);
    return string != null ? HtmlUnescape().convert(string) : null;
  }

  @protected
  String? readString(XmlNode xml, String path) {
    return xml
        .findAllElements(path)
        .firstOrNull
        ?.text;
  }

  @protected
  String? readStringAttribute(XmlNode xml, String attribute) {
    return xml.getAttribute(attribute);
  }

  @protected
  String? readStringValue(XmlNode xml, String path) {
    return xml
        .findAllElements(path)
        .firstOrNull
        ?.getAttribute('value');
  }

  @protected
  String? readStringValueWithAttribute(XmlNode xml, String path,
      String attributeName, String attributeValue) {
    return xml
        .findAllElements(path)
        .firstWhereOrNull((element) => element.getAttribute(attributeName) == attributeValue)
        ?.getAttribute('value');
  }

  @protected
  XmlElement? getElement(XmlNode xml, String path) {
    return xml.getElement(path);
  }

  @protected
  Iterable<XmlElement> findElements(XmlNode? xml, String name) {
    return xml?.findElements(name) ?? [];
  }

  @protected
  Iterable<XmlElement> findElementsRecursive(XmlElement xml, String name) {
    return xml.findAllElements(name);
  }
}
