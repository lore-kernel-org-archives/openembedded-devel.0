Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7wFM-0005Zm-3V for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 22:23:53 +0200
Received: from f053035105.adsl.alicedsl.de ([78.53.35.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7wEq-0007xc-Go for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:23:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinTuHWBgzbTcZdnrsSGuGmiqgs2fgPc3koE1fCJ@mail.gmail.com>
References: <1287405781.3928.22.camel@mattotaupa>
	<AANLkTinTuHWBgzbTcZdnrsSGuGmiqgs2fgPc3koE1fCJ@mail.gmail.com>
Date: Mon, 18 Oct 2010 22:23:18 +0200
Message-ID: <1287433398.3927.1.camel@mattotaupa>
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
Subject: Re: opensp_1.5: `do_compile` fails with for example `RastEventHandler.cxx:(.text+0x7f0): undefined reference to `OpenSP::Sd::execToInternal(char const*) const'`
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
X-List-Received-Date: Mon, 18 Oct 2010 20:23:53 -0000
X-Groupsio-MsgNum: 25081
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-aDY0FbZfUUE9juyJYl4+"

--=-aDY0FbZfUUE9juyJYl4+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 18.10.2010, 11:39 -0700 schrieb Khem Raj:
> On Mon, Oct 18, 2010 at 5:43 AM, Paul Menzel wrote:

> > trying to build openjade to test ab83ea [1], task `do_compile` of
> > `opensp_1.5.bb` [2] fails with the following error with `minimal`
> > (eglibc) for `MACHINE =3D "beagleboard"`.
>=20
> is it a regression ? did it built ok without this patch ?

Well, `opensp_1.5.bb` was not changed as far as I can see. So I do not
think it is a regression. I will try it anyway.


Thanks,

Paul

--=-aDY0FbZfUUE9juyJYl4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky8rLEACgkQPX1aK2wOHVi4ogCfcJYWxfUFbs2e8wPTumvtZF4g
1NgAnj6GqHdo4HnFBPhUMfqf4lSnQbpW
=Gipf
-----END PGP SIGNATURE-----

--=-aDY0FbZfUUE9juyJYl4+--
