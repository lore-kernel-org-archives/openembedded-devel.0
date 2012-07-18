Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrVZA-0006Oq-Or
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 16:49:28 +0200
Received: by weyr6 with SMTP id r6so985818wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5jOZZW+LN4RRC5s0P/vYwYDl2B0vppqQycxe12iufDs=;
	b=VXZ/ag1vWFco9UhngRc7ejkYQAGRgWadvvivegwaXbGg6gPrmRkbMq1Zb9ehcLSe0g
	SxNhAFkOwfJhowZa71Iuz1yk8IVpowRyRMmZVK1lKa3zlw6cDxfUMfcGt8PM3wEWNbyk
	VJLY6PlJXbjin8Q7Ry9XvVRYdYHP+YmjkQ8tmv0DAarnQMXVI9dwpls907iYGrPK9AIG
	UpJzb5s2uoUqcLId+3ASbb8qE+qESOISO0fOrtX2XjQ+YfvbxupR9rvLW4m5tEBXeTdh
	c8zR6DbU1Ea3wVzx0KvSr/k4oNItwqdWpX9O6kbe+tA6o9nWXtaMeEGKkrilbKCa3oji
	pJRA==
Received: by 10.180.97.135 with SMTP id ea7mr7126017wib.11.1342622288088;
	Wed, 18 Jul 2012 07:38:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm42900648wid.7.2012.07.18.07.38.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 07:38:07 -0700 (PDT)
Date: Wed, 18 Jul 2012 16:38:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120718143812.GS22569@jama.jama.net>
References: <20120716074256.12AC410334@opal>
	<20120716182528.GO3729@jama.jama.net>
	<CALbNGRRd0ndx_CLht9e-vhRizm=ERkoyCugtZ7jb58i-QW34qg@mail.gmail.com>
	<20120717091818.GA3390@jama.jama.net>
	<ju3auv$81f$1@dough.gmane.org>
	<20120718123125.GM22569@jama.jama.net>
	<CALbNGRSEPoHdg4NfsDEOt32SqDwzmphUf1V7sQrqAQwap9tJkQ@mail.gmail.com>
	<20120718142836.GR22569@jama.jama.net>
	<CALbNGRTC8aWeS_BUaUp-0MVxzhOsBg80JhRLJGdYqufx+aTnKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTC8aWeS_BUaUp-0MVxzhOsBg80JhRLJGdYqufx+aTnKA@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Jul 2012 14:49:28 -0000
X-Groupsio-MsgNum: 39746
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LXqH7sWsIplhrbjF"
Content-Disposition: inline

--LXqH7sWsIplhrbjF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 04:35:44PM +0200, Andreas M=FCller wrote:
> On Wed, Jul 18, 2012 at 4:28 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Wed, Jul 18, 2012 at 04:21:19PM +0200, Andreas M=FCller wrote:
> >> On Wed, Jul 18, 2012 at 2:31 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > On Tue, Jul 17, 2012 at 11:23:43AM +0200, Koen Kooi wrote:
> >> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> >> Hash: SHA1
> >> >>
> >> >> Op 17-07-12 11:18, Martin Jansa schreef:
> >> >> > On Tue, Jul 17, 2012 at 10:54:41AM +0200, Andreas M=FCller wrote:
> >> >> >> On Mon, Jul 16, 2012 at 8:25 PM, Martin Jansa <martin.jansa@gmai=
l.com>
> >> >> >> wrote:
> >> >> >>> On Mon, Jul 16, 2012 at 07:42:56AM +0000, git@git.openembedded.=
org
> >> >> >>> wrote:
> >> >> >>>> Module: meta-openembedded.git Branch: master Commit:
> >> >> >>>> 264e5a44e1111f939b43c11bb9514a0b435918db URL:
> >> >> >>>> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcom=
mit;h=3D264e5a44e1111f939b43c11bb9514a0b435918db
> >> >> >>>>
> >> >> >>>>
> >> >> >>>>
> >> >> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> >> >>>> Date:   Wed Jul 11 20:46:07 2012 +0200
> >> >> >>>>
> >> >> >>>> systemd.bbclass: add *-systemd packages to RRECOMMENDS
> >> >> >>>
> >> >> >>> This is a bit unfortunate e.g. when busybox is used in small ch=
root
> >> >> >>> image. busybox pulls busybox-syslog, which now adds
> >> >> >>> busybox-syslog-systemd and it ends with
> >> >> >>> systemd/dbus/udev/shadow/pam/util-linux/kmod being added to
> >> >> >>> previously small image, see:
> >> >> >>>
> >> >> >>> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dblobdi=
ff;f=3Dimages/crespo/eglibc/chroot-image/installed-package-names.txt;h=3D07=
187b9e51bd0199910152a8019d117ed41cc2db;hp=3D8f401e657dd449e30fe8183dc86a791=
d09614d9f;hb=3Dac04304bb15221b49e5af6838068f158e7d628ed;hpb=3D4c0555e7fa689=
c3c20902c7fc1ec8e525769723f
> >> >> >>>
> >> >> >>>
> >> >> >>>
> >> >> So it could be solved by image specific BAD_RECOMMENDATIONs or some=
thing
> >> >> >>> like that, but by default it doesn't work very well in this
> >> >> >>> use-case.
> >> >> >>>
> >> >> >>> Cheers,
> >> >> >>>
> >> >> >> I think the image specific BAD_RECOMMENDATION is not that easy to
> >> >> >> implement and to handle by user. I am 'dreaming' of of a distro =
layer
> >> >> >> blacklist. So in your case the distro could mask out whole
> >> >> >> meta-systemd. Could you live with that?
> >> >> >
> >> >> > No, as the same distro is used to create full images with systemd=
 and
