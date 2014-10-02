Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65C6A6017E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 00:37:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s920bOP3003967
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Oct 2014 17:37:24 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.18]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Wed, 1 Oct 2014 17:37:24 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] openldap: update version to 2.4.39
Thread-Index: AQHP3EXRcugjvvwsSkmUAdPFz8Xc55wY7MwQgAB4W4D//45n4IAABr7wgACKNoD//6bxUIABGSyAgAGuJOA=
Date: Thu, 2 Oct 2014 00:37:23 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD512067@ALA-MBB.corp.ad.wrs.com>
References: <1411985350-20322-1-git-send-email-jackie.huang@windriver.com>
	<20140930003037.GW25706@jama>
	<1B858668EC6A94408DCA5225FDFA85AABD50F355@ALA-MBB.corp.ad.wrs.com>
	<20140930021351.GX25706@jama>
	<1B858668EC6A94408DCA5225FDFA85AABD50F470@ALA-MBB.corp.ad.wrs.com>
	<1B858668EC6A94408DCA5225FDFA85AABD50F5A6@ALA-MBB.corp.ad.wrs.com>
	<20140930040605.GY25706@jama>
	<1B858668EC6A94408DCA5225FDFA85AABD50F81F@ALA-MBB.corp.ad.wrs.com>
	<20140930153341.GA25706@jama>
