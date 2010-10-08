Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4MDQ-0003Pt-3S for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 01:19:05 +0200
Received: from f053047056.adsl.alicedsl.de ([78.53.47.56]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4MD5-0000Vu-H1 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 23:18:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTim9By3dRuBbtOveONnCHOso+SvtE2mTt+5yg1SZ@mail.gmail.com>
References: <1286500978.3659.60.camel@mattotaupa>
	<AANLkTim9By3dRuBbtOveONnCHOso+SvtE2mTt+5yg1SZ@mail.gmail.com>
Date: Sat, 09 Oct 2010 01:18:42 +0200
Message-ID: <1286579922.4113.6.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OT: `git am --scissors` (was: [PATCH] gtk+_2.20.1: add `pango-native` to `DEPENDS`)
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
X-List-Received-Date: Fri, 08 Oct 2010 23:19:05 -0000
X-Groupsio-MsgNum: 24544
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-2y89ep6jirf8WfI5hC1v"

--=-2y89ep6jirf8WfI5hC1v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 08.10.2010, 08:24 +0200 schrieb Frans Meulenbroeks:
> 2010/10/8 Paul Menzel <paulepanter@users.sourceforge.net>:
> > Dear OE folks,

[=E2=80=A6]

> > 8<-------------------------------------------------------------------->=
8
> > Date: Thu, 7 Oct 2010 13:43:58 +0200
> >
> > Since two or three days I am not able to build `gtk+_2.20.1.bb` anymore=
. I tried to revert to `gtk+.inc` 9730a2 [1] with

[=E2=80=A6]

> And please also don't type things before the --- like "Dear OE folks.
> Please do explanations below that line, so if your patch is accepted
> people can just do a git am without the need to modify the commit
> message.

I actually formatted my message this way because it should still be
possible to use `git am`. Please take a look at the option `--scissors`
in `git help am` or git help mailinfo`.

[=E2=80=A6]


Thanks,

Paul

--=-2y89ep6jirf8WfI5hC1v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyvpsYACgkQPX1aK2wOHVjPegCdGFNcrJBoQQDWp1wO+/1W/pFC
//cAoIUkMWfMedpDJDMoeoYrdFqFj3Fp
=zADU
-----END PGP SIGNATURE-----

--=-2y89ep6jirf8WfI5hC1v--
