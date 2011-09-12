Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R38Dr-000653-2h for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 17:14:59 +0200
Received: from f053042012.adsl.alicedsl.de ([78.53.42.12]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R388v-0005hA-Uy for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 15:09:54 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Sep 2011 17:09:38 +0200
In-Reply-To: <4E6E1E32.6010307@dresearch-fe.de>
References: <1315581753-7944-1-git-send-email-sledz@dresearch-fe.de>
	<4E6E1E32.6010307@dresearch-fe.de>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315840192.4231.13.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernels
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
X-List-Received-Date: Mon, 12 Sep 2011 15:14:59 -0000
X-Groupsio-MsgNum: 34197
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-ZL+L01q860nX90HcajQP"

--=-ZL+L01q860nX90HcajQP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 12.09.2011, 16:58 +0200 schrieb Steffen Sledz:
> On 09.09.2011 17:22, Steffen Sledz wrote:
> > This patch is similar to the one in linux-libc-headers 2.6.23.
>=20
> No NACKs? Then i'll push this patch tomorrow to oe-dev master.

To make acking easier, it would be nice to have more information in the
commit message.

1. Reference or URL to the ID of the commit to 2.6.23.
2. What is the addition used for?
3. Has it been tested? How?

Otherwise the list seems to be pretty calm recently. I do not know how
it could be revived.


Thanks,

Paul

--=-ZL+L01q860nX90HcajQP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5uILMACgkQPX1aK2wOHVhJFgCcC8uFePmEgq7PWrmv/0doWhi7
meEAn0sm53JwkkiwuHLdpOrwxr4viVTh
=j/sz
-----END PGP SIGNATURE-----

--=-ZL+L01q860nX90HcajQP--
