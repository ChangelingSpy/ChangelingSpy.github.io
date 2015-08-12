<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template match="*">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="/">
    <html>
    <head>
    <title><xsl:value-of select="/squad/name"/></title>
    <link rel="stylesheet" type="text/css" href="/css/squad.css">
    </link>
    </head>
    <body>
    <div id="wrap">
      <div id="header"><img id="squad_logo" src="/img/paa.png" alt="Picture: Squad Logo"/><div class="title"><xsl:value-of select="/squad/name"/></div>
			<p><span class="header_info">Tag: </span>[<xsl:value-of select="/squad/@nick"/>]</p>
			<p><span class="header_info">Title: </span><xsl:value-of select="/squad/title"/></p>
			<p><span class="header_info">Email: </span><xsl:value-of select="/squad/email"/></p>
			<p><span class="header_info">Web Site: </span><a>
			  <xsl:attribute name="href"><xsl:value-of select="/squad/web"/></xsl:attribute>
			  <xsl:value-of select="/squad/web"/></a></p>
      </div>
      <!--Main - members -->
      <div id="members">
        <table class="main">
          <thead>
            <tr class="plsqs" valign="top">
              <td class="plh">Members</td>
              <td class="plh">Player-ID</td>
              <td class="plh">e-mail</td>
              <td class="plh">ICQ</td>
            </tr>
          </thead>
          <xsl:for-each select="/squad/member">
            <tr>
              <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 0">
                  one
                </xsl:when>
                <xsl:otherwise>
                  two
                </xsl:otherwise>
              </xsl:choose>
              </xsl:attribute>
              <td class="member_name" rowspan="2"><xsl:value-of select="name"/></td>
              <td class="player_id"><xsl:value-of select="@id"/></td>
              <td class="member_email"><a>
                <xsl:attribute name="href">mailto: <xsl:value-of select="email"/> </xsl:attribute>
                <xsl:value-of select="email"/> </a></td>
              <td class="member_icq"><xsl:value-of select="icq"/></td>
            </tr>
            <tr> 
              <!-- Alternance des couleurs (Nombre pair/ impair)-->
              <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="position() mod 2 = 0">
                  one
                </xsl:when>
                <xsl:otherwise>
                  two
                </xsl:otherwise>
              </xsl:choose>
              </xsl:attribute>
              <td class="member_remark" colspan="3"><strong>Remark : </strong><xsl:value-of select="remark"/></td>
            </tr>
          </xsl:for-each>
        
        <!-- Member Info Table --> 
        <!--Main TABLE -->
        </table>
      </div>
	  <div id="footer">
      	<p style="font-family:verdana;font-size:7pt;color:darkgrey;text-align:center;padding:10px;">"squad.xsl" by <a href="http://dtclan.co.uk">Zakun</a> || "Squad.xml Generator" by <a href="http://dtclan.co.uk">Zakun</a> </p>
	  </div>
    </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>