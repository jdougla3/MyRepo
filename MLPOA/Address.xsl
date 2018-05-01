<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:workbook="urn:schemas-microsoft-com:office:spreadsheet"
	xmlns:xsi="http:/www.w3.org/XMLSchema-instance" version="2.0" exclude-result-prefixes="ss xs xsi">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:strip-space elements="*" />
		<xsl:variable name="worksheet" select="'Master'" />
	<xsl:template match="/">
		<xsl:text>&#xa;</xsl:text>
		<xsl:apply-templates select="ss:Workbook/ss:Worksheet[@ss:Name=$worksheet]/ss:Table/ss:Row" />
	</xsl:template>
	<xsl:template match="ss:Row">
		<xsl:choose>
			<xsl:when
				test="ss:Cell[ss:NamedCell/@ss:Name='ADDRESS']/ss:Data!='-'">
				<xsl:text>&#xa;</xsl:text>
				<xsl:value-of select="ss:Cell[ss:NamedCell/@ss:Name='FIRST']/ss:Data" />
				<xsl:value-of select="' '" />
				<xsl:value-of select="ss:Cell[ss:NamedCell/@ss:Name='LAST']/ss:Data" />
				<xsl:text>,</xsl:text>
				<xsl:value-of select="substring-before(ss:Cell[ss:NamedCell/@ss:Name='ADDRESS']/ss:Data,',')" />
				<xsl:text>,</xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring-after(ss:Cell[ss:NamedCell/@ss:Name='ADDRESS']/ss:Data,', ')" />
				<xsl:text>"</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>