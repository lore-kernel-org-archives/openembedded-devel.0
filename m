Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 178D571144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:00:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56457194"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jan 2015 15:57:12 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0M70vrD016670;
	Thu, 22 Jan 2015 15:01:20 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Thu, 22 Jan 2015 15:01:52 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [meta-networking][PATCH v2] openwsman: add recipe
Thread-Index: AQHQKXSbfcLHr0jd306/phFQoGGLv5y3eYOAgAQ7QjCACbSZQIAA4oWAgAWBNSA=
Date: Thu, 22 Jan 2015 07:01:50 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC73DE9F55@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1420523147-3740-1-git-send-email-biannm@cn.fujitsu.com>
	<20150109162814.GA5581@mentor.com>
	<30DC4EDFD798C94083F3E083754532CC73DE7ECE@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CC73DE926C@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20150119024850.GF25313@mentor.com>
In-Reply-To: <20150119024850.GF25313@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] openwsman: add recipe
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
X-List-Received-Date: Thu, 22 Jan 2015 08:00:50 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH v2] openwsman: add recipe
>=20
> [RE: [oe] [meta-networking][PATCH v2] openwsman: add recipe] On 15.01.18 =
(Sun
> 05:22) Bian, Naimeng wrote:
>=20
> > Hi Joe
> >
> > Sorry. I have not reproduced this error on my building host.
> > I will try to reproduce it firstly before create the V3 patch later.
>=20
> I think this might've been the issue I only saw when I did a world build,=
 so
> you might try that.  There was at least one that built just fine for me o=
n any
> image but failed on a world build.
>=20

Sorry, would you mind tell what's the world build.

Thanks
 Bian