In-Reply-To: <20140930153341.GA25706@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.134]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 02 Oct 2014 00:37:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Tuesday, September 30, 2014 11:34 PM
> To: Huang, Jie (Jackie)
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to 2.4.39
>=20
> On Tue, Sep 30, 2014 at 05:58:01AM +0000, Huang, Jie (Jackie) wrote:
> >
> >
> > > -----Original Message-----
> > > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > > Sent: Tuesday, September 30, 2014 12:06 PM
> > > To: Huang, Jie (Jackie)
> > > Cc: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to
> > > 2.4.39
> > >
> > > On Tue, Sep 30, 2014 at 02:58:12AM +0000, Huang, Jie (Jackie) wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > [mailto:openembedded-devel- bounces@lists.openembedded.org] On
> > > > > Behalf Of Huang, Jie (Jackie)
> > > > > Sent: Tuesday, September 30, 2014 10:28 AM
> > > > > To: Martin Jansa
> > > > > Cc: openembedded-devel@lists.openembedded.org
> > > > > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to
> > > > > 2.4.39
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > > > > > Sent: Tuesday, September 30, 2014 10:14 AM
> > > > > > To: Huang, Jie (Jackie)
> > > > > > Cc: openembedded-devel@lists.openembedded.org
> > > > > > Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to
> > > > > > 2.4.39
> > > > > >
> > > > > > On Tue, Sep 30, 2014 at 02:07:06AM +0000, Huang, Jie (Jackie) w=
rote:
> > > > > > >
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > > > > [mailto:openembedded-devel-
> > > > > > > > bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> > > > > > > > Sent: Tuesday, September 30, 2014 8:31 AM
> > > > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > > > Subject: Re: [oe] [meta-oe][PATCH] openldap: update
> > > > > > > > version to
> > > > > > > > 2.4.39
> > > > > > > >
> > > > > > > > On Mon, Sep 29, 2014 at 06:09:10AM -0400, jackie.huang@wind=
river.com wrote:
> > > > > > > > > From: Jackie Huang <jackie.huang@windriver.com>
> > > > > > > > >
> > > > > > > > > Changed:
> > > > > > > > >  * Move slapd from ${libexecdir} to ${sbin}:
> > > > > > > > >    Installing slapd under ${sbin} is more FHS and LSB
> > > > > > > > > compliance
> > > > > > > > >  * Manage init script by inheriting update-rc.d, than
> > > > > > > > > postinst
> > > > > > > > >  * Add status for initscript
> > > > > > > > >  * Rename the patch named with commit id to
> > > > > > > > >    gnutls-Avoid-use-of-deprecated-function.patch
> > > > > > > > >  * Add a patch for CVE-2013-4449
> > > > > > > > >  * Add a patch to use /dev/urandom for entropy
> > > > > > > > >  * Allow tls obtains random bits from /dev/urandom:
> > > > > > > > >    The URANDOM_DEVICE is undefined for cross-compiling, d=
efine it as
> > > > > > > > >    /dev/urandom to allow tls obtains random bits from /de=
v/urandom.
> > > > > > > > >  * Add PACKAGECONFIG for mdb, ndb, relay and sock
> > > > > > > > >  * Remove unsupported config for ldbm
> > > > > > > > >  * Add license file
> > > > > > > >
> > > > > > > > Can you please resolve:
> > > > > > > > WARNING: QA Issue: openldap: Files/directories were install=
ed but not shipped
> > > > > > > >   /run [installed-vs-shipped]
> > > > > > >
> > > > > > > Could you show me how to reproduce this? I don't see this
> > > > > > > warning (I set installed-vs-shipped in ERROR_QA in fact, so
> > > > > > > it should be an error), and I checked that there is no /run d=
irectory generated for openldap.
> > > > > >
> > > > > > You can try to configure your builds like world builds are:
> > > > > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > > >
> > > > Sorry I couldn't find configure infos in this page, could you show
> > > > me a local.conf or or something like that?
> > >
> > > http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.20140929_05
> > > 3035.log/world_fixes.inc
> >
> > I added this into my local.conf but could still not reproduce it, are
> > you sure you see this warning in the world builds with my patch? I chec=
ked the log and didn't find
> the warning you mentioned:
> >
> > $ wget
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.world.20140929_0414
> > 09.log/bitbake.world.log $ grep WARNING bitbake.world.log |grep
> > openldap $
>=20
> Yes, I was copy pasting it from next build (which haven't finished for al=
l MACHINEs yet - so it wasn't
> published yet)
>=20
> NOTE: recipe openldap-2.4.39-r0: task do_populate_sysroot: Started
> NOTE: recipe openldap-2.4.39-r0: task do_populate_sysroot: Succeeded
> NOTE: Running task 9290 of 29472 (ID: 27688, virtual:native:/home/jenkins=
/oe/world/shr-core/meta-
> openembedded/meta-oe/recipes-devtools/swig/swig_3.0.2.bb, do_populate_sys=
root)
> NOTE: recipe swig-native-3.0.2-r0: task do_populate_sysroot: Started
> NOTE: recipe swig-native-3.0.2-r0: task do_populate_sysroot: Succeeded
> NOTE: Running task 9291 of 29472 (ID: 5067, /home/jenkins/oe/world/shr-co=
re/meta-
> openembedded/meta-oe/recipes-support/opencv/opencv_3.0.0.bb, do_configure=
)
> NOTE: recipe opencv-3.0.0+gitAUTOINC+fb9a143429-r0: task do_configure: St=
arted
> WARNING: QA Issue: openldap: Files/directories were installed but not shi=
pped
>   /run [installed-vs-shipped]
> NOTE: recipe imagemagick-6.8.8-r0: task do_configure: Succeeded
> NOTE: Running noexec task 9292 of 29472 (ID: 27693, virtual:native:/home/=
jenkins/oe/world/shr-
> core/meta-openembedded/meta-oe/recipes-devtools/swig/swig_3.0.2.bb, do_bu=
ild)
> NOTE: Running task 9293 of 29472 (ID: 27694, virtual:native:/home/jenkins=
/oe/world/shr-core/meta-
> openembedded/meta-oe/recipes-devtools/swig/swig_3.0.2.bb, do_rm_work)
> NOTE: recipe swig-native-3.0.2-r0: task do_rm_work: Started
> NOTE: recipe swig-native-3.0.2-r0: task do_rm_work: Succeeded
> NOTE: Running task 9294 of 29472 (ID: 24418, /home/jenkins/oe/world/shr-c=
ore/openembedded-
> core/meta/recipes-devtools/rpm/rpm_5.4.14.bb, do_populate_lic)
> NOTE: recipe opencv-3.0.0+gitAUTOINC+fb9a143429-r0: task do_configure: Su=
cceeded
> NOTE: Running task 9295 of 29472 (ID: 5068, /home/jenkins/oe/world/shr-co=
re/meta-
> openembedded/meta-oe/recipes-support/opencv/opencv_3.0.0.bb, do_compile)
> NOTE: recipe rpm-5.4.14-r0: task do_populate_lic: Started
> NOTE: recipe openldap-2.4.39-r0: task do_package: Succeeded
> NOTE: Running task 9296 of 29472 (ID: 11252, /home/jenkins/oe/world/shr-c=
ore/meta-
> openembedded/meta-oe/recipes-support/openldap/openldap_2.4.39.bb, do_pack=
agedata)
> NOTE: recipe opencv-3.0.0+gitAUTOINC+fb9a143429-r0: task do_compile: Star=
ted
> NOTE: recipe openldap-2.4.39-r0: task do_packagedata: Started
>=20
> >
> > And I checked that the following in the recipe should be able to avoid =
such QA issue:
> > +    rmdir "${D}${localstatedir}/run"
> > +    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
>=20
> It's just /run without ${localstatedir} (and I don't think that localstat=
edir is empty in my setup)

It's odd, but even if localstatedir is empty, it should also be removed in =
do_install, and I don't' think
Openldap install /run directly:
$ grep -r 'MKDIR.*run' openldap-2.4.39/*
openldap-2.4.39/servers/slapd/Makefile: -$(MKDIR) $(DESTDIR)$(localstatedir=
)/run
openldap-2.4.39/servers/slapd/Makefile.in:      -$(MKDIR) $(DESTDIR)$(local=
statedir)/run

Anyway, could you help check if it work if I change it as:
-    rmdir "${D}${localstatedir}/run"
+    rmdir "${D}${localstatedir}/run ${D}/run"

Thanks,
Jackie

>=20
> > > > > > My guess would be systemd in DISTRO_FEATURES (if you don't have=
 it already).
> > > > >
> > > > > Yeah, it should be the case, I will check and fix it.
> > > >
> > > > I added system in DISTRO_FEATURES but still can't reproduce it.
> > >
> > > Do you have some PACKAGECONFIG changes in your setup or just default?
> >
> > No, I just use the default.
> >
> > Thanks,
> > Jackie
> >
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

