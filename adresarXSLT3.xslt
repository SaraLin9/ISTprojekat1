<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
    xmlns="http://viser.edu.rs/saranrt8816"
    xmlns:adr="http://viser.edu.rs/saranrt8816"
  >
  <xsl:output method="xml" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
    <Adresar xmlns="http://viser.edu.rs/saranrt8816" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://viser.edu.rs/saranrt8816 adresarXMLShema.xsd">
      <xsl:apply-templates/>
    </Adresar>
  </xsl:template>

  <xsl:template match="adr:Osoba">
    <xsl:element name="Osoba">
      <xsl:attribute name="sifra">
        <xsl:value-of select="@sifra"/>
      </xsl:attribute>
      <PunoIme>
        <Ime>
          <xsl:value-of select="adr:PunoIme/adr:Ime"/>
        </Ime>
        <xsl:if test="count(adr:PunoIme/adr:SrednjeIme)>0">
          <SrednjeIme>
            <xsl:value-of select="adr:PunoIme/adr:SrednjeIme"/>
          </SrednjeIme>
        </xsl:if>
        <Prezime>
          <xsl:value-of select="adr:PunoIme/adr:Prezime"/>
        </Prezime>
      </PunoIme>

      <DatumRodjenja>
        <Dan>
          <xsl:value-of select="adr:DatumRodjenja/adr:Dan"/>
        </Dan>
        <Mesec>
          <xsl:value-of select="adr:DatumRodjenja/adr:Mesec"/>
        </Mesec>
        <Godina>
          <xsl:value-of select="adr:DatumRodjenja/adr:Godina"/>
        </Godina>
      </DatumRodjenja>

      <xsl:apply-templates select="adr:Adresa"/>

      <xsl:element name="Telefon">
        <xsl:attribute name="tip">
          <xsl:value-of select="adr:Telefon/@tip"/>
        </xsl:attribute>

        <xsl:value-of select="adr:Telefon"/>
      </xsl:element>

      <xsl:element name="Email">
        <xsl:attribute name="tip">
          <xsl:value-of select="adr:Email/@tip"/>
        </xsl:attribute>

        <xsl:value-of select="adr:Email"/>
      </xsl:element>
    </xsl:element>



  </xsl:template>

  <xsl:template match="adr:Kompanija">
    <xsl:element name="Kompanija">
      <xsl:attribute name="sifra">
        <xsl:value-of select="@sifra"/>
      </xsl:attribute>

      <Naziv>
        <xsl:value-of select="adr:Naziv"/>
      </Naziv>

      <xsl:apply-templates select="adr:Adresa"/>

      <xsl:element name="Telefon">
        <xsl:attribute name="tip">
          <xsl:value-of select="adr:Telefon/@tip"/>
        </xsl:attribute>

        <xsl:value-of select="adr:Telefon"/>
      </xsl:element>

      <xsl:element name="Email">
        <xsl:attribute name="tip">
          <xsl:value-of select="adr:Email/@tip"/>
        </xsl:attribute>

        <xsl:value-of select="adr:Email"/>
      </xsl:element>
    </xsl:element>

  </xsl:template>

  <xsl:template match="adr:Adresa">
    <xsl:element name="Adresa">
      <xsl:attribute name="tip">
        <xsl:value-of select="@tip"/>
      </xsl:attribute>
      <xsl:attribute name="ulica">
        <xsl:value-of select="adr:Ulica"/>
      </xsl:attribute>
      <xsl:attribute name="broj">
        <xsl:value-of select="adr:Broj"/>
      </xsl:attribute>
      <xsl:attribute name="grad">
        <xsl:value-of select="adr:Grad"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