> -J.
>=20
> >
> > Thanks
> >  Bian
> >
> >
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > > Of Bian, Naimeng
> > > Sent: Monday, January 12, 2015 9:07 AM
> > > To: Joe MacDonald
> > > Cc: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-networking][PATCH v2] openwsman: add recipe
> > >
> > > Hi Joe,
> > >
> > > Thanks for your remind. I will create the V3 tomorrow.
> > >
> > > Thanks,
> > >  Bian
> > >
> > > > -----Original Message-----
> > > > From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> > > > Subject: Re: [oe] [meta-networking][PATCH v2] openwsman: add
> > > > recipe
> > > >
> > > > Bian,
> > > >
> > > > I just wanted to be sure you had noticed the discussion on the
> > > > list regarding this submission, it has what looks like a -lm issue
> > > > in the compile stage and consequently we'll need a v3, please.
> > > > You can see an example of the failure
> > > > here:
> > > >
> > > > http://errors.yoctoproject.org/Errors/Search/Details/7107/1/10/393
> > > > 9
> > > >
> > > > Thanks,
> > > > -J.
> > > >
> > > > [[oe] [meta-networking][PATCH v2] openwsman: add recipe] On
> > > > 15.01.06 (Tue
> > > > 13:45) Bian Naimeng wrote:
> > > >
> > > > > Opensource Implementation of WS-Management
> > > > >
> > > > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > > ---
> > > > >  .../libssl-is-required-if-eventint-supported.patch | 17 +++++++
> > > > >  .../openwsman/openwsman/openwsmand.service         | 12 +++++
> > > > >  .../openwsman/openwsman_2.4.12.bb                  | 59
> > > > ++++++++++++++++++++++
> > > > >  3 files changed, 88 insertions(+)  create mode 100644
> > > > > meta-networking/recipes-protocols/openwsman/openwsman/libssl-is-
> > > > > requ ir ed-if-eventint-supported.patch  create mode 100644
> > > > > meta-networking/recipes-protocols/openwsman/openwsman/openwsmand
> > > > > .ser
> > > > > vi
> > > > > ce  create mode 100644
> > > > > meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb
> > > > >
> > > > > diff --git
> > > > > a/meta-networking/recipes-protocols/openwsman/openwsman/libssl-i
> > > > > s-re
> > > > > qu
> > > > > ired-if-eventint-supported.patch
> > > > > b/meta-networking/recipes-protocols/openwsman/openwsman/libssl-i
> > > > > s-re
> > > > > qu
> > > > > ired-if-eventint-supported.patch new file mode 100644 index
> > > > > 0000000..bd540e3
> > > > > --- /dev/null
> > > > > +++ b/meta-networking/recipes-protocols/openwsman/openwsman/libs
> > > > > +++ sl-i
> > > > > +++ s- required-if-eventint-supported.patch
> > > > > @@ -0,0 +1,17 @@
> > > > > +libssl is required by wsman_client_transport if
> > > > > +ENABLE_EVENTING_SUPPORT
> > > > enabled.
> > > > > +
> > > > > +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > > +
> > > > > +diff -Nurp openwsman-2.4.12.orig/src/lib/CMakeLists.txt
> > > > openwsman-2.4.12/src/lib/CMakeLists.txt
> > > > > +--- openwsman-2.4.12.orig/src/lib/CMakeLists.txt	2014-10-28
> > > > 23:04:47.000000000 +0800
> > > > > ++++ openwsman-2.4.12/src/lib/CMakeLists.txt	2014-12-31
> > > > 11:09:20.340428523 +0800
> > > > > +@@ -56,6 +56,9 @@ TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TR
> > > > > +SET_TARGET_PROPERTIES( ${WSMAN_CLIENT_TRANSPORT_PKG} PROPERTIES
> > > > > +VERSION 1.0.0 SOVERSION 1)  INSTALL(TARGETS
> > > > > +${WSMAN_CLIENT_TRANSPORT_PKG} DESTINATION ${LIB_INSTALL_DIR})
> > > > > +
> > > > > ++IF( ENABLE_EVENTING_SUPPORT )
> > > > > ++TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TRANSPORT_PKG}
> > > > > ++${OPENSSL_LIBRARIES} ) ENDIF( ENABLE_EVENTING_SUPPORT )
> > > > > +
> > > > > + ############### wsman_client ###############
> > > > > +
> > > > > diff --git
> > > > > a/meta-networking/recipes-protocols/openwsman/openwsman/openwsma
> > > > > nd.s
> > > > > er
> > > > > vice
> > > > > b/meta-networking/recipes-protocols/openwsman/openwsman/openwsma
> > > > > nd.s
> > > > > er
> > > > > vice
> > > > > new file mode 100644
> > > > > index 0000000..154f3cd
> > > > > --- /dev/null
> > > > > +++ b/meta-networking/recipes-protocols/openwsman/openwsman/open
> > > > > +++ wsma
> > > > > +++ nd
> > > > > +++ .service
> > > > > @@ -0,0 +1,12 @@
> > > > > +[Unit]
> > > > > +Description=3DOpenwsman WS-Management Service After=3Dsyslog.tar=
get
> > > > > +
> > > > > +[Service]
> > > > > +Type=3Dforking
> > > > > +ExecStart=3D@SBINDIR@/openwsmand
> > > > > +ExecStartPre=3D@SYSCONFDIR@/openwsman/owsmangencert.sh
> > > > > +PIDFile=3D@LOCALSTATEDIR@/run/wsmand.pid
> > > > > +
> > > > > +[Install]
> > > > > +WantedBy=3Dmulti-user.target
> > > > > diff --git
> > > > > a/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.b
> > > > > b
> > > > > b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.b
> > > > > b
> > > > > new file mode 100644
> > > > > index 0000000..f188b1d
> > > > > --- /dev/null
> > > > > +++ b/meta-networking/recipes-protocols/openwsman/openwsman_2.4.
> > > > > +++ 12.b
> > > > > +++ b
> > > > > @@ -0,0 +1,59 @@
> > > > > +SUMMARY =3D "Opensource Implementation of WS-Management"
> > > > > +DESCRIPTION =3D "Openwsman is a project intended to provide an
> > > > > +open-source \ implementation of the Web Services Management
> > > > > +specipication \
> > > > > +(WS-Management) and to expose system management information on
> > > > > +the \ Linux operating system using the WS-Management protocol.
> > > > > +WS-Management \ is based on a suite of web services
> > > > > +specifications and usage \ requirements that exposes a set of
> > > > > +operations focused on and covers \ all system management
> > > > > +aspects. \ Openwsman Server and service libraries"
> > > > > +HOMEPAGE =3D "http://www.openwsman.org/"
> > > > > +SECTION =3D "Applications/System"
> > > > > +
> > > > > +DEPENDS =3D "curl libxml2 openssl libpam"
> > > > > +
> > > > > +SRC_URI =3D
> > > > > +"https://github.com/Openwsman/openwsman/archive/v2.4.12.tar.gz
> > > > \
> > > > > +           file://libssl-is-required-if-eventint-supported.patch=
 \
