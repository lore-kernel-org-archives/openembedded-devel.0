Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qvsg3-0008W2-FU for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 17:14:07 +0200
Received: from f053042082.adsl.alicedsl.de ([78.53.42.82]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QvsbX-00023L-L5 for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 15:09:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Aug 2011 17:09:23 +0200
In-Reply-To: <1314033226.12202.25.camel@mattotaupa>
References: <1314023559-15827-1-git-send-email-noor_ahsan@mentor.com>
	<1314033226.12202.25.camel@mattotaupa>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314112164.3688.17.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH][meta-oe] lmbench: Added 3.0-a9 version recipe files
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
X-List-Received-Date: Tue, 23 Aug 2011 15:14:07 -0000
X-Groupsio-MsgNum: 33791
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-aShWS3FhGmf7BHekV/Zv"

--=-aShWS3FhGmf7BHekV/Zv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 22.08.2011, 19:13 +0200 schrieb Paul Menzel:

> Am Montag, den 22.08.2011, 19:32 +0500 schrieb Noor, Ahsan:

> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
> > +	   file://lmbench-run \
> > +	   file://rename-line-binary.patch \
> > +	   file://update-results-script.patch \
> > +	   file://obey-ranlib.patch"
>=20
> Please add `\` at the end and put " on the new line.

As to your question on IRC why this is useful. My reasoning is, that in
the future patch diffs will be smaller when adding a new line to the end
of `SRC_URI`. But in the end it is just taste and no hard rule.

[=E2=80=A6]


Thanks,

Paul

--=-aShWS3FhGmf7BHekV/Zv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5TwqMACgkQPX1aK2wOHVgHQgCeLbazoEMvYRozlU1W/eEGPXSX
QTsAmgImYJJo1HFovvwIU0dHeZ8hkQd/
=0+Us
-----END PGP SIGNATURE-----

--=-aShWS3FhGmf7BHekV/Zv--
