Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Pzw1O-0001NZ-GY
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 20:04:38 +0100
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2GJ2uS0021235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 14:02:56 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id p2GJ2ugl025754
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 14:02:56 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2GJ2uTL029855
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 14:02:56 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Wed, 16 Mar 2011 14:02:55 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Mar 2011 14:02:54 -0500
Thread-Topic: [oe] [PATCH][2011.003-maintenance] ti-pru-sw-example: fix
	building with new toolchain sysroot
Thread-Index: AcvkC5JfgzRXLSNfQ6SNtPH5HpW63QAAR/yQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340AC3EC2@dlee06.ent.ti.com>
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
X-List-Received-Date: Wed, 16 Mar 2011 19:04:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

Just submitted all 4 of my patches for .dev.  Thanks.

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


