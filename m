Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nr4VX-0000v6-Hc
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 08:14:40 +0100
Received: (qmail 26474 invoked by uid 813007); 15 Mar 2010 07:11:35 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 15 Mar 2010 07:11:35 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 08:10:36 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <20100310103133.14548.62608.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<1268423765.1625.18.camel@rex>
	<201003142109.30696.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003142109.30696.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <201003150810.36885.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Allow spectrum fw to build behind a proxy
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
X-List-Received-Date: Mon, 15 Mar 2010 07:14:40 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 14 marca 2010 o 21:09:29 Marcin Juszkiewicz napisa=B3(a):
> Dnia pi=B1tek, 12 marca 2010 o 20:56:05 Richard Purdie napisa=B3(a):
> > Ah, I remember this now. It is not a bitbake bug put a base.bbclass bug
> > as something somewhere has incorrect quoting. Its been fixed in Poky but
> > probably should be pushed into OE too. If you find the commit where I
> > last touched the spectrum-fw driver you'll find the core class change
> > too I suspect. It'd be good to get synced up on that.
>=20
> Attached is that changeset. I will look at it tomorrow if someone will not
> merge it before.

Merged this, fixed distribute sources class, merged spectrum-fw from Poky.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




