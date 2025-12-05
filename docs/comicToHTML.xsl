<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- ROOT TEMPLATE -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Invincible Comic</title>
            </head>
            <body>
                <h1>Invincible – Dialogue Table</h1>
                
                <section id="contents">
                    <table border="1">
                        <tr>
                            <th>People</th>
                            
                        </tr>
                        
                        <!-- Apply template for each unique speaker -->
                        <!-- Loop through unique speaker names -->
                        <xsl:for-each select="distinct-values(//dialogue/@speaker)">
                            <xsl:sort/>
                            <xsl:variable name="speaker" select="string(.)" />
                            
                            <tr>
                                <!--name-->
                                <td><xsl:value-of select="$speaker"/></td>
                                <td></td>
                                
                                
                            </tr>
                        </xsl:for-each>
                        
                    </table>
                    
                </section>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
