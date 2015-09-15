Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 47FDA73D13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 14:52:34 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so32660825wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xVsqSbF6gc1P84yDd+uBYhMBBMf/EP7yaFg1Vud5nxc=;
	b=va3ddzB+M9WsxClRwL+pIeGOs56ak2F5+VXKhfJcJVG3F6igVRx4ThOae4CBGjqxbh
	8tD8lP0EBc/KUi+1Ci+yL6mZ142A8Wjh7hdqOAP0si8mUfIZccP+TSrtGebIUIvaMOvH
	sr7+NsRPXPE4RnNwrg+LYwK4HAZmWGDhwp0B3smTgHmJMQvgfcSd/HlJoenYgnSh/8yO
	OqsyNwWN9A55QkTQHl4uXJeVcj5iB7xK2rTjhwzeWXrbcBg0V2M7x1pCyQXWNJumO204
	oXkwv7q8xeXvE0k8xAifiezopDi7WE6nG/QxNBUZOWDgvtOK9b9x47AJ/IdTF7Z+Htga
	Cw3w==
X-Received: by 10.180.100.161 with SMTP id ez1mr8254223wib.60.1442328754625;
	Tue, 15 Sep 2015 07:52:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	p20sm20329304wie.5.2015.09.15.07.52.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 07:52:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Sep 2015 16:52:37 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150915145237.GD2379@jama>
References: <1439531817-34541-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FDA8E4C8F5@G08CNEXMBPEKD01.g08.fujitsu.local>
	<20150915142249.GH8885@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20150915142249.GH8885@mentor.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] dnsmasq: upgrade 2.72->2.75
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
X-List-Received-Date: Tue, 15 Sep 2015 14:52:38 -0000
X-Groupsio-MsgNum: 57368
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline

--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 10:22:49AM -0400, Joe MacDonald wrote:
> Hi Lei,
>=20
> [Re: [oe] [meta-oe][PATCH] dnsmasq: upgrade 2.72->2.75] On 15.09.15 (Tue =
01:58) Lei, Maohui wrote:
>=20
> > Hi
> >=20
> > Excuse me. This patch has been in master-next for a long time. Why not
> > been merged into master?
>=20
> Probably the same reason as why Kai's inetutils patch lingered on for so
> long.  Anything for meta-networking without a meta-networking tag in the
> subject line has an elevated risk of being overlooked.  Sorry about
> that, it's been merged now.

Last 3 in meta-networking bundle, can you please update their status in
patchwork?

http://patchwork.openembedded.org/bundle/jama/meta-networking/?archive=3Dbo=
th

Thanks

>=20
> -J.
>=20
> >=20
> >=20
> > Cheers
> > Lei
> >=20
> >=20
> >=20
> > > -----Original Message-----
> > > From: Lei, Maohui=20
> > > Sent: Friday, August 14, 2015 1:57 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Lei, Maohui=20
> > > Subject: [oe] [meta-oe][PATCH] dnsmasq: upgrade 2.72->2.75
> > >=20
> > > -parallel-make.patch is not needed any more,so delete.
> > >=20
> > > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > > ---
> > >  .../dnsmasq/dnsmasq/parallel-make.patch               | 19 ---------=
----------
> > >  .../recipes-support/dnsmasq/dnsmasq_2.72.bb           | 10 ----------
> > >  .../recipes-support/dnsmasq/dnsmasq_2.75.bb           |  9 +++++++++
> > >  3 files changed, 9 insertions(+), 29 deletions(-)  delete mode 100644
> > > meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch
> > >  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2=
=2E72.bb
> > >  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2=
=2E75.bb
> > >=20
> > > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel=
-make.patch
> > > b/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.patch
> > > deleted file mode 100644
> > > index 6d5b722..0000000
> > > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq/parallel-make.p=
atch
> > > +++ /dev/null
> > > @@ -1,19 +0,0 @@
> > > -The dnsmasq target depends on .configured and $(objs). .configured d=
oes an rm --f *.o.
> > > Yet the only thing telling make to build the .configured target befor=
e -the $(objs) target
> > > was the order of the dependencies of the dnsmasq target. We -can't re=
ly on that order
> > > when doing a paralllel make build, so add an explicit -rule to enforc=
e that order.
> > > -
> > > -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > > -Upstream-status: Pending
> > > -
> > > ---- dnsmasq-2.68.orig/Makefile
> > > -+++ dnsmasq-2.68/Makefile
> > > -@@ -139,6 +139,8 @@ bloatcheck : $(BUILDDIR)/dnsmasq_baselin
> > > -	@rm -f *.o
> > > -	@touch $@
> > > -
> > > -+$(objs): .configured
> > > -+
> > > - $(objs:.o=3D.c) $(hdrs):
> > > -	ln -s $(top)/$(SRC)/$@ .
> > > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
> > > b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
> > > deleted file mode 100644
> > > index bd59194..0000000
> > > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
> > > +++ /dev/null
> > > @@ -1,10 +0,0 @@
> > > -require dnsmasq.inc
> > > -
> > > -SRC_URI +=3D "\
> > > -    file://parallel-make.patch \
> > > -    file://lua.patch \
> > > -"
> > > -
> > > -SRC_URI[dnsmasq-2.72.md5sum] =3D "cf82f81cf09ad3d47612985012240483"
> > > -SRC_URI[dnsmasq-2.72.sha256sum] =3D
> > > "635f1b47417d17cf32e45cfcfd0213ac39fd09918479a25373ba9b2ce4adc05d"
> > > -
> > > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> > > b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> > > new file mode 100644
> > > index 0000000..a11aabb
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> > > @@ -0,0 +1,9 @@
> > > +require dnsmasq.inc
> > > +
> > > +SRC_URI +=3D "\
> > > +    file://lua.patch \
> > > +"
> > > +
> > > +SRC_URI[dnsmasq-2.75.md5sum] =3D "d99ac126d4fe910c679d88430559669b"
> > > +SRC_URI[dnsmasq-2.75.sha256sum] =3D
> > > "f8252c0a0ba162c2cd45f81140c7c17cc40a5fca2b869d1a420835b74acad294"
> > > +
> > > --
> > > 1.8.4.2
> >=20
> --=20
> -Joe MacDonald.
> :wq



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlX4MLUACgkQN1Ujt2V2gBxunwCXXoqkx4fgbsJRfOCCqsb2paea
BACfabAv+G483wZY5xtZSU6wlemXyrw=
=FSpQ
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
