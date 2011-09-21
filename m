Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6Ta3-0007J9-T3
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 22:39:44 +0200
Received: (qmail invoked by alias); 21 Sep 2011 20:34:24 -0000
Received: from p5B0A3DD1.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.61.209]
	by mail.gmx.net (mp058) with SMTP; 21 Sep 2011 22:34:24 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18dY21pb3IdO8QFH8N2LO9M9TqVGJuIBW6IRDzMTv
	nI+GpEBnaOz0qC
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:38:01 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
	<1316585520-18605-9-git-send-email-schnitzeltony@gmx.de>
	<j5c2u2$nn1$3@dough.gmane.org>
In-Reply-To: <j5c2u2$nn1$3@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201109212238.02112.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-xfce 08/11] gtk-xfce-engine: Bump to version 2.9.0 & minor cleanup
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
X-List-Received-Date: Wed, 21 Sep 2011 20:39:44 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday, September 21, 2011 09:15:14 AM Koen Kooi wrote:
> Op 21-09-11 08:11, Andreas M=C3=BCller schreef:
> > * Added xfce4-dev-tools-native to DEPENDS error message was |
> > gtk-xfce-engine-2.9.0/configure: line 12041: syntax error near unexpect=
ed
> > token `GTK,' | gtk-xfce-engine-2.9.0/configure: line 12041:
> > `XDT_CHECK_PACKAGE(GTK, gtk+-2.0, 2.20.0)' * Added cairo to
> > RDEPENDS_${PN} see [1]
> >=20
> > [1] http://mail.xfce.org/pipermail/xfce/2011-September/029144.html
>=20
> Cairo is a library, so the shlib resolver should pick it up automagically,
> isn't it doing that?
>=20
no error - wanted to be a good boy - will remove

Andreas


