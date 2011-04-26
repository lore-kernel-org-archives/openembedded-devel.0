Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEcxU-0006Fp-0m for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 09:45:20 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEcvq-0000jb-16 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 07:43:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080340C6812C@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080340C6812C@dlee06.ent.ti.com>
Date: Tue, 26 Apr 2011 09:42:51 +0200
Message-ID: <1303803771.4073.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Unused patches in x-load-git directory
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
X-List-Received-Date: Tue, 26 Apr 2011 07:45:20 -0000
X-Groupsio-MsgNum: 31460
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/wvd/ZPu5ytE5rouS+76"

--=-/wvd/ZPu5ytE5rouS+76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Chase,


Am Montag, den 04.04.2011, 09:50 -0500 schrieb Maupin, Chase:

> I noticed that there are 5 patches in the recipes/x-load/x-load-git direc=
tory that do not seem to be used by any recipes.  At least one of the patch=
es seems to have been merged into the upstream project (http://gitorious.or=
g/x-loader/x-loader/commits/master).  Is anyone using the patches below?  I=
f not then I'll submit a patch to remove them.
>=20
> 0001-OMAP4-clocks-Enable-only-required-clks.patch
> 0002-OMAP4-Select-DPLL-PER-Clock-as-source-for-SGX-FCLK.patch
> 0003-MUX-Configure-SYS_NIRQ2-pin-in-safe-mode.patch
> 0004-OMAP4-clocks-Disable-slimbus-and-pad_clks.patch
> 0005-omap4-Make-1GHz-as-default-MPU-clock.patch

please send a patch to remove those. It would be great if you could
reference the upstream commits by URLs in the commit message.


Thanks,

Paul

--=-/wvd/ZPu5ytE5rouS+76
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk22d3sACgkQPX1aK2wOHVhu+ACeN1PjSBsNWU6txpZyNtBlsI5u
j5AAnjQ5kr5Wqh/iXimRKD/j02MTaHyl
=8QHS
-----END PGP SIGNATURE-----

--=-/wvd/ZPu5ytE5rouS+76--
