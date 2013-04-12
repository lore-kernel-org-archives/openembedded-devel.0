Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQheG-0003ac-Ao
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 19:20:35 +0200
Received: by mail-pa0-f45.google.com with SMTP id kl13so1564379pab.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 10:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=suf324j6hGl6W/XWCF16wTQbI01vdm9exN4zchqTwAE=;
	b=NIPwzJSbP8sWMfC4/Bit/zZrkCOnmdm68eSH/ZZU41JLXqbagGgbPxKwQa75dV2X5e
	aY+aDKdNO6MPoPECG2HV2wajx8TnYKjVvFdSqT1yvpWo6ldCNimixrEtvwxJZJejkKCs
	uui7OBpX9U29wIr4jQO7/cZY+c4eQpYH2k1kYZG9UyLHgaKK+lguioMtafbCVAhK8+YZ
	9cCD8SSwFBKZVtx/I6X2vG4KoGuh3rdFhUGpUHPEg2YgBCcg8W57IVwIzDxtttlKKfi7
	vNOZMHjXaVyNkE8HUQfCfdUi4osH/B6LhaHVEC3gQOa4wiRlOs2xcpduuUSYACsMMEOI
	53ug==
X-Received: by 10.66.172.77 with SMTP id ba13mr16451576pac.63.1365786182871;
	Fri, 12 Apr 2013 10:03:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ew5sm9272857pbc.9.2013.04.12.10.02.59
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 10:03:01 -0700 (PDT)
Date: Fri, 12 Apr 2013 19:02:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130412170255.GS2477@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
	<CALbNGRTq3D6XP=wLnMcd-LkFpF6id6AVQtBsHVdMS6GoxUwFYg@mail.gmail.com>
	<CAMKF1srFP+kbnqcCfM_z6U0w8wVWpZsqRj+ciHoo=o3t=X+8Rg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srFP+kbnqcCfM_z6U0w8wVWpZsqRj+ciHoo=o3t=X+8Rg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"enrico.scholz@sigma-chemnitz.de" <enrico.scholz@sigma-chemnitz.de>
Subject: Re: meta-systemd future vote Was: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Fri, 12 Apr 2013 17:20:38 -0000
X-Groupsio-MsgNum: 44098
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9hshNW4m6zn79FF/"
Content-Disposition: inline

--9hshNW4m6zn79FF/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 05:51:43PM -0700, Khem Raj wrote:
> On Wednesday, April 10, 2013, Andreas M=FCller <schnitzeltony@googlemail.=
com>
> wrote:
> > On Tue, Apr 9, 2013 at 10:01 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> On Tue, Mar 05, 2013 at 11:59:07PM +0100, Martin Jansa wrote:
> >>> On Tue, Mar 05, 2013 at 11:50:41PM +0100, Andreas M=FCller wrote:
> >>> > On Tue, Mar 5, 2013 at 11:18 PM, Martin Jansa <martin.jansa@gmail.c=
om>
> wrote:
> >>> > > On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
> >>> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> > >
> >>> > > good old meta-systemd should now parse again,
> >>> > Thanks - will come back to test HEADs soon.
> >>>
> >>> But be aware that I've fixed only parsing of avahi and wpa-supplicant.
> >>>
> >>> I haven't tested it properly in runtime because my upgrade path is a =
bit
> >>> broken (because I was building images with khem's patches for a while=
 to
> >>> test other stuff) and even clean build with failed to boot with
> >>> qemux86-64 and I don't have time to debug it now.
> >>>
> >>> > > I wont apply this 2 commits
> >>> > > until systemd discussion in oe-core is finished and future of
> >>> > > meta-systemd decided.
> >>> > >
> >>> > After systemd regression is worked around yocto 1.4 release regress=
ion
> >>> > is knocking at the door...
> >>>
> >>> yes :/
> >>>
> >>> If we need to maintain meta-systemd bbappends for upgrade path we can
> >>> also maintain them with PN-systemd packages and good old systemd
> bbclass.
> >>
> >> Khem pinged me about this patch, so here are my thoughts:
> >>
> >> PN-systemd discussion in oe-core haven't moved a bit since this patch
> >> was proposed, I think we have 2-3 options, lets vote about meta-systemd
> future.
> >>
> >> 1) keep PN-systemd separation in meta-systemd and fixup .bbappends to
> >> resolve issues created by oe-core (I've fixed some issues, but still a
> >> lot of issues in postinst/postrm/prerm scripts when both inits are
> >> sharing the same PN)
> >>
> >> 2) give up on clean separation of PN-<init> and provide upgrade path
> >> from PN-systemd to PN (mostly done by these 2 commits from khem).
> >>
> >> 3) give up on clean separation of PN-<init> and upgrade path (there are
> >> many issues in other parts of oe-core, so upgrade path from danny to
> >> dylan doesn't look usable.
> >>
> >> A) migrate existing .bbappends to their recipes to .bb files and
> >> remove this layer. Any volunteer for that?
> >>
> >> My vote: 3) + A) later in 1.5
> > A bit off-topic and mentioned here & there: I am working on
> > network-manager(-applet) 0.9.8.0 update and xinput-calibrator. I could
> > add 3) + A) for them if agreed. Hope to send them beginning of next
> > week.
> >
>=20
> Sure I see no problem

OK, all systemd related changes should be now in master.

I'll do A) for meta-efl.

If someone starts working on A) for some other recipes, please write reply=
=20
here so that we don't duplicate work.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9hshNW4m6zn79FF/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFoPj8ACgkQN1Ujt2V2gBwkhQCeKZhtop6s3Fb2FmPaKlcU6EDM
cgcAn2xDHF4aqoDycoFkvCOdD1/shv3q
=dG6J
-----END PGP SIGNATURE-----

--9hshNW4m6zn79FF/--
