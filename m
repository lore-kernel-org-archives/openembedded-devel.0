Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1IvSaO-0002E7-Gs
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2007 08:04:24 +0100
Received: (qmail invoked by alias); 23 Nov 2007 07:01:59 -0000
Received: from e178064220.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.64.220]
	by mail.gmx.net (mp058) with SMTP; 23 Nov 2007 08:01:59 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/lhOcBMrHlUHZI8kXwj+B46WOQngeG0e0/cTSH0m
	6eFESUX95dcvu5
Message-ID: <47467AE0.4070305@gmx.net>
Date: Fri, 23 Nov 2007 08:01:52 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1IvJbN-00085C-Mz@linuxtogo.org>
In-Reply-To: <E1IvJbN-00085C-Mz@linuxtogo.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] org.oe.dev cacao-cldc: fix RDEPENDS for libltdl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2007 07:04:24 -0000
X-Groupsio-MsgNum: 3421
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig2E30F83BF7F63018B3927849"

--------------enig2E30F83BF7F63018B3927849
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Henning.

woglinde2 commit schrieb:
> cacao-cldc: fix RDEPENDS for libltdl
> * cacao-cldc needs libltdl if executed

> -RDEPENDS =3D "virtual/cldc-api-1.1"
> +RDEPENDS =3D "virtual/cldc-api-1.1 libltdl"
Shouldn't shlibs find this out automatically?

Regards
Robert


--------------enig2E30F83BF7F63018B3927849
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHRnrlG9cfwmwwEtoRCG34AJ4i3Vu4ET9Gwn2XARbHv/as8DusJACfdQvY
3dOwgQFhY8len03DxJN9UY0=
=yG11
-----END PGP SIGNATURE-----

--------------enig2E30F83BF7F63018B3927849--
