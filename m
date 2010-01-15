Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <christian.rueb@gmx.net>) id 1NVqaZ-0001AT-8s
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 19:08:06 +0100
Received: (qmail invoked by alias); 15 Jan 2010 18:05:50 -0000
Received: from p5B0ABEC8.dip.t-dialin.net (EHLO crmobile01.localnet)
	[91.10.190.200]
	by mail.gmx.net (mp008) with SMTP; 15 Jan 2010 19:05:50 +0100
X-Authenticated: #19296456
X-Provags-ID: V01U2FsdGVkX1+6noIf9Q66WpU+LSSd3upsJ1aj+xAjaZQKuGYnzz
	wsm/lv7VvVzoYj
From: Christian =?iso-8859-2?q?R=FCb?= <christian.rueb@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2010 19:05:44 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.32-trunk-686; KDE/4.3.4; i686; ; )
References: <1263504944-19914-1-git-send-email-christian.rueb@gmx.net>
	<201001151203.38856.christian.rueb@gmx.net>
	<20100115113801.GA18793@ibawizard.net>
In-Reply-To: <20100115113801.GA18793@ibawizard.net>
MIME-Version: 1.0
Message-Id: <201001151905.44889.christian.rueb@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.64000000000000001
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: christian.rueb@gmx.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] wpa-gui: add version 0.6.9 (Qt4 based)
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
X-List-Received-Date: Fri, 15 Jan 2010 18:08:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Am Friday, 15. January 2010 schrieb Petr =A9tetiar:
> Christian R=FCb <christian.rueb@gmx.net> [2010-01-15 12:03:38]:
>=20
> > > > On Friday, 15. January 2010 09:22:28 Koen Kooi wrote:
> > > Apart from it not being in git-format-patch format, yes.
> >=20
> > Actually I used git format-patch (with option -p to not generate stats =
=2D do
> > you want stats) to create the patch...
>=20
> But I think, that Koen meant it isn't in format he can push. Would be goo=
d to
> read [1], [2] and search throught mailing list archives for other patches=
 as
> example. And it's missing Signed-off line.
>=20
> -- ynezz
>=20
> 1. http://wiki.openembedded.net/index.php/GitPhraseBook#Commit_Message
> 2. http://wiki.openembedded.org/index.php/Commit_Policy

Thanks for this. I will prepare a better commit message for the patch. I ha=
ve already made a new one with git format-patch.
I cleaned the tree afterwards and tried to apply my patch, it does work but=
 complains about many whitespace errors, also a build afterwards worked.
The whitespace errors come from the patches within the patch. Is this OK, o=
r shall/can I do anything about this before submitting?

Cheers,
 Christian


