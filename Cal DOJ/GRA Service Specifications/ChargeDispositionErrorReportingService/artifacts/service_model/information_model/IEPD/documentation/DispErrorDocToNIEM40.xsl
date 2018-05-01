<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" exclude-result-prefixes="xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:template match="*:MessageOrigin[namespace-uri()='http://release.niem.gov/niem/domains/cbrn/3.0/']">
		<MessageOrigin xmlns="http://release.niem.gov/niem/domains/cbrn/4.0/">
			<OrganizationIdentification xmlns="http://release.niem.gov/niem/niem-core/4.0/">
				<IdentificationID>
					<xsl:value-of select="./@*:id[namespace-uri()='http://release.niem.gov/niem/structures/3.0/']" />
				</IdentificationID>
			</OrganizationIdentification>
		</MessageOrigin>
	</xsl:template>
	<xsl:template match="*:MessageDestination[namespace-uri()='http://release.niem.gov/niem/domains/cbrn/3.0/']">
		<MessageDestination xmlns="http://release.niem.gov/niem/domains/cbrn/4.0/">
			<OrganizationIdentification xmlns="http://release.niem.gov/niem/niem-core/4.0/">
				<IdentificationID>
					<xsl:value-of select="./@*:id[namespace-uri()='http://release.niem.gov/niem/structures/3.0/']" />
				</IdentificationID>
			</OrganizationIdentification>
		</MessageDestination>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='http://release.niem.gov/niem/niem-core/3.0/']">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/niem-core/4.0/">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='https://isb.srv.courts-tc.ca.gov/CADRIP/ChargeDispositionErrorDocumentExtension']">
		<xsl:element name="{local-name()}" namespace="https://isb.srv.courts-tc.ca.gov/CADRIP/ChargeDispositionErrorDocumentExtension">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='http://release.niem.gov/niem/domains/jxdm/5.0/']">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/domains/jxdm/6.0/">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template
		match="node()[namespace-uri()='http://release.niem.gov/niem/domains/cbrn/3.0/'][not(self::*:MessageOrigin | self::*:MessageDestination)]">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/domains/cbrn/4.0/">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='https://isb.srv.courts-tc.ca.gov/CADRIP/ChargeDispositionErrorDocument']">
		<xsl:element name="{local-name()}" namespace="https://isb.srv.courts-tc.ca.gov/CADRIP/ChargeDispositionErrorDocument">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='http://niem.gov/niem/appinfo/2.0']">
		<xsl:element name="{local-name()}" namespace="http://niem.gov/niem/appinfo/4.0">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='http://niem.gov/niem/structures/2.0']">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/structures/4.0/">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template name="NIL">
		<xsl:if test="./@xsi:nil='true'">
			<xsl:attribute name="xsi:nil">
		<xsl:value-of select="./@xsi:nil" />
		</xsl:attribute>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>