> >> >> > this chroot-image is just small initramfs for kernel (where
> >> >> > systemd+friends is really not needed/expected).
> >> >>
> >> >> I think the easiest solution is to remove 'inherit systemd' from bu=
sybox.
> >> >
> >> > I have similar problem with gpsd/fso-gpsd and gpsd-systemd too.. On =
some
> >> > devices I would like to include gpsd-systemd in image (e.g. with
> >> > systemd-machine-units or through some machine specific task), but on
> >> > others (e.g. om-gta02) I need only fso-gpsd.service to provide gpsd
> >> > (gpsd-systemd locks gpsd port).
> >> >
> >> > So maybe I didn't understand Andreas right.. I can put all *-systemd
> >> > packages to BAD_RECOMMENDATIONs and then include only needed in
> >> > tasks/images like I did before..
> >> >
> >> Martin,
> >>
> >> Correct me if I go wrong but I think you are mixing up two issues:
> >
> > yes but slightly related, see bellow
> >>
> >> issue 1. busybox: automatic redepending drags in things you don't want.
> >> issue 2. gpsd: If I understand you right: there are two services
> >> shipped and auto-enabled and that is leading to a conflict.
> >
> > Yes, but sofar having gpsd installed was fine, because it didn't pull
> > gpsd-systemd too (so user was able to start gpsd manually if needed).
> >
> > Now with PN-systemd pulled by PN I need to be more carefull with images
> > having both gpsd/fso-gpsd.
> >
> >> My suggestions:
> >> issue 1. Similar as Koen suggested but I would add an additional
> >> variable - something like SYSTEMD_NO_RRECOMMENDS_{PN}. If this is set
> >> to "1", the automatic rrecommends are not appended.
> >> issue 2. The conflict could be resolved by SYSTEMD_AUTO_ENABLE =3D "di=
sable".
> >
> > I'm trying BAD_RECOMMENDATIONS to resolve this:
> > http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D=
679453cdbc2c58b6558c8ede8e6e17826dbb7b3d
> > http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D=
fe8a92f123ef3137a9e08e6419315f97f4a663fb
> > http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D=
1afdd57475bd3ce586e622bfe6baeb3906bedc2f
> > http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D=
af74fe87eeb606b167697453d515a269e2280eb6
> >
> > but it needs more testing (other builds still running) and for some
> > reason opkg refuses to remove gpsd-systemd:
> >
> > SHRZ root@zjama ~ $ opkg remove gpsd-systemd
> > No packages removed.
> > Collected errors:
> >  * print_dependents_warning: Package gpsd-systemd is depended upon by p=
ackages:
> >  * print_dependents_warning:    task-shr-systemd
> >  * print_dependents_warning:    gpsd
> >  * print_dependents_warning: These might cease to work if package gpsd-=
systemd is removed.
> >
> >  * print_dependents_warning: Force removal of this package with --force=
-depends.
> >  * print_dependents_warning: Force removal of this package and its depe=
ndents
> >  * print_dependents_warning: with --force-removal-of-dependent-packages.
> > SHRZ root@zjama ~ $ opkg info gpsd
> > Package: gpsd
> > Version: 3.4-r7
> > Depends: libgps20 (>=3D 3.4), update-rc.d, gpsd-gpsctl, libgpsd20 (>=3D=
 3.4), bluez4 (>=3D 4.101), libusb-1.0-0 (>=3D 1.0.8), libc6 (>=3D 2.16)
> > Recommends: gpsd-conf, gpsd-systemd
> >
> > even when it's only in gpsd's Recommends..
> >
> > will check buildhistory after image build if it works there..
> >
> As far as I remember, opkg treats rrecommends same as rdepends.
>=20
> To remove there is some force-dependency param in opkg.

At least with older opkg I was able to remove recommended deps without -for=
ce-depends..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LXqH7sWsIplhrbjF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAGylQACgkQN1Ujt2V2gBzWDwCgraBNzeMiELPY7FSHIoGnpC84
exoAniNs4uhmBrg8qsEk9NLts66kAoT3
=SNDZ
-----END PGP SIGNATURE-----

--LXqH7sWsIplhrbjF--
