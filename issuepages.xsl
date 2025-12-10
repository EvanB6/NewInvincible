<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="comicColl" as="document-node()+"
        select="collection('xml/?select=*.xml')"/>
    <!-- ROOT TEMPLATE -->
    <xsl:template match="/">
        <xsl:for-each  select="$comicColl">
            <xsl:variable name="filename" as="xs:string" select="current() ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml')"/>
        <xsl:result-document method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
            indent="yes" href="docs/{$filename}.html">
       <html>
           <head>
               <title> <xsl:value-of select="descendant::metadata/title || ' ' || descendant::metadata/issue"/></title>
               <link rel="stylesheet" type="text/css" href="webstyle.css" />
           </head>
           <body>
               <h1> Invincible Comic</h1>
               <div class="navbar"><nav>
                       <a href="index.html">Home</a> | <a href="">Issue 1</a> | <a href="">Issue 2</a> | <a href="">Issue 4</a> | <a
                           href="char.html">Characters</a>
               </nav></div>
               <xsl:apply-templates/>
           </body>
           
       </html> 
        
        </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="metadata">
        <section class="metadata">
            <h1><xsl:value-of select="descendant::metadata/title || ' ' || descendant::metadata/issue"/></h1>
            <h2><xsl:apply-templates select="creator"/></h2>
            <p><xsl:value-of select="publisher || ', ' || date|| '. Language: '|| language "/></p>
        </section>
        
    </xsl:template>
    
    <xsl:template match="page">
       <section class="page">
           <xsl:apply-templates/>
       </section> 
        
    </xsl:template>
    <xsl:template match="panel">
        <div class="panel">
            <xsl:if test="not(*)">
                <span class="info">Picture only.</span>
            </xsl:if>
            <xsl:apply-templates/>
        </div> 
        
    </xsl:template>
   <xsl:template match="dialogue">
       <span class="speaker"><xsl:value-of select="@speaker || ': '"/></span>
       <xsl:apply-templates/>
   </xsl:template>
    
    
    
</xsl:stylesheet>
