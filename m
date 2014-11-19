Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 888897214B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 15:37:15 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so5793092wiw.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 07:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4s4J3XfVNdp6jNu3bwFjAXp2sm5QfdGkXL9LSXZ08mc=;
	b=u/GHDdBlmQlC+p7wHl9ohnyMXvRdjhUjEYudYICfHJpiupt3WwusKQxD11AiPP600i
	7NatFAhTbt2GyDvYdC+nwYZEJIbv/T+eflAHZDLJm8SRgxAoDkOfKS7DBBQ/ZmawYqHa
	3udwvQR6Yk92yg0Vg/ngIcB/TAlnSCZ25xxxxVKjrELVU3DvSuxvCyt+oTaZvGfJJ/ih
	PWQ/Oc4Df2m7WcN/Tj+/Yj3RliPs5wlArNRBY7bcRXHD+tjBs3L7s4y/JR2xIvGzvyWC
	mVsk/aEXhiH7yzq+BKQ8YSQQWBfoP76tvSuGeDCwDA2VsDG6Yg3QahAigMQt+FWp8nQB
	qrVQ==
X-Received: by 10.180.98.170 with SMTP id ej10mr14513693wib.74.1416411435560; 
	Wed, 19 Nov 2014 07:37:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vm8sm2771824wjc.6.2014.11.19.07.37.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 07:37:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 16:37:14 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119153714.GO3315@jama>
References: <1415645193-14565-1-git-send-email-cmorgan@cybexintl.com>
	<20141119144901.GJ3315@jama>
	<CAAPegz3PPzLqUOgcQqc20zxjDnzP8T5_Xhcf6i=zZcjtsqoNMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAPegz3PPzLqUOgcQqc20zxjDnzP8T5_Xhcf6i=zZcjtsqoNMg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] dfu-util: Point to gitorious.org repository as gnumonks.org is down
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
X-List-Received-Date: Wed, 19 Nov 2014 15:37:22 -0000
X-Groupsio-MsgNum: 52941
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4D23EFnZpzTzcHd"
Content-Disposition: inline

--z4D23EFnZpzTzcHd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 09:53:49AM -0500, Chris Morgan wrote:
> On Wed, Nov 19, 2014 at 9:49 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Mon, Nov 10, 2014 at 01:46:33PM -0500, Chris Morgan wrote:
> >> ---
> >>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 9 ++++++---
> >>  1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-o=
e/recipes-support/dfu-util/dfu-util_0.7.bb
> >> index aa2b84d..c706fd1 100644
> >> --- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> >> +++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> >> @@ -4,7 +4,10 @@ AUTHOR =3D "Harald Welte <laforge@openmoko.org>"
> >>  LICENSE =3D "GPLv2"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f"
> >>
> >> -SRC_URI =3D "http://${BPN}.gnumonks.org/releases/${BP}.tar.gz \
> >> +S =3D "${WORKDIR}/${BPN}-${BPN}"
> >> +
> >> +REV=3D"a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
> >> +SRC_URI =3D "https://gitorious.org/${BPN}/${BPN}/archive/${REV}.tar.g=
z \
> >
> > Aren't archives on gitorious generated ad-hoc like on github (changing
> > SRC_URI checksums from time to time)?
> >
> > Why not use git repo on gitorious?
> >
> >>      file://0001-configure.ac-Don-t-check-for-usbpath.patch \
> >>  "
> >>
> >> @@ -12,5 +15,5 @@ inherit autotools pkgconfig
> >>
> >>  DEPENDS =3D "libusb1"
> >>
> >> -SRC_URI[md5sum] =3D "56844020177d4db4c1ea2e926fe9d588"
> >> -SRC_URI[sha256sum] =3D "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c71=
2e0c58a332d80ec3eab"
> >> +SRC_URI[md5sum] =3D "1de724551604bce1962960b7a301cc08"
> >> +SRC_URI[sha256sum] =3D "5d253f924fd29bc13054b664bba9aa86b865299971195=
969478253c1775b7e56"
> >> --
> >> 1.9.3
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20
>=20
> I thought this option would make caching easier and avoid having to
> get the whole history of git each time during the build. I can switch
> to using the repository directly though, thats no problem. You want me
> to do that?

OE will cache the git clone, so it's not an issue.

Yes please do, I've cherry-picked this to master-next (to see if I
already get different checksums) but I would gladly replace it with v2.

> Any ideas where gnumonks.org went? I'm not sure this gitorious is an
> official repository. There isn't really any information about that on
> the web that I've been able to find.

No idea about this.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z4D23EFnZpzTzcHd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsuSoACgkQN1Ujt2V2gBzG+QCgiNaYVNq5caIYPb2/V1pxZhGS
V/oAoJYpA4RKndsU7OTGUp9Ytjb4aTiy
=752T
-----END PGP SIGNATURE-----

--z4D23EFnZpzTzcHd--