> > > > > +           file://openwsmand.service"
> > > > > +
> > > > > +SRC_URI[md5sum] =3D "4893a41c6fd89b33095c315c79638a75"
> > > > > +SRC_URI[sha256sum] =3D
> > > > "6a4b75dfff1a51c7bc09fd1d44abbde55ae74906f3828797ce391883358120f4"
> > > > > +
> > > > > +LICENSE =3D "BSD"
> > > > > +LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3Dd4f53d4c6cf73b9d43186ce3be6dd0ba"
> > > > > +
> > > > > +inherit systemd cmake pkgconfig pythonnative perlnative
> > > > > +
> > > > > +SYSTEMD_SERVICE_${PN} =3D "openwsmand.service"
> > > > > +SYSTEMD_AUTO_ENABLE =3D "disable"
> > > > > +
> > > > > +EXTRA_OECMAKE =3D "-DBUILD_BINDINGS=3DNO -DBUILD_LIBCIM=3DNO
> > > > > +-DBUILD_PERL=3DYES
> > > \
> > > > > +                 -DCMAKE_INSTALL_PREFIX=3D${prefix} -DLIB=3Dlib"
> > > > > +
> > > > > +do_configure_prepend() {
> > > > > +    export HOST_SYS=3D${HOST_SYS}
> > > > > +    export BUILD_SYS=3D${BUILD_SYS}
> > > > > +    export STAGING_INCDIR=3D${STAGING_INCDIR}
> > > > > +    export STAGING_LIBDIR=3D${STAGING_LIBDIR} }
> > > > > +
> > > > > +do_install_append() {
> > > > > +    install -d ${D}/${sysconfdir}/init.d
> > > > > +    install -m 755 ${B}/etc/init/openwsmand.sh
> > > > ${D}/${sysconfdir}/init.d/openwsmand
> > > > > +    ln -sf ${sysconfdir}/init.d/openwsmand
> > > > > +${D}/${sbindir}/rcopenwsmand
> > > > > +
> > > > > +    if
> > > > > + ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)
> > > > > + };
> > > > then
> > > > > +        install -d ${D}/${systemd_unitdir}/system
> > > > > +        install -m 644 ${WORKDIR}/openwsmand.service
> > > > > + ${D}/${systemd_unitdir}/system
> > > > > +
> > > > > +        sed -i -e 's,@SBINDIR@,${sbindir},g'
> > > > ${D}${systemd_unitdir}/system/openwsmand.service
> > > > > +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g'
> > > > ${D}${systemd_unitdir}/system/openwsmand.service
> > > > > +        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g'
> > > > ${D}${systemd_unitdir}/system/openwsmand.service
> > > > > +    fi
> > > > > +}
> > > > > +
> > > > > +FILES_${PN}-dbg +=3D "${libdir}/openwsman/plugins/.debug/ \
> > > > > +                    ${libdir}/openwsman/authenticators/.debug/ \
> > > > > +                   "
> > > > > +
> > > > > +INSANE_SKIP_${PN} =3D "dev-so"
> > > > > --
> > > > > 1.9.1
> > > > >
> > > > --
> > > > -Joe MacDonald.
> > > > :wq
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> -Joe MacDonald.
> :wq

