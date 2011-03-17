Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Q0E43-00071Q-NH
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 15:20:36 +0100
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2HE1Gku007492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:01:16 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id p2HE1FAW015228
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:01:15 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2HE1FCv024008
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:01:15 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 17 Mar 2011 09:01:14 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Mar 2011 09:01:13 -0500
Thread-Topic: [oe] [PATCH][2011.003-maintenance] ti-pru-sw-example: fix
	building with new toolchain sysroot
Thread-Index: Acvkd16GYBmCfIdOS5603qR0NoK14QANFQLg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340AC4009@dlee06.ent.ti.com>
References: <1300296140-7275-1-git-send-email-Chase.Maupin@ti.com>
	<ilqv4v$66u$1@dough.gmane.org>
	<131E5DFBE7373E4C8D813795A6AA7F080340AC3EC2@dlee06.ent.ti.com>
	<ilse5o$fd4$1@dough.gmane.org>
In-Reply-To: <ilse5o$fd4$1@dough.gmane.org>
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
X-List-Received-Date: Thu, 17 Mar 2011 14:20:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Thursday, March 17, 2011 2:45 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH][2011.003-maintenance] ti-pru-sw-example: fix
> building with new toolchain sysroot
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 16-03-11 20:02, Maupin, Chase wrote:
> >> From: openembedded-devel-bounces@lists.openembedded.org
> >> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf O=
f
> >> Koen Kooi
> >> Sent: Wednesday, March 16, 2011 1:22 PM
> >> To: openembedded-devel@lists.openembedded.org
> >> Subject: Re: [oe] [PATCH][2011.003-maintenance] ti-pru-sw-example: fix
> >> building with new toolchain sysroot
> >>
> > On 16-03-11 18:22, Chase Maupin wrote:
> >>>> * Patch taken from Arago overlay where it was added by
> >>>>   Denys Dmytriyenko
> >>>> * PR incremented by two to align recipe PR values between Arago
> >>>>   and OE.
> >>>>
> >>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >
> > NAK, this hasn't been thru .dev yet.
> >
> >> Just submitted all 4 of my patches for .dev.  Thanks.
>=20
> I've staged them here:
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=3D2011.03-
> maintenance
> (subject to rebasing).
>=20
> Do you want to would for the pull request to go out tomorrow, or do you
> want Tom to pick up your patches seperately?

Looks like you already have them in your pull request #3 :)

Thanks.

>=20
> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFNgbv3MkyGM64RGpERAhAuAJ4iE8FFf/ZNqHJF06GSeOEhum9y+wCeOeMO
> drixfFNicVpKY2l05LPSynw=3D
> =3DNAy9
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


