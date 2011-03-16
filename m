Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Pzvvb-0000y6-Eb
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 19:58:39 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2GIut5X007838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:56:55 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p2GIutB5016593
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:56:55 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2GIutxD025695
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:56:55 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Wed, 16 Mar 2011 13:56:54 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Mar 2011 13:56:53 -0500
Thread-Topic: [oe] [PATCH][2011.003-maintenance] ti-pru-sw-example: fix
	building with new toolchain sysroot
Thread-Index: AcvkC5JfgzRXLSNfQ6SNtPH5HpW63QAAChYg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340AC3EB6@dlee06.ent.ti.com>
References: <1300296140-7275-1-git-send-email-Chase.Maupin@ti.com>
	<ilqv4v$66u$1@dough.gmane.org>
In-Reply-To: <ilqv4v$66u$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH][2011.003-maintenance] ti-pru-sw-example: fix building with new toolchain sysroot
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
X-List-Received-Date: Wed, 16 Mar 2011 18:58:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Wednesday, March 16, 2011 1:22 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH][2011.003-maintenance] ti-pru-sw-example: fix
> building with new toolchain sysroot
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 16-03-11 18:22, Chase Maupin wrote:
> > * Patch taken from Arago overlay where it was added by
> >   Denys Dmytriyenko
> > * PR incremented by two to align recipe PR values between Arago
> >   and OE.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>=20
> NAK, this hasn't been thru .dev yet.

Koen,

OK, so I think this answers my question about whether to submit to .dev, oe=
-core, or what before the maintenance branch.  I'll submit all my patches t=
o .dev shortly.

Chase

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFNgP/fMkyGM64RGpERAl6xAJ45EJRtCFR9OXVfx47vHziPgljS8ACgnYLG
> F8X61AnjZTX5/ctbDUvuhMI=3D
> =3D9ZrC
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


