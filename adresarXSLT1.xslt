<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl" xmlns:adr="http://viser.edu.rs/saranrt8816"
>
  <xsl:template match="/">
    <html>
      <head>
        <title>XSLT1</title>
      </head>
      <body>
        <h2>Podaci o Osobama i Kompanijama koje sadrže više od dve email adrese</h2>
        <table border="1px">
          <tr>
            <th>Puno ime</th>
            <th>Datum rodjenja</th>
            <th>Naziv kompanije</th>
            <th>Adresa</th>
            <th>Telefon</th>
            <th>Email</th>
          </tr>
          <xsl:apply-templates />
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="adr:Osoba">
    <xsl:if test="count(adr:Email)>2">
      <tr>
        <td>
          <xsl:apply-templates select="adr:PunoIme"/>
        </td>
        <td>
          <xsl:apply-templates select="adr:DatumRodjenja"/>
        </td>
        <td bgcolor="lightgray" align="center">/</td>
        <td>
          <xsl:apply-templates select="adr:Adresa"/>
        </td>
        <td>
          <xsl:value-of select="adr:Telefon"/>
        </td>
        <td>
          <xsl:for-each select="adr:Email">
            <xsl:value-of select="text()"/>
            <br/>
          </xsl:for-each>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

  <xsl:template match="adr:Kompanija">
    <xsl:if test="count(adr:Email)>2">
      <tr>
        <td bgcolor="lightgray" align="center">/</td>
        <td bgcolor="lightgray" align="center">/</td>
        <td>
          <xsl:value-of select="adr:Naziv"/>
        </td>
        <td>
          <xsl:apply-templates select="adr:Adresa"/>
        </td>
        <td>
          <xsl:value-of select="adr:Telefon"/>
        </td>
        <td>
          <xsl:for-each select="adr:Email">
            <xsl:value-of select="text()"/>
            <br/>
          </xsl:for-each>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

  <xsl:template match="adr:PunoIme">
    <xsl:value-of select="adr:Ime"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="adr:SrednjeIme"/>
    <xsl:for-each select="adr:Prezime">
      <xsl:text> </xsl:text>
      <xsl:value-of select="text()"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="adr:DatumRodjenja">
    <xsl:value-of select="adr:Dan"/>.<xsl:value-of select="adr:Mesec"/>.<xsl:value-of select="adr:Godina"/>.
  </xsl:template>

  <xsl:template match="adr:Adresa">
    <xsl:value-of select="adr:Ulica"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="adr:Broj"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="adr:Grad"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="adr:Drzava"/>
  </xsl:template>

</xsl:stylesheet>
