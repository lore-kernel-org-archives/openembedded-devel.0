Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfDXH-0002mZ-FV for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 18:04:13 +0200
Received: from f053043179.adsl.alicedsl.de ([78.53.43.179]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfDTv-0003xj-Et; Fri, 08 Jul 2011 16:00:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1310140540.4517.1.camel@mattotaupa>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
	<CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
	<1310140540.4517.1.camel@mattotaupa>
Date: Fri, 08 Jul 2011 18:00:18 +0200
Message-ID: <1310140818.4517.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com,
	k-kooi@ti.com
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Fri, 08 Jul 2011 16:04:13 -0000
X-Groupsio-MsgNum: 33078
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9MgMxy7TzEkF+BI/jSnb"

--=-9MgMxy7TzEkF+BI/jSnb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Just adding back everyone to CC list.]


Am Freitag, den 08.07.2011, 17:55 +0200 schrieb Paul Menzel:
> Am Donnerstag, den 07.07.2011, 21:55 -0500 schrieb Joel A Fernandes:
> > >> As far as I understood system mode can sometimes be the right thing =
to
> > >> do but most of the time it is just a configuration error. Running PA=
 and
> > >> printing out the debug messages should give you a clue.
> > >
> > > Pulseaudio isn't printing any debug messages to syslog or stdout ( -v=
v
> > > -log-level pulseaudio options )
> > >
> > > Here was the thread on BeagleBoard mailing list that discusses this i=
ssue:
> > > http://groups.google.com/group/beagleboard/browse_thread/thread/4dc82=
483a8d000fb/ccbd0e21fa5e89a0
> > >
> > > I will post the details of the problem on the pulseaudio mailing list
> > > and try to get some other alternatives.
> > >
> > > For now, can we temporarily merge this patch while I followup with th=
em?
> >=20
> > Here is a discussion I started on the pulseaudio list:
> > http://lists.freedesktop.org/archives/pulseaudio-discuss/2011-July/0105=
65.html
>=20
> Thank you very much for bringing this issue to upstreams attention.
>=20
> Regarding to pushing this patch, I am still a little confused since you
> wrote to the PA list you are using PA 0.9.15 and your patch is against
> 0.9.22.
>=20
>=20
> Thanks,
>=20
> Paul

--=-9MgMxy7TzEkF+BI/jSnb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4XKZIACgkQPX1aK2wOHVjv6gCfS51Onqh9VrzU7tjddxvcFxNz
omQAnjl6QJAHSv7bLu+skeGFftEPK1OO
=ohsN
-----END PGP SIGNATURE-----

--=-9MgMxy7TzEkF+BI/jSnb--
