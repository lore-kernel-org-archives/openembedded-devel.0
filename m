Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1STzve-0003Zv-Gs
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 20:23:30 +0200
Received: by wibhm14 with SMTP id hm14so3367617wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+oC+L98ti5CLLQefsmV8C0s4cSyI9Ch3X6aSqdXV3ws=;
	b=Hn4iqkVjz9zAxYokzqvrVgwA2ggbsPRfTFBv/zk1ei5deiEkvfNkFV87HO5WCujupe
	EQVeB0E7Gi5NS888d/NH+9/AnMuSUtUzWvsbnLwQ43+U8AOiMIaZvjQaSuaG7303Nx+q
	Ce9MVIlYG0T2BHz2YWz+vkFU2tNmCqb9020BHByztmuRug6H65LexuWAwqBtdWcB1+3g
	C63FYUc58W4pQ1oqNxbliusAW6kHz9KVx3cI/dHvVd11U9pXSKgUBwgSeRL+SK3dTtCJ
	ClhH8oYLqujV7VbcTAASIPtiYxnnwShSZ25xVEaBMK7W99o9R5hC+FoSqFSsba4cNPwh
	8iHw==
Received: by 10.180.8.69 with SMTP id p5mr22279009wia.17.1337019211336;
	Mon, 14 May 2012 11:13:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fo7sm36600099wib.9.2012.05.14.11.13.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 11:13:29 -0700 (PDT)
Date: Mon, 14 May 2012 20:13:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120514181329.GB3166@jama.jama.net>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
	<1337011834-24879-13-git-send-email-Chase.Maupin@ti.com>
	<CAPhnLPDYGfet15Wek+2yRpiJK1+FwLi5+HyZv63khU5v9WCrcw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED10138E31694@DLEE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10138E31694@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 12/69] atk: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 18:23:30 -0000
X-Groupsio-MsgNum: 38752
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline

--jho1yZJdad60DJr+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2012 at 05:49:26PM +0000, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Flanagan, Elizabeth [mailto:elizabeth.flanagan@intel.com]
> > Sent: Monday, May 14, 2012 12:30 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Maupin, Chase
> > Subject: Re: [oe] [PATCH 12/69] atk: Update LICENSE field version
> >=20
> > On Mon, May 14, 2012 at 9:09 AM, Chase Maupin
> > <Chase.Maupin@ti.com> wrote:
> > > * Update LICENSE field version from generic LGPL to GPLv2+ and
> > > =A0LGPLv2+ to reflect the real license version.
> > > * This change was based on setting in oe-core as well as code
> > > =A0inspection.
> > >
> > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > ---
> > > =A0recipes/atk/atk_1.30.0.bb | =A0 =A04 ++--
> > > =A01 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/recipes/atk/atk_1.30.0.bb
> > b/recipes/atk/atk_1.30.0.bb
> > > index b3505bf..23c6685 100644
> > > --- a/recipes/atk/atk_1.30.0.bb
> > > +++ b/recipes/atk/atk_1.30.0.bb
> > > @@ -1,9 +1,9 @@
> > > =A0DESCRIPTION =3D "An accessibility toolkit for GNOME."
> > > =A0SECTION =3D "x11/libs"
> > > =A0PRIORITY =3D "optional"
> > > -LICENSE =3D "LGPL"
> > > +LICENSE =3D "GPLv2+ LGPLv2+"
> >=20
> > This should be:
> >=20
> > LICENSE =3D "GPLv2+ & LGPLv2+"
> >=20
> > or whatever the operator is (Most likely & or |)
>=20
> I know that & works in oe-core, but when I use this in oe-classic I get b=
uild errors like:
>=20
> NOTE: Running task 432 of 513 (ID: 1, /home/a0271661/projects/arago-4.7/a=
rago-oe-dev/recipes/atk/atk_1.30.0.bb, do_patch)
> ERROR: Function SRC_DISTRIBUTECOMMAND failed
> NOTE: Task failed: ('function SRC_DISTRIBUTECOMMAND failed', '/home/a0271=
661/projects/arago-4.7/arago-tmp/work/armv7a-arago-linux-gnueabi/atk-1.30.0=
-r2/temp/log.SRC_DISTRIBUTECOMMAND.27742')
> ERROR: Logfile of failure stored in: /home/a0271661/projects/arago-4.7/ar=
ago-tmp/work/armv7a-arago-linux-gnueabi/atk-1.30.0-r2/temp/log.SRC_DISTRIBU=
TECOMMAND.27742
> Log data follows:
> | /home/a0271661/projects/arago-4.7/arago-tmp/work/armv7a-arago-linux-gnu=
eabi/atk-1.30.0-r2/temp/run.SRC_DISTRIBUTECOMMAND.27742: line 1288: /atk: N=
o such file or directory
> | ERROR: Function SRC_DISTRIBUTECOMMAND failed
> NOTE: package atk-1.30.0-r2: task do_distribute_sources: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/a0271661/projects/arago-4.7/arago-oe-dev/recipes/at=
k/atk_1.30.0.bb do_distribute_sources failed
> ERROR: Task 16 (/home/a0271661/projects/arago-4.7/arago-oe-dev/recipes/at=
k/atk_1.30.0.bb, do_distribute_sources) failed with exit code 1
>=20
> The line (1288) that is causing this error looks like:
>=20
> cd /home/a0271661/projects/arago-4.7/arago-tmp/deploy/glibc/sources/&/atk
> SRC_DISTRIBUTECOMMAND
>=20
> Looking at other recipes I noticed that when they had multiple licenses t=
hey used a space separated list and in the case of an or license option |.
>=20
> Any input on this would be appreciated.  I don't believe / is right becau=
se that would make it look like a path for the classes that use the license.

yes, special characters like '+'
http://git.openembedded.org/openembedded/commit/?id=3D1c25e6c73b219dc807778=
0567fb0fb515092b5cf
or '&' or even spaces
http://git.openembedded.org/openembedded/commit/?id=3D819fa4c451ea5a811b8dd=
78bbcbb38dc38c68aa4

break oe-classic, more about it
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032579.html

Cheers,

>=20
> >=20
> > The license field needs to be ast parsable in order for the
> > license
> > system to work.
> >=20
> > -b
> >=20
> > >
> > > -PR =3D "r1"
> > > +PR =3D "r2"
> > >
> > > =A0inherit gnome
> > >
> > > --
> > > 1.7.0.4
> > >
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-
> > bin/mailman/listinfo/openembedded-devel
> >=20
> >=20
> >=20
> > --
> > Elizabeth Flanagan
> > Yocto Project
> > Build and Release
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+xS0kACgkQN1Ujt2V2gBxMBQCfe9AJOG8Gx0zPO2Xcs59gcsIx
uOQAn2yNY4s1Cjg0g3qIxRa9/nUknnPc
=WrPt
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
