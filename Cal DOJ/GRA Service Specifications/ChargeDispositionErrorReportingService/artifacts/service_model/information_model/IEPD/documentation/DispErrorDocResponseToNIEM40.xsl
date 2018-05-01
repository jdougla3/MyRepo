<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	version="2.0" exclude-result-prefixes="">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:template match="node()">
		<xsl:copy>
			<xsl:apply-templates select="node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='https://isb.srv.courts-tc.ca.gov/CADRIP/ResponseDocument']">
		<xsl:element name="{local-name()}" namespace="https://isb.srv.courts-tc.ca.gov/CADRIP/ChargeDispositionErrorResponseDocument">
			<xsl:apply-templates select="@*|node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='http://release.niem.gov/niem/niem-core/3.0/']">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/niem-core/4.0/">
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>