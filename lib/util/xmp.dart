import '../model/raw_photo.dart';

String getXMPForRawFile(RawPhoto rawPhoto) {
  String rating = rawPhoto.rating==null ? '' : '<xmp:Rating>${rawPhoto.rating}</xmp:Rating>';
  String color = rawPhoto.color==null ? '' : '<xmp:Label>${rawPhoto.color!.name}</xmp:Label>';
  String selected = rawPhoto.selected==null ?  '' :
    (rawPhoto.selected==true ? '<xmpDM:good>True</xmpDM:good>' :
      '<xmpDM:good>False</xmpDM:good>' );

  String xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\n'
      '<x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="XMP Core 6.0.0">\n'
      '  <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">\n'
      '    <rdf:Description rdf:about="" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmlns:xmpDM="http://ns.adobe.com/xmp/1.0/DynamicMedia/">\n'
      '      $rating\n      $color\n      $selected\n'
      '    </rdf:Description>\n'
      '  </rdf:RDF>\n'
      '</x:xmpmeta>';

  return xml;
}