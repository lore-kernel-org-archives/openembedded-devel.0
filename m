Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Q9NiW-0002Zg-02
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 22:28:12 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3BKPt5i026449
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 15:25:55 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id p3BKPsrO000964
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 15:25:54 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3BKPswa013116
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 15:25:54 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Mon, 11 Apr 2011 15:25:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Apr 2011 15:25:39 -0500
Thread-Topic: [oe] ncurses-5.7 patch files are missing
Thread-Index: Acv4hgssiC0olgaTQoOGtFnfPN0hwQAADcjA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340D391B5@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080340D39191@dlee06.ent.ti.com>
	<20110411201207.GA30730@rhein.zuhause.netz>
	<131E5DFBE7373E4C8D813795A6AA7F080340D391AE@dlee06.ent.ti.com>
	<4DA362BD.3020703@mentor.com>
In-Reply-To: <4DA362BD.3020703@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: ncurses-5.7 patch files are missing
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
X-List-Received-Date: Mon, 11 Apr 2011 20:28:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Tom Rini
> Sent: Monday, April 11, 2011 3:21 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] ncurses-5.7 patch files are missing
>=20
> On 04/11/2011 01:17 PM, Maupin, Chase wrote:
> >> -----Original Message-----
> >> From: openembedded-devel-bounces@lists.openembedded.org
> >> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf O=
f
> >> Henning Heinold
> >> Sent: Monday, April 11, 2011 3:12 PM
> >> To: openembedded-devel@lists.openembedded.org
> >> Subject: Re: [oe] ncurses-5.7 patch files are missing
> >>
> >> On Mon, Apr 11, 2011 at 03:07:35PM -0500, Maupin, Chase wrote:
> >>> All,
> >>>
> >>> Has anyone else noticed that the patch files referred to in the
> >> ncurses_5.7 recipe are missing from the ftp site?  The patch files are=
:
> >>>
> >>> ncurses-5.7-20110108-patch.sh.bz2
> >>> ncurses-5.7-20110115.patch.gz
> >>>
> >>> Does anyone have these mirrored or can they be uploaded to a mirror
> like
> >> the Angstrom mirror?
> >>>
> >>>
> >>> Sincerely,
> >>> Chase Maupin
> >>
> >> Yes serval people reported that now, I have no acess to upload them. I
> >> guess koen will do it when he returns
> >> from elc.
> >
> > Henning,
> >
> > Thanks.  I didn't notice the reports on the mailing list.  I did howeve=
r
> notice that Tom Rini is adding ncurses version 5.9 to oe-core.  I wonder
> if maybe this should be ported over to the OE mainline or just stick with
> 5.7+patches for now until everything is moved to oe-core.  Anyone else
> have thoughts on this?
>=20
> It's already done (I got it in here first).

Tom, sorry about that.  I was looking at the 2011.03-maintenance branch ins=
tead of the master.

Koen, would you mind submitting a pull request with the ncurses_5.9 recipe =
to Tom for the 2011.03-maintenance branch when you get back?  We should be =
able to queue this up with some other patches from Sid and others.

>=20
> --
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


