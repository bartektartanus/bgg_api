import 'package:html_unescape/html_unescape.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

@immutable
abstract class XmlDecoder<T> {
  const XmlDecoder();

  /// Decodes [xml] to generic object T
  T decode(XmlElement xml);

  @protected
  int readIntAttribute(XmlElement xml, String attribute) =>
      int.tryParse(readStringAttribute(xml, attribute) ?? '');

  @protected
  int readId(XmlElement xml) => int.tryParse(xml.getAttribute('id'));

  @protected
  int readIntValue(XmlElement xml, String path) {
    var value = readStringValue(xml, path);
    return value != null ? int.tryParse(value) : null;
  }

  @protected
  String readStringUnescaped(XmlElement xml, String path) {
    return HtmlUnescape().convert(readString(xml, path));
  }

  @protected
  String readString(XmlElement xml, String path) {
    return xml
        .findAllElements(path)
        .firstWhere((element) => true, orElse: () => null)
        ?.text;
  }

  @protected
  String readStringAttribute(XmlElement xml, String attribute) {
    return xml.getAttribute(attribute);
  }

  @protected
  String readStringValue(XmlElement xml, String path) {
    return xml
        .findAllElements(path)
        .firstWhere((element) => true, orElse: () => null)
        ?.getAttribute('value');
  }

  @protected
  String readStringValueWithAttribute(XmlElement xml, String path,
      String attributeName, String attributeValue) {
    return xml
        .findAllElements(path)
        .firstWhere(
            (element) => element.getAttribute(attributeName) == attributeValue,
            orElse: () => null)
        ?.getAttribute('value');
  }

  @protected
  XmlElement getElement(XmlElement xml, String path) {
    return xml?.getElement(path);
  }

  @protected
  Iterable<XmlElement> findElements(XmlElement xml, String name) {
    return xml?.findElements(name) ?? [];
  }

  @protected
  Iterable<XmlElement> findElementsRecursive(XmlElement xml, String name) {
    return xml?.findAllElements(name) ?? [];
  }
}
