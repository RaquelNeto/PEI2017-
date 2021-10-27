for $x in doc("CalendarioXML.xml")/calendario
let $exames := count($x/curso/ucs/uc/exames/exame[../../semestre="1" and
../../../../nome="Licenciatura em Engenharia Informática" and 
../../anoCurricular="1" and dia>=10 and dia <=15])
return $exames
