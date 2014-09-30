Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB2560809
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 15:32:47 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id ho1so4716205wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uUlhU5OaF0ttx1iapR0yJoIA67JYIaNFWSdTokYZDbs=;
	b=afb4FH9AzTZSLB1stQlE3OK34/fd7OG081s3XvMSBSXQ0kgcR+xoTyGMuhHNf1xwU8
	7clNgCCFGoDqpu+shcqHH7R7LDrvHGuiZRIzc8mtcYj7EeixU96eziz6Zz0cw5HG0cCd
	910aOCCXFvfy74N1MAdblQFgckmjcpIgTTnCkuPC0iDdDU6p6edgyEXuXcSU42hPy+RI
	twEZJELtPf5wDGThzRYXFVulEkbWbqlECanIIcEkbi1HTbfcPMXdajuMX/tdf6qv58xZ
	LKw3Mh6sO8rfExGZf7Ijp5HQTy4IlkOogolsctin55ux2MRg99dUkE1Vg3UMP5v2hyl3
	TJ2A==
X-Received: by 10.194.8.232 with SMTP id u8mr55586883wja.64.1412091168480;
	Tue, 30 Sep 2014 08:32:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ny6sm15502935wic.22.2014.09.30.08.32.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Sep 2014 08:32:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Sep 2014 17:33:41 +0200
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20140930153341.GA25706@jama>
References: <1411985350-20322-1-git-send-email-jackie.huang@windriver.com>
	<20140930003037.GW25706@jama>
	<1B858668EC6A94408DCA5225FDFA85AABD50F355@ALA-MBB.corp.ad.wrs.com>
	<20140930021351.GX25706@jama>
	<1B858668EC6A94408DCA5225FDFA85AABD50F470@ALA-MBB.corp.ad.wrs.com>
	<1B858668EC6A94408DCA5225FDFA85AABD50F5A6@ALA-MBB.corp.ad.wrs.com>
	<20140930040605.GY25706@jama>
	<1B858668EC6A94408DCA5225FDFA85AABD50F81F@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABD50F81F@ALA-MBB.corp.ad.wrs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openldap: update version to 2.4.39
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
X-List-Received-Date: Tue, 30 Sep 2014 15:32:51 -0000
X-Groupsio-MsgNum: 52298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bWJzwVwZrZVVyQvz"
Content-Disposition: inline

--bWJzwVwZrZVVyQvz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 05:58:01AM +0000, Huang, Jie (Jackie) wrote:
>=20
>=20
> > -----Original Message-----
> > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > Sent: Tuesday, September 30, 2014 12:06 PM
> > To: Huang, Jie (Jackie)
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to 2.4.39
> >=20
> > On Tue, Sep 30, 2014 at 02:58:12AM +0000, Huang, Jie (Jackie) wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > [mailto:openembedded-devel- bounces@lists.openembedded.org] On
> > > > Behalf Of Huang, Jie (Jackie)
> > > > Sent: Tuesday, September 30, 2014 10:28 AM
> > > > To: Martin Jansa
> > > > Cc: openembedded-devel@lists.openembedded.org
> > > > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to
> > > > 2.4.39
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > > > > Sent: Tuesday, September 30, 2014 10:14 AM
> > > > > To: Huang, Jie (Jackie)
> > > > > Cc: openembedded-devel@lists.openembedded.org
> > > > > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to
> > > > > 2.4.39
> > > > >
> > > > > On Tue, Sep 30, 2014 at 02:07:06AM +0000, Huang, Jie (Jackie) wro=
te:
> > > > > >
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > > > [mailto:openembedded-devel- bounces@lists.openembedded.org] On
> > > > > > > Behalf Of Martin Jansa
> > > > > > > Sent: Tuesday, September 30, 2014 8:31 AM
> > > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to
> > > > > > > 2.4.39
> > > > > > >
> > > > > > > On Mon, Sep 29, 2014 at 06:09:10AM -0400, jackie.huang@windri=
ver.com wrote:
> > > > > > > > From: Jackie Huang <jackie.huang@windriver.com>
> > > > > > > >
> > > > > > > > Changed:
> > > > > > > >  * Move slapd from ${libexecdir} to ${sbin}:
> > > > > > > >    Installing slapd under ${sbin} is more FHS and LSB
> > > > > > > > compliance
> > > > > > > >  * Manage init script by inheriting update-rc.d, than
> > > > > > > > postinst
> > > > > > > >  * Add status for initscript
> > > > > > > >  * Rename the patch named with commit id to
> > > > > > > >    gnutls-Avoid-use-of-deprecated-function.patch
> > > > > > > >  * Add a patch for CVE-2013-4449
> > > > > > > >  * Add a patch to use /dev/urandom for entropy
> > > > > > > >  * Allow tls obtains random bits from /dev/urandom:
> > > > > > > >    The URANDOM_DEVICE is undefined for cross-compiling, def=
ine it as
> > > > > > > >    /dev/urandom to allow tls obtains random bits from /dev/=
urandom.
> > > > > > > >  * Add PACKAGECONFIG for mdb, ndb, relay and sock
> > > > > > > >  * Remove unsupported config for ldbm
> > > > > > > >  * Add license file
> > > > > > >
> > > > > > > Can you please resolve:
> > > > > > > WARNING: QA Issue: openldap: Files/directories were installed=
 but not shipped
