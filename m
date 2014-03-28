Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0203.outbound.protection.outlook.com [207.46.163.203])
	by mail.openembedded.org (Postfix) with ESMTP id B11A26DF25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:41:43 +0000 (UTC)
Received: from BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) by
	BY2PR03MB253.namprd03.prod.outlook.com (10.242.37.15) with Microsoft
	SMTP Server (TLS) id 15.0.898.11; Fri, 28 Mar 2014 09:41:36 +0000
Received: from BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.84]) by
	BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.84]) with mapi id
	15.00.0898.005; Fri, 28 Mar 2014 09:41:36 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH V4 ] daq: add recipe
Thread-Index: AQHOpWqwBOGXoUSimkin+6mYAl+2f5m1j4MAgTwLkQCABe1D8A==
Date: Fri, 28 Mar 2014 09:41:35 +0000
Message-ID: <8e4fe85632be4d4ea4a2cf405649b406@BY2PR03MB254.namprd03.prod.outlook.com>
References: <1377858084-31009-1-git-send-email-b40290@freescale.com>
	<20130904124920.GE11500@jama> <20140324150848.GA29998@jama>
In-Reply-To: <20140324150848.GA29998@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(13464003)(24454002)(51704005)(377454003)(199002)(189002)(86362001)(77096001)(15202345003)(94316002)(76796001)(76786001)(85306002)(93516002)(80976001)(83322001)(19580405001)(19580395003)(92566001)(76576001)(94946001)(87936001)(47976001)(2656002)(81686001)(50986001)(76482001)(16601075003)(4396001)(97336001)(98676001)(93136001)(97186001)(15975445006)(51856001)(90146001)(53806001)(81816001)(85852003)(46102001)(56816005)(95416001)(54316002)(47736001)(56776001)(49866001)(87266001)(54356001)(83072002)(81542001)(63696002)(31966008)(65816001)(74662001)(47446002)(74502001)(33646001)(69226001)(81342001)(95666003)(80022001)(20776003)(66066001)(79102001)(74706001)(59766001)(74316001)(15395725003)(77982001)(74366001)(74876001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB253;
	H:BY2PR03MB254.namprd03.prod.outlook.com;
	FPR:38B4FD55.A3F944E9.964B7E3.40EAE25C.20411; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH V4 ] daq: add recipe
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
X-List-Received-Date: Fri, 28 Mar 2014 09:41:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
 I update daq to 2.0.2.

I  can not reproduce this issue .

Thanks

chunrong


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Monday, March 24, 2014 11:09 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH V4 ] daq: add recipe

On Wed, Sep 04, 2013 at 02:49:20PM +0200, Martin Jansa wrote:
> On Fri, Aug 30, 2013 at 06:21:24PM +0800, b40290@freescale.com wrote:
> > From: Chunrong Guo <B40290@freescale.com>
> >=20
> >    *The dump DAQ test the various inline mode features
> >    *snort depends daq
> >=20
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > ---
> >  meta-oe/recipes-connectivity/daq/daq_2.0.1.bb      |   16 +++++++++++
> >  ...le-run-test-program-while-cross-compiling.patch |   29 ++++++++++++=
++++++++
> >  2 files changed, 45 insertions(+), 0 deletions(-)  create mode=20
> > 100644 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> >  create mode 100644=20
> > meta-oe/recipes-connectivity/daq/files/disable-run-test-program-whil
> > e-cross-compiling.patch
> >=20
> > diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb=20
> > b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> > new file mode 100644
> > index 0000000..4c1be44
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> > @@ -0,0 +1,16 @@
> > +DESCRIPTION =3D "The dump DAQ test the various inline mode features "
> > +HOMEPAGE =3D "http://www.snort.org"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738dc1ae631d8b21=
c40e0"
> > +
> > +PARALLEL_MAKE =3D ""
> > +
> > +DEPENDS =3D "libpcap libpcre "
> > +
> > +SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> > +            file://disable-run-test-program-while-cross-compiling.patc=
h "
> > +
> > +SRC_URI[md5sum] =3D "044aa3663d44580d005293eeb8ccf175"
> > +SRC_URI[sha256sum] =3D "ebba87c2ec76ac65d2980934423b0597909caead3a86ce=
5d1ba1ea6ce518ec6d"
> > +
> > +inherit autotools
>=20
> I don't have more than build log because workspace is already gone,=20
> but qemuarm build fails:
>=20
> ERROR: Function failed: do_install (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe
> -linux-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742)
> ERROR: Logfile of failure stored in:
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe
> -linux-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',=20
> 'common']
> | DEBUG: Executing shell function do_install
> | NOTE: make
> DESTDIR=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/ar
> mv5te-oe-linux-gnueabi/daq/2.0.1-r0/image
> install
> | make: *** No rule to make target `install'.  Stop.
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe
> -linux-gnueabi/daq/2.0.1-r0/temp/log.do_install.4742)
> NOTE: recipe daq-2.0.1-r0: task do_install: Failed
> ERROR: Task 19484
> (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe
> /recipes-connectivity/daq/daq_2.0.1.bb,
> do_install) failed with exit code '1'

Can we fix this please?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

