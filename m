Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QyMLf-0000c2-9U
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 13:19:19 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QyMGv-0004kJ-N4 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 04:14:25 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 30 Aug 2011 13:14:22 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5068A594E@eu2-mail.mgc.mentorg.com>
In-Reply-To: <j3i2f3$iel$1@dough.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [meta-oe][PATCH v2 3/4] lmbench: Add version 3.0-a9
	(initial recipe)
Thread-Index: Acxm5Jc+xsJ0FO0/QJSaMmkbhdwcbgAIUYdg
References: <cover.1314603785.git.noor_ahsan@mentor.com><d64d7f3b4f4c6ffeda342ce8df7ba1561fcb47b0.1314603785.git.noor_ahsan@mentor.com>
	<j3i2f3$iel$1@dough.gmane.org>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 3/4] lmbench: Add version 3.0-a9 (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 11:19:19 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
Of
> Koen Kooi
> Sent: Tuesday, August 30, 2011 12:12 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v2 3/4] lmbench: Add version 3.0-a9
> (initial recipe)
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 29-08-11 10:17, Noor, Ahsan schreef:
> > From: Noor Ahsan <noor_ahsan@mentor.com>
> >
> > * Imported from oe.dev commit id
> bac6441118e0b78d55c98afdc108f03b6c655909.
> >
> > Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
>=20
> You need to send a follow up patch to fix:

Sorry .... I am sending debianutils package pull request.

>=20
> > diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb new file mode
> 100644 index 0000000..7efdad5 --- /dev/null +++ b/meta-oe/recipes-
> benchmark/lmbench/lmbench_3.0-a9.bb
>=20
> > +RDEPENDS_${PN} =3D "debianutils" +FILES_${PN} +=3D =
"${datadir}/lmbench"
>=20
> NOTE: Runtime target 'debianutils' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['debianutils']
> ERROR: Required build target 'lmbench' has no buildable providers.
> Missing or unbuildable dependency chain was: ['lmbench',
'debianutils']
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFOXI0iMkyGM64RGpERAty/AJ9x8m6MshXyIi8mbORyEGRFYqXtQgCbB4xB
> RHmSVE72NyAih3MsEaLn/Rk=3D
> =3DHWaT
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


