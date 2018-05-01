<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" exclude-result-prefixes="xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:template match="*:PersonWeightMeasure[namespace-uri()='http://niem.gov/niem/niem-core/2.0']">
		<xsl:variable name="altName"
			select="//*:PersonAlternateName[namespace-uri()='http://niem.gov/niem/niem-core/2.0']/*:PersonFullName[namespace-uri()='http://niem.gov/niem/niem-core/2.0']" />
		<PersonWeightMeasure xmlns="http://release.niem.gov/niem/niem-core/4.0/">
			<MeasureValueText xmlns="http://release.niem.gov/niem/niem-core/4.0/">
				<xsl:value-of select="." />
			</MeasureValueText>
		</PersonWeightMeasure>
		<PersonAlternateName xmlns="http://release.niem.gov/niem/domains/emergencyManagement/4.0/">
			<xsl:value-of select="$altName" />
		</PersonAlternateName>
	</xsl:template>
	<xsl:template match="*:DriverLicense[namespace-uri()='http://niem.gov/niem/niem-core/2.0']">
		<DriverLicense xmlns="http://release.niem.gov/niem/domains/jxdm/6.0/">
			<DriverLicenseIdentification xmlns="http://release.niem.gov/niem/domains/jxdm/6.0/">
				<IdentificationID xmlns="http://release.niem.gov/niem/niem-core/4.0/">
					<xsl:value-of select="./*:DriverLicenseIdentification/*:IdentificationID" />
				</IdentificationID>
			</DriverLicenseIdentification>
		</DriverLicense>
	</xsl:template>
	<xsl:template match="*:MeasureText[namespace-uri()='http://niem.gov/niem/niem-core/2.0']">
		<MeasureValueText xmlns="http://release.niem.gov/niem/niem-core/4.0/">
			<xsl:value-of select="." />
		</MeasureValueText>
	</xsl:template>
	<xsl:template match="*:ObligationDueAmount[namespace-uri()='http://niem.gov/niem/niem-core/2.0']">
		<ObligationDueAmount xmlns="http://release.niem.gov/niem/niem-core/4.0/">
			<Amount>
				<xsl:value-of select="." />
			</Amount>
		</ObligationDueAmount>
	</xsl:template>
	<xsl:template match="*:FinancialObligationExemptionAmount[namespace-uri()='http://niem.gov/niem/niem-core/2.0']">
		<FinancialObligationExemptionAmount xmlns="http://release.niem.gov/niem/niem-core/4.0/">
			<Amount>
				<xsl:value-of select="." />
			</Amount>
		</FinancialObligationExemptionAmount>
	</xsl:template>
	<xsl:template
		match="node()[namespace-uri()='http://niem.gov/niem/niem-core/2.0'][not(self::*:DriverLicense | self::*:MeasureText | self::*:PersonWeightMeasure | self::*:PersonAlternateName | self::*:ObligationDueAmount | self::*:FinancialObligationExemptionAmount)]">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/niem-core/4.0/">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="*:MessageOrigin[namespace-uri()='http://release.niem.gov/niem/domains/cbrn/3.0/']">
		<MessageOrigin xmlns="http://release.niem.gov/niem/domains/cbrn/4.0/">
			<OrganizationIdentification xmlns="http://release.niem.gov/niem/niem-core/4.0/">
				<IdentificationID>
					<xsl:value-of select="./@*:id[namespace-uri()='http://release.niem.gov/niem/structures/2.0/']" />
					<xsl:value-of select="./@*:id[namespace-uri()='http://release.niem.gov/niem/structures/3.0/']" />
				</IdentificationID>
			</OrganizationIdentification>
		</MessageOrigin>
	</xsl:template>
	<xsl:template match="*:MessageDestination[namespace-uri()='http://release.niem.gov/niem/domains/cbrn/3.0/']">
		<MessageDestination xmlns="http://release.niem.gov/niem/domains/cbrn/4.0/">
			<OrganizationIdentification xmlns="http://release.niem.gov/niem/niem-core/4.0/">
				<IdentificationID>
					<xsl:value-of select="./@*:id[namespace-uri()='http://release.niem.gov/niem/structures/2.0/']" />
					<xsl:value-of select="./@*:id[namespace-uri()='http://release.niem.gov/niem/structures/3.0/']" />
				</IdentificationID>
			</OrganizationIdentification>
		</MessageDestination>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='http://niem.gov/niem/structures/2.0']">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/structures/4.0/">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='http://niem.gov/niem/structures/3.0']">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/structures/4.0/">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='http://niem.gov/niem/domains/jxdm/4.0']">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/domains/jxdm/6.0/">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template
		match="node()[namespace-uri()='http://release.niem.gov/niem/domains/cbrn/3.0/'][not(self::*:MessageOrigin | self::*:MessageDestination)]">
		<xsl:element name="{local-name()}" namespace="http://release.niem.gov/niem/domains/cbrn/4.0/">
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='https://isb.srv.courts-tc.ca.gov/CADRIP/ChargeDispositionDocumentExtension']">
		<xsl:element name="{local-name()}" namespace="https://isb.srv.courts-tc.ca.gov/CADRIP/ChargeDispositionDocumentExtension">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='https://isb.srv.courts-tc.ca.gov/CADRIP/InitialChargeDispositionDocument']">
		<xsl:element name="{local-name()}" namespace="https://isb.srv.courts-tc.ca.gov/CADRIP/InitialChargeDispositionDocument">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='https://isb.srv.courts-tc.ca.gov/CADRIP/CorrectedChargeDispositionDocument']">
		<xsl:element name="{local-name()}" namespace="https://isb.srv.courts-tc.ca.gov/CADRIP/CorrectedChargeDispositionDocument">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="node()[namespace-uri()='https://isb.srv.courts-tc.ca.gov/CADRIP/SubsequentChargeDispositionDocument']">
		<xsl:element name="{local-name()}" namespace="https://isb.srv.courts-tc.ca.gov/CADRIP/SubsequentChargeDispositionDocument">
			<xsl:call-template name='NIL' />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="*:PersonAlternateName[namespace-uri()='http://niem.gov/niem/niem-core/2.0']" />
	<xsl:template name="NIL">
		<xsl:if test="./@xsi:nil='true'">
			<xsl:attribute name="xsi:nil">
		<xsl:value-of select="./@xsi:nil" />
		</xsl:attribute>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>