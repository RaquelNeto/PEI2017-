<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version = "1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="recursive-template">
		<xsl:param name="var" select="1"/>
		<xsl:param name="epoc"/>
		<xsl:choose>
			<xsl:when test="$var > 31">
			</xsl:when>
			<xsl:otherwise>
				<!--<xsl:value-of select="$var"/>-->
				<tr>
					<td><xsl:value-of select="$var"/></td>
					<td>
						<table border="0">
							
							<xsl:for-each select="ucs/uc/exames/exame">
								
									<xsl:if test="dia = $var and $epoc = epoca">
											<tr>
												<td><xsl:value-of select="../../anoCurricular"/></td>
											</tr>
									</xsl:if>
								
							</xsl:for-each>
						</table>
						
					</td>
					<td>
						
						<table border="0">
							
							<xsl:for-each select="ucs/uc/exames/exame">

									<xsl:if test="dia = $var and $epoc = epoca">
										<tr>
											<td><xsl:value-of select="../../nome"/></td>
										</tr>
									</xsl:if>
								
							</xsl:for-each>
						</table>
						
					</td>
					<td>
						
						<table border="0">
							
							<xsl:for-each select="ucs/uc/exames/exame">
								
									<xsl:if test="dia = $var and $epoc = epoca">
										<tr>
											<td><xsl:value-of select="hora"/></td>
										</tr>
									</xsl:if>
								
							</xsl:for-each>
						</table>
						
					</td>
					<td>
						
						<table border="0">
							
							<xsl:for-each select="ucs/uc/exames/exame">
								
									<xsl:if test="dia = $var and $epoc = epoca">
										<tr>
											<td><xsl:value-of select="tipoSala"/></td>
										</tr>
									</xsl:if>
								
							</xsl:for-each>
						</table>
						
					</td>
					<td>
						
						<table border="0">
							
							<xsl:for-each select="ucs/uc/exames/exame">

									<xsl:if test="dia = $var and $epoc = epoca">
										<tr>
											<td><xsl:value-of select="../../regente/nome"/></td>
										</tr>
									</xsl:if>
									
							</xsl:for-each>
						</table>
						
					</td>
					
				</tr>
				<xsl:call-template name="recursive-template">
					<xsl:with-param name="var" select="$var + 1"/>
					<xsl:with-param name="epoc" select="$epoc"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match = "/">

		<html>
			<head>
				<link rel="stylesheet" href="styles.css"/>
			</head>
			
			<body>
				
				<!-- <xsl:call-template name="recursive-template" /> -->
				
				<h1>Mapa de Exames</h1>
				
				<xsl:for-each select = "calendario/curso">
					
					<h2><xsl:value-of select = "nome"/></h2>
					<h3>Época Normal</h3>
					<h4>De <xsl:value-of select = "../epocas/epocaNormal/dataInicio"/> a <xsl:value-of select = "../epocas/epocaNormal/dataFim"/></h4>
				
					<table border = "1">
						<tr bgcolor = "#ffffff">
							<th>Dia</th>
							<th>Ano</th>
							<th>Unidade curricular</th>
							<th>Hora</th>
							<th>Sala</th>
							<th>Responsável</th>
						</tr>
						<xsl:call-template name="recursive-template">
							<xsl:with-param name="var">1</xsl:with-param>
							<xsl:with-param name="epoc" select="'normal'"/>
						</xsl:call-template>
						
						
					</table>
					
					<p><br/><br/></p>
					
					<h3>Época Recurso</h3>
					<h4>De <xsl:value-of select = "../epocas/epocaRecurso/dataInicio"/> a <xsl:value-of select = "../epocas/epocaRecurso/dataFim"/></h4>
					
					<table border = "1">
						<tr bgcolor = "#ffffff">
							<th>Dia</th>
							<th>Ano</th>
							<th>Unidade curricular</th>
							<th>Hora</th>
							<th>Sala</th>
							<th>Responsável</th>
						</tr>
						<xsl:call-template name="recursive-template">
							<xsl:with-param name="var">1</xsl:with-param>
							<xsl:with-param name="epoc" select="'recurso'"/>
						</xsl:call-template>
					</table>
					
					<p><br/><br/></p>
					
					<h3>Época Especial</h3>
					<h4>De <xsl:value-of select = "../epocas/epocaEspecial/dataInicio"/> a <xsl:value-of select = "../epocas/epocaEspecial/dataFim"/></h4>
					
					<table border = "1">
						<tr bgcolor = "#ffffff">
							<th>Dia</th>
							<th>Ano</th>
							<th>Unidade curricular</th>
							<th>Hora</th>
							<th>Sala</th>
							<th>Responsável</th>
						</tr>
						<xsl:call-template name="recursive-template">
							<xsl:with-param name="var">1</xsl:with-param>
							<xsl:with-param name="epoc" select="'especial'"/>
						</xsl:call-template>
					</table>
					
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>