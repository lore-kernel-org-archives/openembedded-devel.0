Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWG0Z-0003Aw-HY for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 00:53:23 +0200
Received: from f053040080.adsl.alicedsl.de ([78.53.40.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWFyJ-0002FE-Rl for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 22:51:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTimfr7RzTxkVzStFuwk-duMADhD3Pg@mail.gmail.com>
References: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
	<1307988638.4081.5.camel@mattotaupa>
	<BANLkTi=4kSE18LPqTyEgYRmZViJ4f+gGgw@mail.gmail.com>
	<BANLkTinVfs_kznrr9C9G2jtS516ud99Ltw@mail.gmail.com>
	<BANLkTinr27EvybkKQuG+i0ZWs6QthjxgcA@mail.gmail.com>
	<1307996077.4081.6.camel@mattotaupa>
	<BANLkTikxGpZbYYq55VtCKSdA_3T-VRO3fA@mail.gmail.com>
	<1308001690.4081.9.camel@mattotaupa>
	<BANLkTimfr7RzTxkVzStFuwk-duMADhD3Pg@mail.gmail.com>
Date: Tue, 14 Jun 2011 00:49:59 +0200
Message-ID: <1308005399.4081.58.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] enjoy: add alsa and autodetect gst modules. Without autodetect, enjoy segfaults. Without alsa, no sound is played
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
X-List-Received-Date: Mon, 13 Jun 2011 22:53:23 -0000
X-Groupsio-MsgNum: 32644
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GrAvR0qH/cOZj1CsKSFi"

--=-GrAvR0qH/cOZj1CsKSFi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 14.06.2011, 00:08 +0200 schrieb Pau Espin Pedrol:
> 2011/6/13 Paul Menzel <paulepanter@users.sourceforge.net>
>=20
> > Am Montag, den 13.06.2011, 23:16 +0200 schrieb Pau Espin Pedrol:
> > > 2011/6/13 Paul Menzel <paulepanter@users.sourceforge.net>
> > >
> > > > But maybe it should fail gracefully and not segfault.
> > >
> > > For sure, but imo this has nothing to do with this patch. I'm just ad=
ding
> > needed deps for the app to do its work as expected :)
> >
> > Of course.
> >
> > To improve Enjoy it would be perfect to report that problem to the
> > upstream developers. This would be the perfect solution for this
> > problem.

> I might find time to write and send a patch for that to emotion guys :)

Awesome! A report would be fine too. Maybe a developer already tackled
that or they have different ideas.


Thanks,

Paul

--=-GrAvR0qH/cOZj1CsKSFi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk32lBcACgkQPX1aK2wOHVheUQCfboa6k/oWegNIDqIPGNZmup9l
T0kAmQFoe0x9rHaVCLN8ziYVp5cxLC7p
=Cgwc
-----END PGP SIGNATURE-----

--=-GrAvR0qH/cOZj1CsKSFi--
