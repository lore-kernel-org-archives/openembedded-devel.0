Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RbU77-0000BE-L3
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 10:30:02 +0100
Received: by wgbds11 with SMTP id ds11so4884625wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 01:23:02 -0800 (PST)
Received: by 10.216.132.147 with SMTP id o19mr2948610wei.7.1324027382589;
	Fri, 16 Dec 2011 01:23:02 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v10sm12230621wiy.23.2011.12.16.01.23.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 01:23:01 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
Date: Fri, 16 Dec 2011 10:22:57 +0100
Message-Id: <44FD6890-C4DA-4A40-B30F-BDADC690C21E@dominion.thruhere.net>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
	<jcetai$4n1$5@dough.gmane.org>
	<CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
To: Luo Zhenhua-B19537 <B19537@freescale.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH meta-oe 5/9] nerperf: add
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
X-List-Received-Date: Fri, 16 Dec 2011 09:30:02 -0000
X-Groupsio-MsgNum: 36158
Content-Type: multipart/signed;
	boundary="Apple-Mail=_26471746-7CB3-49C0-A20B-9AFD2DEEFC01";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_26471746-7CB3-49C0-A20B-9AFD2DEEFC01
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 16 dec. 2011, om 10:19 heeft Luo Zhenhua-B19537 het volgende =
geschreven:

> Hello Koen,=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-
>> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
>> Sent: Friday, December 16, 2011 3:52 PM
>>=20
>>> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0 =
+1,47
>>> @@ +DESCRIPTION=3D"Network performance benchmark including tests for
>>> TCP, UDP, sockets, ATM and more." +SECTION =3D "console/network"
>>> +HOMEPAGE =3D "http://www.netperf.org/" +LICENSE =3D "netperf"
>>=20
>> Can you include a comment on what type of license netperf is? MIT =
like, BSD like,
>> GPL like?
> [Luo Zhenhua-B19537] May I know which license type should be with =
following COPYING content?

That looks like a BSD or MIT derivative, maybe Beth can give us some =
guidance on what to use as LICENSE

regards,

Koen


>=20
>              Copyright (C) 1993 Hewlett-Packard Company
>                         ALL RIGHTS RESERVED.
>=20
>  The enclosed software and documentation includes copyrighted works
>  of Hewlett-Packard Co. For as long as you comply with the following
>  limitations, you are hereby authorized to (i) use, reproduce, and
>  modify the software and documentation, and to (ii) distribute the
>  software and documentation, including modifications, for
>  non-commercial purposes only.
>=20
>  1.  The enclosed software and documentation is made available at no
>      charge in order to advance the general development of
>      high-performance networking products.
>=20
>  2.  You may not delete any copyright notices contained in the
>      software or documentation. All hard copies, and copies in
>      source code or object code form, of the software or
>      documentation (including modifications) must contain at least
>      one of the copyright notices.
>=20
>  3.  The enclosed software and documentation has not been subjected
>      to testing and quality control and is not a Hewlett-Packard Co.
>      product. At a future time, Hewlett-Packard Co. may or may not
>      offer a version of the software and documentation as a product.
>=20
>  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
>      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
>      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
>      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
>      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
>      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
>      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
>      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
>      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
>=20
>  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
>      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
>      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
>      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
>=20
>=20
> Best Regards,
>=20
> Zhenhua
>=20


--Apple-Mail=_26471746-7CB3-49C0-A20B-9AFD2DEEFC01
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7rDfQACgkQMkyGM64RGpHgwgCguBePd2FnSk6enCKFNyLZLWVN
YDUAn3sydD2OMju1cLlOPeo0Ovq56O/6
=Zyuo
-----END PGP SIGNATURE-----

--Apple-Mail=_26471746-7CB3-49C0-A20B-9AFD2DEEFC01--
