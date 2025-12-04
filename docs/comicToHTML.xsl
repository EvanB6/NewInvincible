<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    
    <xsl:template match ="/">
        <html>
            <head>
                <title>Invincible Comic</title>
                
            </head>
            <body>
                <h1></h1>
                <section id="contents">
                    <table>
                        <tr>
                            <th>People</th>
                            <th>Tech Mentioned</th>
                            <th>Locations Mentioned</th>
                        </tr>
                        
                        <!-- ebb: prepare the table of contents representing each descendant chapter heading,
                   Hint: use <xsl:apply-templates with @mode here.  -->
                        <xsl:apply-templates select="//chapter" mode="toc"/>
                    </table>
                </section>
                
                
                
            </body>
            
        </html>
    </xsl:template>
    <xsl:template match="speaker" mode="toc">
        <tr>
            
            <!-- Chapter Title linking to reading view -->
            <td>
                    <xsl:value-of select="speaker"/>
            </td>
            
            <!-- DISTINCT SORTED TECH -->
            <td>
                <xsl:for-each select="distinct-values(.//dialogue[@speaker=Omniman])">
                    <xsl:sort/>
                    <span><xsl:value-of select="."/></span><br/>
                </xsl:for-each>
            </td>
            
            
            
        </tr>
    </xsl:template>
    
</xsl:stylesheet>
