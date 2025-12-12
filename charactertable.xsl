<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="comicColl" as="document-node()+"
        select="collection('xml/?select=*.xml')"/>
    <!-- ROOT TEMPLATE -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Invincible Comic</title>
                <link rel="stylesheet" type="text/css" href="webstyle.css" />
            </head>
            <body>
             
                <div class="navbar"><nav>
                        <a href="index.html">Home</a> | <a href="">Issue 1</a> | <a href="">Issue 2</a> | <a href="issue_3.html">Issue 3</a> |<a href="">Issue 4</a> | <a
                            href="char.html">Characters</a>
                </nav></div>
                <h1>Invincible – Issue 1-4 Characters</h1>
                
                <section id="contents">
                    <table border="1">
                        <tr>
                            <th>People</th>
                            <th>dialogue</th>
                            
                        </tr>
                        
                        <!-- Apply template for each unique speaker -->
                        <!-- Loop through unique speaker names -->
                        <xsl:variable name="char" select="$comicColl//dialogue/@speaker => distinct-values()"/>
                        <xsl:for-each select="$char">
                            <xsl:sort select="$comicColl//dialogue[@speaker=current()]=>count()" order="descending"/>
                            <tr>
                                <td><xsl:value-of select="current()"/></td>
                                <td><xsl:value-of select="$comicColl//dialogue[@speaker=current()]=>count()"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    
                </section>
            </body>
        </html>
    </xsl:template>
    
    
</xsl:stylesheet>
