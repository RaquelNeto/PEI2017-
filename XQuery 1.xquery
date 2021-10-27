for $x in doc("CalendarioXML.xml")/calendario/curso/ucs/uc
return <uc> <codigo> {data($x/codigoUc)} </codigo> <nome> {data($x/nome)} </nome> <regente> {data($x/regente/nome)} </regente> </uc>