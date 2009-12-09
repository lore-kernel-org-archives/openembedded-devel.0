Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NIIgx-0002hd-2c
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 10:18:42 +0100
Received: (qmail 17045 invoked by uid 813007); 9 Dec 2009 09:16:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 9 Dec 2009 09:16:57 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 9 Dec 2009 10:16:32 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc7-00029-ga9366e6-dirty; KDE/4.3.2;
	x86_64; ; )
References: <cover.1260305960.git.mike@compulab.co.il>
	<e06121f7b6525c76d4ab12258365dcc926d7729e.1260305960.git.mike@compulab.co.il>
	<hfmmdq$qkr$1@ger.gmane.org>
In-Reply-To: <hfmmdq$qkr$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200912091016.53077.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 3/5] cm-t35: add machine configuration
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
X-List-Received-Date: Wed, 09 Dec 2009 09:18:42 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 9 grudnia 2009 o 00:10:51 Koen Kooi napisa=C5=82(a):
> On 08-12-09 22:11, Mike Rapoport wrote:
> > Signed-off-by: Mike Rapoport<mike@compulab.co.il>
> >
> > +MACHINE_EXTRA_RRECOMMENDS =3D "omap3-sgx-modules marvell-sdio-fw"
>=20
> The current sgx release and all the following ones will have
> omap3-sgx-modules built directly from the .bin, so everyone building a
> task-base based images will have to request that from TI. Do you really
> want that?

As so called maintainer of mistical UmbaUmba out-of-tree distribution I als=
o=20
would like to not have 'omap3-sgx-modules' in extra rrecommends as I do not=
=20
need it to run text based systems (unless someone wrote OpenGL accelerated=
=20
text console which I know nothing about it).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




