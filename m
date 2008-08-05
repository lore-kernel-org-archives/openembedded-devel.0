Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KQHsd-0003GM-0e
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Aug 2008 10:26:55 +0200
Received: (qmail invoked by alias); 05 Aug 2008 08:24:45 -0000
Received: from e178070176.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.70.176]
	by mail.gmx.net (mp029) with SMTP; 05 Aug 2008 10:24:45 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+fOHYaUNCfILPnp5akY5Dj0artlDMifOZRg74sFw
	0Qts6ym4jyrBJO
Message-ID: <48980E9D.8000709@gmx.net>
Date: Tue, 05 Aug 2008 10:26:05 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48239d390808040638r7a5e6351x4c8346497451adae@mail.gmail.com>
In-Reply-To: <48239d390808040638r7a5e6351x4c8346497451adae@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.66
Cc: Dmitry <dbaryshkov@gmail.com>
Subject: Re: ppc64 host
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
X-List-Received-Date: Tue, 05 Aug 2008 08:26:55 -0000
X-Groupsio-MsgNum: 5690
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig9E7CDF9E8D613F91127B3F10"

--------------enig9E7CDF9E8D613F91127B3F10
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Sergey Lapin schrieb:
> Hi, all!
>=20
> Do anybody had any success running OE builds on ppc64 host?
just send this boxen over to me and I'll check it out.


Just kidding! :)

> If not, is there any advice regarding that?
You might run into trouble when qemu needs to execute some stuff from
the target platform as they do not list[0] ppc64 host cpu support
explicitly.

Otherwise follow the steps are applicable for other distros/CPUs as
well: /bin/sh needs to be bash etc.

Would be cool if you tell us whether you have success.

Regards
Robert

[0] - http://bellard.org/qemu/status.html



--------------enig9E7CDF9E8D613F91127B3F10
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkiYDqMACgkQG9cfwmwwEtqZNgCfV1NqcYjq8ku0z9VDuKZhPDcP
LccAn32sIZw5l7QgGoN5Bz29v2uiV6Y5
=oZt7
-----END PGP SIGNATURE-----

--------------enig9E7CDF9E8D613F91127B3F10--
