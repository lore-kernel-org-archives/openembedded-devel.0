Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWDaC-00042N-ND for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 22:18:00 +0200
Received: from f053040080.adsl.alicedsl.de ([78.53.40.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWDXx-0004vw-4d for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 20:15:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTinr27EvybkKQuG+i0ZWs6QthjxgcA@mail.gmail.com>
References: <1307987531-2625-1-git-send-email-pespin.shar@gmail.com>
	<1307988638.4081.5.camel@mattotaupa>
	<BANLkTi=4kSE18LPqTyEgYRmZViJ4f+gGgw@mail.gmail.com>
	<BANLkTinVfs_kznrr9C9G2jtS516ud99Ltw@mail.gmail.com>
	<BANLkTinr27EvybkKQuG+i0ZWs6QthjxgcA@mail.gmail.com>
Date: Mon, 13 Jun 2011 22:14:37 +0200
Message-ID: <1307996077.4081.6.camel@mattotaupa>
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
X-List-Received-Date: Mon, 13 Jun 2011 20:18:00 -0000
X-Groupsio-MsgNum: 32640
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-2yVvXly3+AZItbsekjdA"

--=-2yVvXly3+AZItbsekjdA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 13.06.2011, 21:19 +0200 schrieb Pau Espin Pedrol:
> Well I wouldn't say it's a problem itself.. it's just how emotion works..=
.
> it uses that gstreamer module so it's a needed dep in order to run ;)

But maybe it should fail gracefully and not segfault.


Thanks,

Paul


--=-2yVvXly3+AZItbsekjdA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk32b60ACgkQPX1aK2wOHVieVQCbBNzAn4TFcIz9SNdJvS2OTsej
zhMAnAw4PqfOm2sPdhhYzKMlyH+wStLv
=tt39
-----END PGP SIGNATURE-----

--=-2yVvXly3+AZItbsekjdA--
