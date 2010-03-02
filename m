Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NmOfn-0007Nj-43
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 10:45:55 +0100
Received: (qmail 8216 invoked by uid 813007); 2 Mar 2010 09:43:02 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Mar 2010 09:43:02 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 2 Mar 2010 10:42:50 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <1267478308.4739.245.camel@trini-m4400>
	<201003021236.04862.khimov@altell.ru>
In-Reply-To: <201003021236.04862.khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <201003021042.51552.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Cleanup / update QEMU related checks
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
X-List-Received-Date: Tue, 02 Mar 2010 09:45:56 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 2 marca 2010 o 10:36:04 Roman Khimov napisa=C5=82(a):
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 02 =D0=BC=D0=B0=D1=80=D1=82=
=D0=B0 2010 00:18:28 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Tom Rini =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > (aside: When can qemu-0.9.x die?).
>=20
> IMHO, it just about time to kill it, almost a year past since 0.10.x
> introduction and with all those changes 0.9.x is not working properly for
> locale generation anyway.

I think that we need to upgrade to qemu 0.12.x and kill all previous versio=
ns.=20

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




