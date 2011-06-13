Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWF2k-0001rZ-3g for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 23:51:34 +0200
Received: from f053040080.adsl.alicedsl.de ([78.53.40.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWF0U-0000iE-Jq for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 21:49:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTikxGpZbYYq55VtCKSdA_3T-VRO3fA@mail.gmail.com>
References: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
	<1307988638.4081.5.camel@mattotaupa>
	<BANLkTi=4kSE18LPqTyEgYRmZViJ4f+gGgw@mail.gmail.com>
	<BANLkTinVfs_kznrr9C9G2jtS516ud99Ltw@mail.gmail.com>
	<BANLkTinr27EvybkKQuG+i0ZWs6QthjxgcA@mail.gmail.com>
	<1307996077.4081.6.camel@mattotaupa>
	<BANLkTikxGpZbYYq55VtCKSdA_3T-VRO3fA@mail.gmail.com>
Date: Mon, 13 Jun 2011 23:48:10 +0200
Message-ID: <1308001690.4081.9.camel@mattotaupa>
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
X-List-Received-Date: Mon, 13 Jun 2011 21:51:34 -0000
X-Groupsio-MsgNum: 32642
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-etK55CJndx2YFOOo+IRm"

--=-etK55CJndx2YFOOo+IRm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 13.06.2011, 23:16 +0200 schrieb Pau Espin Pedrol:
> 2011/6/13 Paul Menzel <paulepanter@users.sourceforge.net>
>=20
> > But maybe it should fail gracefully and not segfault.
>
> For sure, but imo this has nothing to do with this patch. I'm just adding=
 needed deps for the app to do its work as expected :)

Of course.

To improve Enjoy it would be perfect to report that problem to the
upstream developers. This would be the perfect solution for this
problem.


Thanks,

Paul

--=-etK55CJndx2YFOOo+IRm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk32hZoACgkQPX1aK2wOHVjjwACbBgsb15hdhfjnXb7QvbHfH3pw
ZfMAoIMRlyR1RWF8ewR5N5Nu4MPuYpv1
=Xwnv
-----END PGP SIGNATURE-----

--=-etK55CJndx2YFOOo+IRm--
