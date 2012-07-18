Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrTaS-000302-5S
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 14:42:40 +0200
Received: by bkcik5 with SMTP id ik5so1076379bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SJSrJ7pI1hmoHIWp8fivr4bbWO55YG1XK9D7icGybos=;
	b=JpkTcMOZ+1erPkYXvSYEtZUOztfFhU2H3w3HWqW27pIkmpSZgp0OyhleWij91MoQ8w
	dVFcdyn33BVt3spjM8COVcjFJf4N5VCRF7C8Vt0PipbbpvhgHoOg/+AH3/CEnNeKZWhm
	h/cPRE7ahEhhb63CWxpRql0r7M2B0BLOVNUSRlnzfC8mIaIU14YyN+ZzXTxvYk2HNyoP
	eHw2POBtBksrvMcu3reLeivxnm1k/iPAMuuXDEr76S27zu7iYQTJ2lx0h/iB39vbPx/q
	hzMhpCIduK/jR8isaFbHlwClBVZidhCz3RN7IhwlpKHSnujmBjaSu7YwtuSUqzEZBYOr
	g72g==
Received: by 10.204.152.75 with SMTP id f11mr1484120bkw.83.1342614679532;
	Wed, 18 Jul 2012 05:31:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g6sm11767152bkg.2.2012.07.18.05.31.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 05:31:16 -0700 (PDT)
Date: Wed, 18 Jul 2012 14:31:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120718123125.GM22569@jama.jama.net>
References: <20120716074256.12AC410334@opal>
	<20120716182528.GO3729@jama.jama.net>
	<CALbNGRRd0ndx_CLht9e-vhRizm=ERkoyCugtZ7jb58i-QW34qg@mail.gmail.com>
	<20120717091818.GA3390@jama.jama.net>
	<ju3auv$81f$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ju3auv$81f$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbmRyZWFzIE3DvGxsZXIgOiBzeXN0ZW1kLmJiY2xhc3M6IGFkZCAqLXN5c3RlbWQgcGFja2FnZXMgdG8gUlJFQ09NTUVORFM=?=
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
X-List-Received-Date: Wed, 18 Jul 2012 12:42:40 -0000
X-Groupsio-MsgNum: 39741
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LvAn5G4Ewe70kJ1i"
Content-Disposition: inline

--LvAn5G4Ewe70kJ1i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2012 at 11:23:43AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 17-07-12 11:18, Martin Jansa schreef:
> > On Tue, Jul 17, 2012 at 10:54:41AM +0200, Andreas M=FCller wrote:
> >> On Mon, Jul 16, 2012 at 8:25 PM, Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >>> On Mon, Jul 16, 2012 at 07:42:56AM +0000, git@git.openembedded.org
> >>> wrote:
> >>>> Module: meta-openembedded.git Branch: master Commit:
> >>>> 264e5a44e1111f939b43c11bb9514a0b435918db URL:
> >>>> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=
=3D264e5a44e1111f939b43c11bb9514a0b435918db
> >>>>
> >>>>
> >>>>=20
> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
> >>>> Date:   Wed Jul 11 20:46:07 2012 +0200
> >>>>=20
> >>>> systemd.bbclass: add *-systemd packages to RRECOMMENDS
> >>>=20
> >>> This is a bit unfortunate e.g. when busybox is used in small chroot=
=20
> >>> image. busybox pulls busybox-syslog, which now adds
> >>> busybox-syslog-systemd and it ends with
> >>> systemd/dbus/udev/shadow/pam/util-linux/kmod being added to
> >>> previously small image, see:
> >>>=20
> >>> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dblobdiff;f=
=3Dimages/crespo/eglibc/chroot-image/installed-package-names.txt;h=3D07187b=
9e51bd0199910152a8019d117ed41cc2db;hp=3D8f401e657dd449e30fe8183dc86a791d096=
14d9f;hb=3Dac04304bb15221b49e5af6838068f158e7d628ed;hpb=3D4c0555e7fa689c3c2=
0902c7fc1ec8e525769723f
> >>>
> >>>
> >>>=20
> So it could be solved by image specific BAD_RECOMMENDATIONs or something
> >>> like that, but by default it doesn't work very well in this
> >>> use-case.
> >>>=20
> >>> Cheers,
> >>>=20
> >> I think the image specific BAD_RECOMMENDATION is not that easy to=20
> >> implement and to handle by user. I am 'dreaming' of of a distro layer=
=20
> >> blacklist. So in your case the distro could mask out whole=20
> >> meta-systemd. Could you live with that?
> >=20
> > No, as the same distro is used to create full images with systemd and=
=20
> > this chroot-image is just small initramfs for kernel (where=20
> > systemd+friends is really not needed/expected).
>=20
> I think the easiest solution is to remove 'inherit systemd' from busybox.

I have similar problem with gpsd/fso-gpsd and gpsd-systemd too.. On some
devices I would like to include gpsd-systemd in image (e.g. with
systemd-machine-units or through some machine specific task), but on
others (e.g. om-gta02) I need only fso-gpsd.service to provide gpsd
(gpsd-systemd locks gpsd port).

So maybe I didn't understand Andreas right.. I can put all *-systemd
packages to BAD_RECOMMENDATIONs and then include only needed in=20
tasks/images like I did before..

Cheers,

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFQBS8fMkyGM64RGpERAlJGAKC4n4q1daBZUi9ltRWaY5jW4GKEcQCfeOxE
> amLnSb79qfeIuA1HExCF2M0=3D
> =3DypGT
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LvAn5G4Ewe70kJ1i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAGrJ0ACgkQN1Ujt2V2gBxOoACgrMy5t3/nUjKFCQqZ+1q7ZIZq
4JwAoI71qChHNU9IpEa1KBElhV7pfGbB
=qW73
-----END PGP SIGNATURE-----

--LvAn5G4Ewe70kJ1i--
