Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <theBohemian@gmx.net>) id 1IgMK9-0005w0-Ew
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2007 17:21:18 +0200
Received: (qmail invoked by alias); 12 Oct 2007 15:15:07 -0000
Received: from e178077248.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.77.248]
	by mail.gmx.net (mp001) with SMTP; 12 Oct 2007 17:15:07 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19xjZ031u1x4SnnQTpxn4bSaCJABKcoMybCc0ga3P
	8XMWeFgbB6n9Ol
Message-ID: <470F8F75.3070207@gmx.net>
Date: Fri, 12 Oct 2007 17:15:01 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: IceDove 1.5.0.12 (X11/20070730)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <HOECLKEKOHLAMMGDLLBHCEDKMIAA.skoroneos@digital-opsis.com>
In-Reply-To: <HOECLKEKOHLAMMGDLLBHCEDKMIAA.skoroneos@digital-opsis.com>
X-Enigmail-Version: 0.94.2.0
X-Y-GMX-Trusted: 0
Subject: Re: patch: fix patch num in glibc 2.3.3+cvs20050221
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
X-List-Received-Date: Fri, 12 Oct 2007 15:21:32 -0000
X-Groupsio-MsgNum: 3118
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigC103547793F901FB342D195E"

--------------enigC103547793F901FB342D195E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
sorry! I know it should be put to the bug tracker but I thought this one
was trivial.

Regards
Robert

Stelios Koroneos schrieb:
> Robert,
>=20
> please post any patches to the bugtracker
>=20
> Stelios S. Koroneos
>=20
> Digital OPSiS - Embedded Intelligence
> http://www.digital-opsis.com
>=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@openembedded.org
>> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of Rober=
t
>> Schuster
>> Sent: Friday, October 12, 2007 9:23 AM
>> To: openembedded-devel@openembedded.org
>> Subject: [oe] patch: fix patch num in glibc 2.3.3+cvs20050221
>>
>>
>> Hi,
>> while trying to build glibc_2.3.3+cvs20050221 I noticed that one of th=
e
>> patches does not apply. It is simply using a wrong strip value. The
>> attached little patch fixes that.
>>
>> Would someone apply this? I dont have commit rights.
>>
>> Regards
>> Robert
>>
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enigC103547793F901FB342D195E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHD495G9cfwmwwEtoRCFz5AJ9CS7hrHtSgrfkT/TywqCXty/7luACeNSZw
P3Z6IHWL2XyUzo75+Up82PU=
=eSa+
-----END PGP SIGNATURE-----

--------------enigC103547793F901FB342D195E--
