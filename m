Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Q0HzG-0000Im-7S
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 19:31:54 +0100
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2HIU8l2002939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 17 Mar 2011 13:30:08 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id p2HIU8Qp024825;
	Thu, 17 Mar 2011 13:30:08 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2HIU7Lj024927;
	Thu, 17 Mar 2011 13:30:07 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 17 Mar 2011 13:30:06 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Tom Rini <tom_rini@mentor.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Mar 2011 13:30:05 -0500
Thread-Topic: [oe] [2011.03-maintenance] Pull request #3
Thread-Index: Acvkz0FA+6D0n10XR4yQMlpRFB61vQAAgqTA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340AC410D@dlee06.ent.ti.com>
References: <ilt06r$gji$1@dough.gmane.org> <4D824F9A.8020903@mentor.com>
In-Reply-To: <4D824F9A.8020903@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Pull request #3
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
X-List-Received-Date: Thu, 17 Mar 2011 18:31:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Tom Rini [mailto:tom_rini@mentor.com]
> Sent: Thursday, March 17, 2011 1:15 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: Re: [oe] [2011.03-maintenance] Pull request #3
>=20
> On 03/17/2011 05:52 AM, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Tom,
> >
> > Please pull the 11 commits from here:
> >
> > URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> > Branch: 2011.03-maintenance
> >
> > Koen Kooi (7):
> >        angstrom 2011.03 blacklist bash-noemu
> >        task-omap-drivers: task for commonly needed drivers on omap chip=
s
> >        *beagleboard-validation: collection of tasks iand images to serv=
e
> >        task-beagleboard*: add changes from latest round of feedback
> >        linux-omap-psp 2.6.32: add support for xM revision C
> >        linux-omap-psp 2.6.32: bump PR
> >        u-boot git: update beagleboard u-boot to 2011.03-RC
> >
> > chase maupin (4):
> >        u-boot.inc: allow variable make targets
> >        dm368-evm: Add configuration for DM368 machine
> >        matrix-gui: add support for dm386-evm machine
> >        ti-pru-sw-example: fix building with new toolchain sysroot
> >
> >
> > You can view the branch online at
> > http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=3D2011.03=
-
> maintenance
> >
> > The bash-noemu and u-boot commits both have a one line change compared
> > to .dev to account for the differences between angstrom versions. The
> > other 9 commits are straight cherry-picks.
>=20
> Merged, thanks.
>=20
> > I can pick up the external-toolchain patches from Ben for next weeks
> > pull request if you wish.
>=20
> I've grabbed these with pw-am.sh and updated patchwork.  Chase, can you
> please update patchwork to reflect that your changes have been applied?
>   Thanks!

Tom, I'll take care of that now.  Thanks.

>=20
> --
> Tom Rini
> Mentor Graphics Corporation


