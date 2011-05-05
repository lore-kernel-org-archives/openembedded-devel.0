Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QI5uP-0000xK-3R
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 23:16:29 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p45LDlsY002369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 May 2011 16:13:48 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id p45LDlbv027095
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 May 2011 16:13:47 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p45LDlUn021064
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 May 2011 16:13:47 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 5 May 2011 16:13:47 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 5 May 2011 16:13:47 -0500
Thread-Topic: [oe] [PATCH] ncurses: add missing patch file
Thread-Index: AcwLYQOqnnXnRGTDSDm23L/tCzLp9AACCSbw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034AF1C0E1@dlee06.ent.ti.com>
References: <1304618837-18698-1-git-send-email-Chase.Maupin@ti.com>
	<4DC304E9.6050103@mentor.com>
In-Reply-To: <4DC304E9.6050103@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] ncurses: add missing patch file
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
X-List-Received-Date: Thu, 05 May 2011 21:16:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Tom Rini
> Sent: Thursday, May 05, 2011 3:13 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] ncurses: add missing patch file
>=20
> On 05/05/2011 11:07 AM, Chase Maupin wrote:
> > * The 20110115 patch file has gone missing.  Add it to the
> >   OE repository like the previous patch file.
> > * Bump the PR
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>=20
> Maybe we need to consider just moving to vanilla 5.9 and drop 5.7?

I asked Koen to submit a pull request to the maintenance branch to add 5.9 =
so I agree there.  I just thought I would go ahead and submit a patch to th=
e dev branch to fix version 5.7 in case someone is using that version.

Personally I'm fine with going to 5.9 directly.

>=20
> --
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


