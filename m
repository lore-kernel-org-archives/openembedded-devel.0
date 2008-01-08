Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1JCHdO-00073w-Qh
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 17:49:03 +0100
Received: (qmail invoked by alias); 08 Jan 2008 16:42:00 -0000
Received: from e178115083.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.115.83]
	by mail.gmx.net (mp011) with SMTP; 08 Jan 2008 17:42:00 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/UDioUl3PU2gqslziH+jbDVBGcEUB7HSyIZ/wj9A
	ti2ROMlEl+RtOm
Message-ID: <4783A7D7.4020206@gmx.net>
Date: Tue, 08 Jan 2008 17:41:59 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47836C9B.3000407@gmx.net> <200801081527.09859.zecke@selfish.org>
In-Reply-To: <200801081527.09859.zecke@selfish.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: RFC: add osso version of libtool and libatk
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
X-List-Received-Date: Tue, 08 Jan 2008 16:49:03 -0000
X-Groupsio-MsgNum: 3822
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigB3C2852E186727E230D5F435"

--------------enigB3C2852E186727E230D5F435
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
I can live with the plain versions, too. For libtool I re-added 1.5.6 as
discussed on IRC. I will prepare a similar patch for atk.

Holger Freyther schrieb:
> On Tuesday 08 January 2008 13:29:15 Robert Schuster wrote:
>> Hi,
>> on IRC it was suggested to put this on the mailing list.
>=20
> Hey,
> I don't like adding vendor hacked versions of standard software at all.=
 I see=20
> the requirement you are facing but adding a Nokia hacked version is not=
 the=20
> right way to do it.
>=20
> What are the differences you see? Can you extract the patch that is doi=
ng=20
> that? Is that patch a good idea and can be applied to our version of li=
btool?
>=20
>=20
> kind regards
> 	z.
>=20
>=20
> PS: I care more for libtool than atk+ (did they break API/ABI compabili=
ty on=20
> it?)=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enigB3C2852E186727E230D5F435
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHg6fXG9cfwmwwEtoRCCvuAKCHHxR5zV2BbGtvyMtdB8durGl99gCdH4XE
eaFkuhn4Lty2tgSYbEQCOmo=
=Xlnl
-----END PGP SIGNATURE-----

--------------enigB3C2852E186727E230D5F435--
