for $x in doc("CalendarioXML.xml")/calendario/curso
return count($x/ucs/uc[regente/codigo="rs"])