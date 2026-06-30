<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" encoding="utf-8" indent="yes"
    doctype-system="about:legacy-compat"/>

  <xsl:template match="/atom:feed">
    <html lang="en">
    <head>
      <meta charset="utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <title><xsl:value-of select="atom:title"/> — Web feed</title>
      <style>
        :root {
          --bg: #fbfaf8; --surface: #fff; --text: #2b2a27; --muted: #6b6a64;
          --faint: #93918a; --accent: #3f7a60; --accent-soft: #ecf3ef;
          --border: #e9e6e0;
          --sans: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
          --serif: "Iowan Old Style", "Palatino Linotype", Palatino, Georgia, serif;
        }
        @media (prefers-color-scheme: dark) {
          :root {
            --bg: #1a1917; --surface: #211f1c; --text: #e9e7e2; --muted: #a8a59d;
            --faint: #7c7a73; --accent: #8fcaac; --accent-soft: #21302a;
            --border: #322f2b;
          }
        }
        * { box-sizing: border-box; }
        body {
          margin: 0; background: var(--bg); color: var(--text);
          font-family: var(--sans); line-height: 1.7;
          -webkit-font-smoothing: antialiased;
        }
        .wrap { max-width: 44rem; margin: 0 auto; padding: 3.5rem 1.5rem 4rem; }
        a { color: var(--accent); text-decoration-thickness: 1px; text-underline-offset: 3px; }
        .kicker {
          font-size: .72rem; font-weight: 600; letter-spacing: .12em;
          text-transform: uppercase; color: var(--accent); margin: 0 0 .6rem;
        }
        h1 {
          font-family: var(--serif); font-size: 2.2rem; line-height: 1.15;
          letter-spacing: -.015em; margin: 0 0 .4rem;
        }
        .sub { color: var(--muted); margin: 0 0 1.5rem; font-size: 1.05rem; }
        .note {
          background: var(--accent-soft); border-radius: 12px;
          padding: 1rem 1.2rem; font-size: .92rem; color: var(--muted);
          margin-bottom: 2.5rem;
        }
        .note strong { color: var(--text); }
        ul { list-style: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: .75rem; }
        li {
          background: var(--surface); border: 1px solid var(--border);
          border-radius: 14px; padding: 1.4rem 1.5rem;
        }
        .post-title {
          font-family: var(--serif); font-size: 1.3rem; font-weight: 600;
          line-height: 1.3; color: var(--text); text-decoration: none;
        }
        .post-title:hover { color: var(--accent); }
        .date { font-size: .82rem; color: var(--faint); margin-top: .3rem; }
        .summary { margin: .6rem 0 0; color: var(--muted); font-size: .97rem; }
        footer { margin-top: 3rem; font-size: .82rem; color: var(--faint); text-align: center; }
      </style>
    </head>
    <body>
      <div class="wrap">
        <p class="kicker">Web feed</p>
        <h1><xsl:value-of select="atom:title"/></h1>
        <p class="sub"><xsl:value-of select="atom:subtitle"/></p>

        <div class="note">
          <strong>This is a web feed,</strong> meant to be read in a feed reader.
          Copy this page's address into an app like NetNewsWire, Feedly, or
          Reeder to follow new posts. New to feeds?
          <a href="https://aboutfeeds.com/">Learn more</a>.
          <br/>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="atom:link[@rel='alternate']/@href"/>
            </xsl:attribute>
            ← Back to the site
          </a>
        </div>

        <ul>
          <xsl:for-each select="atom:entry">
            <li>
              <a class="post-title">
                <xsl:attribute name="href">
                  <xsl:value-of select="atom:link/@href"/>
                </xsl:attribute>
                <xsl:value-of select="atom:title"/>
              </a>
              <div class="date">
                <xsl:value-of select="substring(atom:published, 1, 10)"/>
              </div>
              <p class="summary"><xsl:value-of select="atom:summary"/></p>
            </li>
          </xsl:for-each>
        </ul>

        <footer>
          <xsl:value-of select="atom:author/atom:name"/>
        </footer>
      </div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
