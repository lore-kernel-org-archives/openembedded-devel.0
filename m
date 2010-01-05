Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NS9Ta-000137-E2 for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 14:29:37 +0100
Received: from g225142234.adsl.alicedsl.de ([92.225.142.234]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NS9Rd-0001aN-AN for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 13:27:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262694630.3209.10.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1262649107.3238.44.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100105095147.GA3433@rhein.zuhause.netz>
	<1262694630.3209.10.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Tue, 05 Jan 2010 14:27:26 +0100
Message-ID: <1262698046.3209.28.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Tester needed for `bitbake vdr` (was: [bitbake vdr] /arm-angstrom-linux-gnueabi/bin/ld: cannot find -lintl)
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
X-List-Received-Date: Tue, 05 Jan 2010 13:29:37 -0000
X-Groupsio-MsgNum: 15408
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-B5c4Gwqp2RPaopHQmGJk"

--=-B5c4Gwqp2RPaopHQmGJk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear list,


Am Dienstag, den 05.01.2010, 13:30 +0100 schrieb Paul Menzel:
> Am Dienstag, den 05.01.2010, 10:51 +0100 schrieb Henning Heinold:
> > seems I forgot the depency. Will check them in later. This happens when=
 one
> > done build vom clean oetmp.
>=20
> I merged your changes, did `bitbake -c clean vdr`, `bitbake vdr` and
> still get the same errors as yesterday/this night. I also tried `bitbake
> libintl` manually with no success.
>=20
> Is there something messed up with my setup?

just to rule this out, can someone please try a test build on his/her
system (merge current Git HEAD of org.openembedded.dev and do `bitbake
vdr`) and report back to this list


Thanks,

Paul

--=-B5c4Gwqp2RPaopHQmGJk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktDPj4ACgkQPX1aK2wOHVg/dACcDnbcMBvv1lC2N+AU9WzBFImw
UC8AnikdRqVZ1u8+ewl2Qz+jaHtuMEx+
=mGr9
-----END PGP SIGNATURE-----

--=-B5c4Gwqp2RPaopHQmGJk--
