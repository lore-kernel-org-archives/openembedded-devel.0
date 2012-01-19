Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RnsDo-0004Au-0x
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 14:40:08 +0100
Received: (qmail invoked by alias); 19 Jan 2012 13:32:28 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.localnet) [95.222.156.232]
	by mail.gmx.net (mp019) with SMTP; 19 Jan 2012 14:32:28 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/uWm5yO9vuqjgE/KK9ZFPIWOhFtya+oNsATiX36u
	sMASauu8a1Kr2O
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2012 14:32:30 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.41.9-1.fc15.x86_64; KDE/4.6.5; x86_64; ; )
References: <1326731540-15786-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1326731540-15786-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201201191432.30260.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-gnome] evince: add cross-compile-fix.patch from classic oe to fix build error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2012 13:40:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday, January 16, 2012 05:32:20 PM Andreas M=FCller wrote:
> error message was
>=20
> | warning: failed to load external entity
> | "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl" cannot parse
> | /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
> | warning: failed to load external entity
> | "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl" cannot parse
> | /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
> | make[2]: *** [evince-C.omf] Error 1
>=20
> [1]
> http://cgit.openembedded.org/openembedded/tree/recipes/evince/evince/cross
> -compile-fix.patch
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@gmx.de>
ping


