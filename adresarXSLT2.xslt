<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
    xmlns:adr="http://viser.edu.rs/saranrt8816"
>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>XSLT2</title>
      </head>
      <body>
        <h2>Podaci o Osobama i Kompanijama čija je adresa stalna i datum rođenja u opsegu od 1990-2005 godine</h2>
        <table border="1px">
          <tr>
            <th>Puno ime</th>
            <th>Datum rodjenja</th>
            <th>Naziv kompanije</th>
            <th>Adresa</th>
            <th>Telefon</th>
            <th>Email</th>
          </tr>
          <xsl:for-each select="adr:Adresar/adr:Osoba">
            <xsl:if test="(adr:Adresa/@tip='stalna') and ((adr:DatumRodjenja/adr:Godina &gt; 1990) and (adr:DatumRodjenja/adr:Godina &lt; 2005))">
              <xsl:apply-templates select="."/>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="adr:Adresar/adr:Kompanija">
            <xsl:if test="adr:Adresa/@tip='stalna'">
              <xsl:apply-templates select="."/>
            </xsl:if>
          </xsl:for-each>
        </table>
        <h2>Podaci o Osobama čije prezime počinje sa slovom M i Kompanijama čiji naziv ima više od 6 karaktera</h2>
        <table border="1px">
          <tr>
            <th>Puno ime</th>
            <th>Datum rodjenja</th>
            <th>Naziv kompanije</th>
            <th>Adresa</th>
            <th>Telefon</th>
            <th>Email</th>
          </tr>
          <xsl:for-each select="adr:Adresar/adr:Osoba">
            <xsl:if test="starts-with(adr:PunoIme/adr:Prezime,'M')">
              <xsl:apply-templates select="."/>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="adr:Adresar/adr:Kompanija">
            <xsl:if test="string-length(adr:Naziv)>6">
              <xsl:apply-templates select="."/>
            </xsl:if>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="adr:Osoba">
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
  </xsl:template>

  <xsl:template match="adr:Kompanija">
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
