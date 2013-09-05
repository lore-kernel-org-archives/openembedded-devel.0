Return-Path: <joe@deserted.net>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4704C61855
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:01:33 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so885480ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=nXsXmR4MBHAETHHSPyKHSXSocih0F9lYkMAYfz6r4LU=;
	b=YLKSyiXuIUjTydIrgpJvqVdwYHjPOLCr/CsTvbjezl6VDgHHFvkFgQ21RRpuWUvo50
	7ZSyIwEpbQVFufBgDJsoukmI27qMRoZMNWkUZHpgEvgH99Yikx6BPyA0xlVc5aWepBto
	V9dzpPxX+LpkHdXSxr9KDsVi3/7N6ZPnxFxecxPwC3ki2mEKiP+3dydYMm/Il72aDsJA
	7d7R1kqvQhAfLxE62syDmP8xXH9ma7KAIC1DufVvJNtJgObbpVqF8QlSoGzpQlzZ46mK
	MEQ3MAZ5cD9f8iyFCQvOc3NG1E5vIuMpboNVzhXMU0OsuKnW5FiPOfroIDp0EBLkb8km
	WGzw==
X-Gm-Message-State: ALoCoQmJk3T6LHqCEZf7tV7kpFylsN0KhUcmQ8lA4C+6eHaGQWKH2KoISvTBtYPmKqBOyBGIkmvu
X-Received: by 10.14.113.137 with SMTP id a9mr13238058eeh.3.1378386094385;
	Thu, 05 Sep 2013 06:01:34 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id k7sm48494411eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:01:33 -0700 (PDT)
Date: Thu, 5 Sep 2013 09:01:29 -0400
From: Joe MacDonald <joe@deserted.net>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20130905130126.GE5086@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<20130904211411.GR3761@deserted.net>
	<CADkTA4PbVB2X9abGFMKsAt6NRaZxnZa1GK86e3L+=CGzNfswdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4PbVB2X9abGFMKsAt6NRaZxnZa1GK86e3L+=CGzNfswdA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 13:01:33 -0000
X-Groupsio-MsgNum: 46094
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline

--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.=
05 (Thu 00:39) Bruce Ashfield wrote:

> On Wed, Sep 4, 2013 at 5:14 PM, Joe MacDonald <joe@deserted.net> wrote:
> > Actually, after all of that, I do have a couple of additional requests
> > (beyond just the tweak to the commit log).
> >
> >    Explicitly cc:ing Bruce here since I'm intentionally not adding
> >    meta-virt@.  I've gotten bounced from it in the past as I'm not a
> >    subscriber and it's subscriber-only.
>=20
> :) I can't blame you for that, I share the pain (after bouncing off of oe=
-devel
> just a few days ago myself). Thanks for the cc.

*sigh*  I mean well.  I need to be a little less quick on sending an
email to ensure I've actually done (eg. added a cc) what I've claimed in
it.

> > [[oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.=
02 (Mon 09:20) Laszlo Papp wrote:
> >
> >> 1) The version in meta-virtualization is quite old. It is basically fr=
om 2009,
> >> and a lot of things has changed since then.
> >>
> >> 2) More importantly, this software is more like for networking rather =
than
> >> virtualization, so I think it was misplaced.
> >
> > SOB please?
> >
> >> ---
> >>  .../recipes-support/openflow/openflow_1.0.bb       | 32 +++++++++++++=
+++++++++
> >
> > Is this actually based on an OpenFlow 1.0 release, or has it always been
> > 1.0+git?  I don't have a copy of meta-virt around to check myself.  If
> > there was a real 1.0 recipe around, can we keep it as is and make this
> > openflow_git.bb, more in line with the other +git... recipes?
>=20
> The meta-virt recipe had the same _1.0.bb extension, and it's SRCREV line=
s up
> with the openflow-1.0.0 tag in the repository:

I didn't know that.  In that case, the recipe naming makes sense to me.
I'm ambivalent when it comes to source tarballs versus git repos and
tags.  What I'm looking at makes sense though.  Thanks for the
clarification.

-J.

>=20
> --------
>=20
> commit 5ccca75a69f99791659bcfbcf35353ab1921320a
> Author: Glen Gibb <grg@stanford.edu>
> Date:   Thu Dec 31 16:00:53 2009 -0800
>=20
>     docs: Update ChangeLog to include 1.0.0 information
>=20
> :100644 100644 2f13dd7... aa0e92e... M  ChangeLog
>=20
> -------
>=20
> So it's definitely an option to keep that recipe around as the tagged 1.0=
, and
> create a _git that tracks newer changes (where "newer" is relative, 2011 =
is
> the latest commit in that repo).
>=20
> Maybe someday, we'll get a working 1.x openflow to play with! :)
>=20
> Thanks for holding on this briefly, it did help.
>=20
> Bruce
>=20
> >
> >>  1 file changed, 32 insertions(+)
> >>  create mode 100644 meta-networking/recipes-support/openflow/openflow_=
1.0.bb
> >>
> >> diff --git a/meta-networking/recipes-support/openflow/openflow_1.0.bb =
b/meta-networking/recipes-support/openflow/openflow_1.0.bb
> >> new file mode 100644
> >> index 0000000..eb7770e
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/openflow/openflow_1.0.bb
> >> @@ -0,0 +1,32 @@
> >> +SUMMARY =3D "OpenFlow"
> >> +DESCRIPTION =3D "Open standard that enables researchers to run experi=
mental protocols in the campus networks"
> >> +HOMEPAGE =3D "http://www.openflow.org"
> >> +SECTION =3D "networking"
> >> +LICENSE =3D "GPLv2"
> >> +
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De870c934e2c3d6ccf085fd7cf0=
a1e2e2"
> >> +
> >> +SRCREV =3D "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
> >> +PV =3D "1.0+git${SRCPV}"
> >> +SRC_URI =3D "git://gitosis.stanford.edu/openflow.git;protocol=3Dgit"
> >> +
> >> +DEPENDS =3D "virtual/libc"
> >> +
> >> +EXTRA_OECONF +=3D "KARCH=3D${TARGET_ARCH}"
> >> +
> >> +PACKAGECONFIG ??=3D "libssl"
> >> +PACKAGECONFIG[libssl] =3D "--enable-ssl,--disable-ssl, openssl, libss=
l"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit autotools
> >> +
> >> +do_configure() {
> >> +    ./boot.sh
> >> +    oe_runconf
> >> +}
> >> +
> >> +do_install_append() {
> >> +     # Remove /var/run as it is created on startup
> >> +    rm -rf ${D}${localstatedir}/run
> >> +}
> >
> > And while we're in the neighbourhood, can we also clean up the
> > inconsistent spacing?
> >
> > Thanks.
> >
> > --
> > -Joe MacDonald.
> > :wq
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20
>=20
>=20
--=20
-Joe MacDonald.
:wq

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIogJ0ACgkQwFvcllog0Xx2vACgtBwEBMkW8C8SZzC3UVQM1G1J
vb0AnA6Qj4E4ViMn+XeKi9WBn6FwBfbb
=2oCK
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
