import 'package:html_unescape/html_unescape.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

@immutable
abstract class XmlDecoder<T> {
  const XmlDecoder();

  /// Decodes [xml] to generic object T
  T decode(XmlElement xml);

  @protected
  int readId(XmlElement xml) => int.parse(xml.getAttribute('id'));

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
    return xml.findAllElements(path).firstWhere((element) => true, orElse: () => null)?.text;
  }

  @protected
  String readStringValue(XmlElement xml, String path) {
    return xml.findAllElements(path).firstWhere((element) => true, orElse: () => null)?.getAttribute('value');
  }
}
