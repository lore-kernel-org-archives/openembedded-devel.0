Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id A48A860666
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 09:36:11 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so4616876eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iExAi3f1ELwOYbXyprLoM34QiO6hoBa9DouP154VnLM=;
	b=Q5skS2NvQwlXCrgFSGHmkrltLSxVqtorGJvl0BnYAOK4I5iOEOfWDFelt/RIYQZben
	2B9cECKh8H5ATxpoT292YmKbIanE3a7drxDluw7oCqU8Kd9XN/OA/ne50DLWiwvNDxvu
	4wvME2MCmWTRCEdm2uJlOnF3X6QumJE1bFzP82a1MqslLn4S8HUsPWTWvblGBV32O18b
	dJeRSJ2ivWQeOkhYzu7voimSRKldpPRRBvotVf0PB2OQl3OY1GWYJAOLQn2iE7+xbhxB
	IdeN+W+KQnHCjIOfgTtIic8oLNaTkmknl9tUkpvRallOUze7FWWB6wx69okaHDgadifK
	eUxw==
X-Received: by 10.14.6.198 with SMTP id 46mr23669835een.121.1373448971311;
	Wed, 10 Jul 2013 02:36:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm58413354eeb.13.2013.07.10.02.36.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 02:36:10 -0700 (PDT)
Date: Wed, 10 Jul 2013 11:36:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130710093620.GX3288@jama>
References: <1371467502-9395-1-git-send-email-noor_ahsan@mentor.com>
	<365E1805BC95084CBE82381A0B869994DE4D3DB2@EU-MBX-01.mgc.mentorg.com>
	<20130709122049.GT3288@jama>
	<365E1805BC95084CBE82381A0B869994DE4D4869@EU-MBX-01.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <365E1805BC95084CBE82381A0B869994DE4D4869@EU-MBX-01.mgc.mentorg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome][PATCH V2] gvfs: Handle samba dependency based on GPLv3 license.
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
X-List-Received-Date: Wed, 10 Jul 2013 09:36:12 -0000
X-Groupsio-MsgNum: 45355
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s8wpp40TDz0KNMmP"
Content-Disposition: inline

--s8wpp40TDz0KNMmP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2013 at 08:08:40AM +0000, Ahsan, Noor wrote:
> Do I need to send an updated patch?

No, I've already applied it manually in in-test branch (now it's waiting
for jenkins build).

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Tuesday, July 09, 2013 5:21 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-gnome][PATCH V2] gvfs: Handle samba dependency ba=
sed on GPLv3 license.
>=20
> On Tue, Jul 09, 2013 at 10:48:21AM +0000, Ahsan, Noor wrote:
> > Hello,
> >=20
> > Kindly apply this patch. Thanks.
> >=20
> > Noor
>=20
> Somehow it got lost from my in-test queue, now it's back on track again, =
sorry.
>=20
> Your patch was also based on very old meta-oe, we have 1.10.1 since
> 2013-05-03:
> http://git.openembedded.org/meta-openembedded/commit/?id=3D985fb27d51ecb9=
48a195af5b27a3a3f6b5ab3f45
>=20
> Please rebase before sending patches.
>=20
> Regards,
>=20
> > -----Original Message-----
> > From: Ahsan, Noor
> > Sent: Monday, June 17, 2013 4:12 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Ahsan, Noor
> > Subject: [meta-gnome][PATCH V2] gvfs: Handle samba dependency based on =
GPLv3 license.
> >=20
> > From: Noor <noor_ahsan@mentor.com>
> >=20
> > * Samba is GPLv3. In GPLv3 free environment one was not able to
> >   build gvfs. Add PACKAGECONFIG for samba and enable is when GPLv3
> >   is not present in INCOMPATIBLE_LICENSE.
> >=20
> > Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> > ---
> >  meta-gnome/recipes-gnome/gvfs/gvfs.inc      |    4 +---
> >  meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb |    7 ++++++-
> >  2 files changed, 7 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc=20
> > b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
> > index 0e1c69c..ba52fe7 100644
> > --- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
> > +++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
> > @@ -10,9 +10,7 @@ SRC_URI[archive.md5sum] =3D "402f94b187b197b403d25c85=
caeb9562"
> >  SRC_URI[archive.sha256sum] =3D "0895ac8f6d416e1b15433b6b6b68eb119c6e8b=
04fdb66db665d684355ef89345"
> >  SRC_URI +=3D "file://0001-gvfsfusedaemon.c-fix-glib-build.patch"
> > =20
> > -EXTRA_OECONF =3D "--with-samba-includes=3D${STAGING_INCDIR} \
> > -                --with-samba-libs=3D${STAGING_LIBDIR} \
> > -                --with-archive-includes=3D${STAGING_INCDIR} \
> > +EXTRA_OECONF =3D "--with-archive-includes=3D${STAGING_INCDIR} \
> >                  --with-archive-libs=3D${STAGING_LIBDIR} \  "
> > =20
> > diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb=20
> > b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
> > index 7f86151..5274280 100644
> > --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
> > +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
> > @@ -1,6 +1,6 @@
> >  require gvfs.inc
> > =20
> > -DEPENDS =3D "samba libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse =
gconf libgphoto2"
> > +DEPENDS =3D "libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gconf =
libgphoto2"
> >  # optional: obexftp libcdio libimobiledevice
> > =20
> >  PR =3D "${INC_PR}.1"
> > @@ -21,3 +21,8 @@ FILES_gvfsd-trash =3D "${libexecdir}/gvfsd-trash=20
> > ${datadir}/gvfs/mounts/trash.moun
> > =20
> >  RDEPENDS_${PN} =3D "gvfs-gdu-volume-monitor"
> >  RRECOMMENDS_gvfsd-ftp +=3D "openssh-sftp openssh-ssh"
> > +
> > +PACKAGECONFIG ?=3D "${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', =
'', 'samba', d)}"
> > +
> > +PACKAGECONFIG[samba] =3D "--enable-samba --with-samba-includes=3D${STA=
GING_INCDIR} \
> > +                        --with-samba-libs=3D${STAGING_LIBDIR}, --disab=
le-samba, samba"
> > --
> > 1.7.9.5
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s8wpp40TDz0KNMmP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHdKxQACgkQN1Ujt2V2gBwjNQCeIyzW6odr05dysmbxD1wcircQ
nVIAnjrHKKOMaJIyhkZQUzPTa2ClpxxK
=lGJZ
-----END PGP SIGNATURE-----

--s8wpp40TDz0KNMmP--