> > > > > > >   /run [installed-vs-shipped]
> > > > > >
> > > > > > Could you show me how to reproduce this? I don't see this
> > > > > > warning (I set installed-vs-shipped in ERROR_QA in fact, so it
> > > > > > should be an error), and I checked that there is no /run direct=
ory generated for openldap.
> > > > >
> > > > > You can try to configure your builds like world builds are:
> > > > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > >
> > > Sorry I couldn't find configure infos in this page, could you show me
> > > a local.conf or or something like that?
> >=20
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.20140929_05303=
5.log/world_fixes.inc
>=20
> I added this into my local.conf but could still not reproduce it, are you=
 sure you see this warning in the world
> builds with my patch? I checked the log and didn't find the warning you m=
entioned:
>=20
> $ wget http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.20140929_=
041409.log/bitbake.world.log
> $ grep WARNING bitbake.world.log |grep openldap
> $

Yes, I was copy pasting it from next build (which haven't finished for
all MACHINEs yet - so it wasn't published yet)

NOTE: recipe openldap-2.4.39-r0: task do_populate_sysroot: Started
NOTE: recipe openldap-2.4.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 9290 of 29472 (ID: 27688, virtual:native:/home/jenkins/o=
e/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/swig/swig_3.0.2=
=2Ebb, do_populate_sysroot)
NOTE: recipe swig-native-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe swig-native-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 9291 of 29472 (ID: 5067, /home/jenkins/oe/world/shr-core=
/meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.0.0.bb, do_confi=
gure)
NOTE: recipe opencv-3.0.0+gitAUTOINC+fb9a143429-r0: task do_configure: Star=
ted
WARNING: QA Issue: openldap: Files/directories were installed but not shipp=
ed
  /run [installed-vs-shipped]
NOTE: recipe imagemagick-6.8.8-r0: task do_configure: Succeeded
NOTE: Running noexec task 9292 of 29472 (ID: 27693, virtual:native:/home/je=
nkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/swig/swi=
g_3.0.2.bb, do_build)
NOTE: Running task 9293 of 29472 (ID: 27694, virtual:native:/home/jenkins/o=
e/world/shr-core/meta-openembedded/meta-oe/recipes-devtools/swig/swig_3.0.2=
=2Ebb, do_rm_work)
NOTE: recipe swig-native-3.0.2-r0: task do_rm_work: Started
NOTE: recipe swig-native-3.0.2-r0: task do_rm_work: Succeeded
NOTE: Running task 9294 of 29472 (ID: 24418, /home/jenkins/oe/world/shr-cor=
e/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.14.bb, do_populate_li=
c)
NOTE: recipe opencv-3.0.0+gitAUTOINC+fb9a143429-r0: task do_configure: Succ=
eeded
NOTE: Running task 9295 of 29472 (ID: 5068, /home/jenkins/oe/world/shr-core=
/meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.0.0.bb, do_compi=
le)
NOTE: recipe rpm-5.4.14-r0: task do_populate_lic: Started
NOTE: recipe openldap-2.4.39-r0: task do_package: Succeeded
NOTE: Running task 9296 of 29472 (ID: 11252, /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.4.39.bb, do=
_packagedata)
NOTE: recipe opencv-3.0.0+gitAUTOINC+fb9a143429-r0: task do_compile: Started
NOTE: recipe openldap-2.4.39-r0: task do_packagedata: Started

>=20
> And I checked that the following in the recipe should be able to avoid su=
ch QA issue:
> +    rmdir "${D}${localstatedir}/run"
> +    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"

It's just /run without ${localstatedir} (and I don't think that localstated=
ir is empty in my setup)

> > > > > My guess would be systemd in DISTRO_FEATURES (if you don't have i=
t already).
> > > >
> > > > Yeah, it should be the case, I will check and fix it.
> > >
> > > I added system in DISTRO_FEATURES but still can't reproduce it.
> >=20
> > Do you have some PACKAGECONFIG changes in your setup or just default?
>=20
> No, I just use the default.
>=20
> Thanks,
> Jackie
>=20
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bWJzwVwZrZVVyQvz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQqzVUACgkQN1Ujt2V2gBys6QCfW5RjmfSH/zVQ0m14QjlptZD6
1TcAoJc1zFgFDedCEvH6NURBza/xYO7q
=J0sq
-----END PGP SIGNATURE-----

--bWJzwVwZrZVVyQvz--
