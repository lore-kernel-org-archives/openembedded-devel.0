Return-Path: <dl9pf@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0543E780DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 15:49:42 +0000 (UTC)
Received: from samweis.auenland.lan ([91.0.195.130]) by mail.gmx.com (mrgmx103
	[212.227.17.168]) with ESMTPSA (Nemesis) id 0MRXVc-1dOa7i2S8O-00Scc1;
	Wed, 24 May 2017 17:49:42 +0200
From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 May 2017 17:49:41 +0200
Message-ID: <7538973.q8dPMGDrMN@samweis.auenland.lan>
User-Agent: KMail/4.14.10
	(Linux/4.9.0-rc1-jsm-cowfix-20161020-2241-00145-gf4814e6;
	KDE/4.14.25; x86_64; ; )
In-Reply-To: <CA+chaQc+Lzfkx0=0r_2cwLcRT3CuFhAqgq46Kdn7wh0_moE6BA@mail.gmail.com>
References: <20170524153407.22969-1-dl9pf@gmx.de>
	<CAMKF1spe_4B86YGpY-SmNw6K-deJqnT5j1mDDSn7bqtiB1SpLg@mail.gmail.com>
	<CA+chaQc+Lzfkx0=0r_2cwLcRT3CuFhAqgq46Kdn7wh0_moE6BA@mail.gmail.com>
MIME-Version: 1.0
X-Provags-ID: V03:K0:q6PuhP52YdWd41dOZIppdSZLxlW/RhFRQfK0/jsApzUzVvbKzRJ
	cwd6rYcj+Rf4SKWlXwGkFVCgEZTSPPxHvYTwrZ2Ha7MG7bLBiLCAkU4WOy3QaOkQ7WQHEe+
	sV+yJbjFxHwFBAIpwRKDkhnKFXu6B7X1xA6r0oToeJj/zOgUmSHIAfn03p/ucKQpHID+f9p
	ux6zxUI4PgNXMFJKW+dmw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:9GO7CY4UTc0=:+Ffp2Gt2FdN5Nbsusmdd+A
	oSdFDx9hc884bApdTiVGMtVdE7lul4yA1eCSGeCj3AyUvzjmwifKqiBXNoFASysKFnDm0mUzT
	UCP69mogYmB22zUiPrsVkM7NYq2tNfZql/y3nmHTQSc1m2lxDhzMjXY9+mz6ijbpWUf/KAFrD
	d1G/8dmm/5r0EbeC4DGjT3mBjEMurXwCY4j03pKZFSpkeTwBk/yzH5lAOTH3CJF9vmEZB1zXa
	cvx/Bo35qr1xF5jPSeGllDLJhPTx9QU/J8aNyi7DrBL9Xs33QKlYrJaLIYRcxauMEnoaYht8a
	SD7QgvHf3bdKSOFs+qjp1vCw0k3nOZ0kklf4xKv3qY4+/zud6d6EtoZOT7mTJxYRn0n7kDLmU
	sDaHXdcIY0DD7B7Z0I43RhMubRVBaWyWNRmh2EfjwQiP2X1fJgTjsOxfWlRKT4MXU/UQhS6Qc
	GwuLAAEl2OsKbp1DKfLdz1PaPOpUqwf8SLNR72BElRVpxiyoXbzhEyNangIyDDr+qVVMiBoWc
	pYQLdopMhwGfiu8Vxo/HdXpVeLLVTG3wx5W90JI9Sz78qXpys9lN6iSk/KHTXkKeIGy4dHn7H
	Y4T19aYNGnonbC5NxvBX3iML9JSr124wYscYksoAO7q3WDh2tvoX74joo4S97efaiLUJini+a
	5c1UxtG1fcTedtUSI9SU1SOippunOfdMRc7OulxIChSiKU7u0iY9Bb1njaudS00o24Q16dt61
	06R05YPLGKsA4xHyaVuNLkXQlB+twj9tWzf9HeIx5P2gqE/br03KbjJcEiOZnAuFtJazRq30L
	DWYxlp3
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-oe][master, morty] sg3-utils upstream SRC_URI unavailable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 May 2017 15:49:44 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi !

On Wednesday 24 May 2017 17:45:10 Martin Jansa wrote:
> Why do you introduce the bbappend instead of fixing it in
> ./meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb ?

I assumed we can remove the mirror url when upstream is back or we have=
 a=20
better new upstream. That's why the bbappend.=20
I can submit it right in-place if you prefer that.

>=20
> It should be on sources.openembedded.org (everything built in my bitb=
ake
> world should be rsynced there, will check where it got broken this ti=
me).

Unfortunately it is not there.

Best,

--=20

Dipl.-Ing.
Jan-Simon M=F6ller

jansimon.moeller@gmx.de

>=20
> On Wed, May 24, 2017 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:=

> > On Wed, May 24, 2017 at 8:34 AM,  <dl9pf@gmx.de> wrote:
> > > From: Jan-Simon M=F6ller <dl9pf@gmx.de>
> > >=20
> > > This patch temporarily fixes the unavailable upstream URL for sg3=
-utils
> > > with an bbappend that redirects the SRC_URI to a mirror.
> > > Checksums match.
> > >=20
> > > Signed-off-by: Jan-Simon M=F6ller <dl9pf@gmx.de>
> > > ---
> > >=20
> > >  meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend | 2 ++=

> > >  1 file changed, 2 insertions(+)
> > >  create mode 100644 meta-oe/recipes-support/sg3-
> >=20
> > utils/sg3-utils_1.42.bbappend
> >=20
> > > diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bba=
ppend
> >=20
> > b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
> >=20
> > > new file mode 100644
> > > index 000000000..aeef696cf
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
> > > @@ -0,0 +1,2 @@
> > > +# Upstream URL currently unavailable. Use mirror:
> > > +SRC_URI =3D "https://fossies.org/linux/misc/sg3_utils-${PV}.tgz"=

> >=20
> > Can we also host it on sources.openembedded.org please ?
> >=20
> > > --
> > > 2.12.0
> > >=20
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel=

> >=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel


