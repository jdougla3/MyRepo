<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:workbook="urn:schemas-microsoft-com:office:spreadsheet"
	xmlns:xsi="
	http: / www.w3.org / XMLSchema-instance " version="2.0" xmlns:ns1="http://www.w3.org/2001/XMLSchema"
	exclude-result-prefixes="xs ss xsi">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:variable name="worksheet" select="'Master'" />
	<xsl:template match="/">
		<xsl:apply-templates select="ss:Workbook/ss:Worksheet[@ss:Name=$worksheet]/ss:Table/ss:Row" />
	</xsl:template>
	<xsl:template match="ss:Row">
		<xsl:if test="ss:Cell[ss:NamedCell/@ss:Name='EMAIL']/ss:Data!='-'">
			<xsl:variable name="address" select="ss:Cell[ss:NamedCell/@ss:Name='EMAIL']/ss:Data" />
			<xsl:if test="contains($address,' ')">
				<xsl:value-of select="normalize-space(substring-before($address,' '))" />
				<xsl:text>;</xsl:text>
				<xsl:value-of select="normalize-space(substring-after($address,' '))" />
				<xsl:text>;</xsl:text>
			</xsl:if>
			<xsl:if test="not(contains($address,' '))">
				<xsl:value-of select="normalize-space($address)" />
				<xsl:text>;</xsl:text>
			</xsl:if>
			<xsl:text>&#xA;</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>