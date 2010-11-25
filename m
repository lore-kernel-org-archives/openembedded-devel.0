Received: from 5e980804.static.tld.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1PLeyh-0000ly-6K
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 17:47:24 +0100
Received: (qmail 5197 invoked by uid 2404007); 25 Nov 2010 16:46:10 -0000
X-clamdmail: clamdmail 0.18a
Received: from chello089073120020.chello.pl (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@89.73.120.20)
	by 5e980804.static.tld.pl with ESMTPA; 25 Nov 2010 16:46:10 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Nov 2010 17:46:39 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.36-0-generic; KDE/4.5.3; x86_64; ; )
References: <20101125163904.30680@gmx.net>
In-Reply-To: <20101125163904.30680@gmx.net>
MIME-Version: 1.0
Message-Id: <201011251746.40106.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 94.152.8.4
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: for doing screenshots from the command line - use scrot
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
X-List-Received-Date: Thu, 25 Nov 2010 16:47:24 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia czwartek, 25 listopada 2010 o 17:39:04 Alexander Stohr napisa=B3(a):
> scrot - this relatively old program should be a nice and handy alternative
> for doing screenshots on the command line on OE based system.
>=20
> invoke it by "scrot" and get e.g. "2010-11-25-170400_1280x1024_scrot.png".
> the offered set of options does look rather helpful for lots of common
> cases.
>=20
> binary file size on x86 was 64k. there is in fact a set of librarys neede=
d.
> its giblib & Imlib2 & X11 & Xext & Xau & freetype plus few more basic one=
s.

Can you compare it with fbgrab? Less deps and same work done.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz


