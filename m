Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLERT-0006Nd-QW
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 14:31:51 +0100
Received: (qmail invoked by alias); 01 Nov 2011 13:25:41 -0000
Received: from p5B0A3AE4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.228]
	by mail.gmx.net (mp061) with SMTP; 01 Nov 2011 14:25:41 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+eyMBc+J6e0ODQ1ZYCjnnRdsrk0gukMOfUhgKPnv
	vPIIN3DAXZ39Ym
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Nov 2011 14:30:12 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1320148597-10157-1-git-send-email-schnitzeltony@gmx.de>
	<j8omuq$1ht$1@dough.gmane.org>
In-Reply-To: <j8omuq$1ht$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201111011430.12670.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-gnome] gnome-control-center: fix unshipped packages
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
X-List-Received-Date: Tue, 01 Nov 2011 13:31:51 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, November 01, 2011 12:59:22 PM Koen Kooi wrote:
> Op 01-11-11 12:56, Andreas M=C3=BCller schreef:
> > warnings fixed: WARNING: For recipe gnome-control-center, the following
> > files were installed but not shipped in any package: WARNING:
> > /usr/share/mime/XMLnamespaces WARNING:   /usr/share/mime/version WARNIN=
G:
> > /usr/share/mime/subclasses WARNING:   /usr/share/mime/globs2 WARNING:
> > /usr/share/mime/globs WARNING:   /usr/share/mime/types WARNING:
> > /usr/share/mime/mime.cache WARNING:   /usr/share/mime/icons WARNING:
> > /usr/share/mime/generic-icons WARNING:   /usr/share/mime/treemagic
> > WARNING:   /usr/share/mime/magic WARNING:   /usr/share/mime/aliases
>=20
> THose aren't meant to be shipped, mime.bbclass should already package the
> stuff it needs.
How about adding a dummy package gnome-control-center-mime to clean up log =
and=20
keep further enthusiastic patchers away?

Andreas


