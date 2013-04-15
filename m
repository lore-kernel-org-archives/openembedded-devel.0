Received: from mail-db8lp0187.outbound.messaging.microsoft.com
	([213.199.154.187] helo=db8outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1URgJI-0007eG-4m
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 12:07:04 +0200
Received: from mail33-db8-R.bigfish.com (10.174.8.243) by
	DB8EHSOBE031.bigfish.com (10.174.4.94) with Microsoft SMTP Server id
	14.1.225.23; Mon, 15 Apr 2013 09:04:07 +0000
Received: from mail33-db8 (localhost [127.0.0.1])	by mail33-db8-R.bigfish.com
	(Postfix) with ESMTP id CDB0DBC0655	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:04:07 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I542I1432Izz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dh8275chz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail33-db8 (localhost.localdomain [127.0.0.1]) by mail33-db8
	(MessageSwitch) id 1366016645817394_23681;
	Mon, 15 Apr 2013 09:04:05 +0000 (UTC)
Received: from DB8EHSMHS015.bigfish.com (unknown [10.174.8.226])	by
	mail33-db8.bigfish.com (Postfix) with ESMTP id C53544C0045	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:04:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS015.bigfish.com
	(10.174.4.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 15 Apr 2013 09:04:05 +0000
Received: from 039-SN2MPN1-013.039d.mgd.msft.net ([169.254.3.24]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0328.011; Mon, 15 Apr 2013 09:04:03 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] tclap: initial add 1.2.1
Thread-Index: AQHOIAbusCkWCll5OUC6pnGBCK+6R5ikdUQAgABINICABoMTwIAAA+WAgCvrP2A=
Date: Mon, 15 Apr 2013 09:04:03 +0000
Message-ID: <AF604684617F454390621992F367F16901C79CAB@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1363146643-30820-1-git-send-email-b28495@freescale.com>
	<20130313162013.GM3260@jama>
	<AF604684617F454390621992F367F169012C4AD0@039-SN2MPN1-022.039d.mgd.msft.net>
	<CA+chaQeC26Any2ZHPuct90Ta8PxgYsijGT7gMDjCL0UhOK2qBA@mail.gmail.com>
	<AF604684617F454390621992F367F169012C5F81@039-SN2MPN1-022.039d.mgd.msft.net>
	<20130318102043.GA3195@jama>
In-Reply-To: <20130318102043.GA3195@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.72]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH] tclap: initial add 1.2.1
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
X-List-Received-Date: Mon, 15 Apr 2013 10:08:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Monday, March 18, 2013 6:21 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] tclap: initial add 1.2.1
>=20
> On Mon, Mar 18, 2013 at 10:08:25AM +0000, Liu Ting-B28495 wrote:
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > > Of Martin Jansa
> > > Sent: Thursday, March 14, 2013 2:40 PM
> > > To: openembedded-devel
> > > Subject: Re: [oe] [meta-oe][PATCH] tclap: initial add 1.2.1
> > >
> > > If it generates doc/html on your host, then it's probably
> > > autodetecting some doc generating tool from host which isn't on my.
> > > It would be better to disable docs completely (I'll let you know if
> > > it builds and doc is empty).
> > >
> >
> > Any update?
>=20
> I don't know, do you know why it builds docs on your host?

Check if doxygen is available:
$ rpm -qf /usr/bin/doxygen
doxygen-1.4.7-1.1

v4 patch has been sent out. Please have a look.

-Ting

>=20
> > > On Thu, Mar 14, 2013 at 3:38 AM, Liu Ting-B28495
> > > <B28495@freescale.com>wrote:
> > >
> > > > > -----Original Message-----
> > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > > > > Behalf Of Martin Jansa
> > > > > Sent: Thursday, March 14, 2013 12:20 AM
> > > > > To: openembedded-devel@lists.openembedded.org
> > > > > Subject: Re: [oe] [meta-oe][PATCH] tclap: initial add 1.2.1
> > > > >
> > > > > On Wed, Mar 13, 2013 at 11:50:43AM +0800, b28495@freescale.com
> wrote:
> > > > > > From: Ting Liu <b28495@freescale.com>
> > > > > >
> > > > > > TCLAP (Templatized C++ Command Line Parser Library ) is a
> > > > > > small, flexible library that provides a simple interface for
> > > > > > defining and accessing command line arguments. Templatized C++
> > > > > > Command Line Parser Library.
> > > > > >
> > > > > > Use the commit of tag tclap-1-2-1-release-final.
> > > > > >
> > > > >
> > > > > fails in do_install:
> > > > >
> > > > > | /bin/mkdir -p
> > > > > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/ar
> > > > > | mv5t e-oe
> > > > > | -linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap
> > > > > | cp -R
> > > > > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/ar
> > > > > | mv5t e-oe -linux-gnueabi/tclap/1.2.1-r0/git/docs/html
> > > > > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/ar
> > > > > | mv5t e-oe
> > > > > | -linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap
> > > > > |  /bin/mkdir -p
> > > > > | '/home/jenkins/oe/shr-core-branches/shr-core/tmp-
> > > > > eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-
> > > > > r0/image/usr/share/doc/tclap'
> > > > > | cp: cannot stat
> > > > > | `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/a
> > > > > | rmv5
> > > > > | te-o
> > > > > | e-linux-gnueabi/tclap/1.2.1-r0/git/docs/html': No such file or
> > > > > | directory
> > > > > | make[2]: *** [install-data-local] Error 1
> > > > > | make[2]: *** Waiting for unfinished jobs....
> > > > > |  /usr/bin/install -c -m 644 index.html manual.html style.css
> > > > > '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/arm
> > > > > v5te
> > > > > -oe- linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap'
> > > > > | make[2]: Leaving directory
> > > > > | `/home/jenkins/oe/shr-core-branches/shr-
> > > > > core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-
> > > r0/git/docs'
> > > > > | make[1]: *** [install-am] Error 2
> > > > > | make[1]: Leaving directory
> > > > > | `/home/jenkins/oe/shr-core-branches/shr-
> > > > > core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-
> > > r0/git/docs'
> > > > > | make: *** [install-recursive] Error 1
> > > > > | ERROR: oe_runmake failed
> > > > > | ERROR: Function failed: do_install (see
> > > > > | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/ar
> > > > > | mv5t
> > > > > | e-oe
> > > > > | -linux-gnueabi/tclap/1.2.1-r0/temp/log.do_install.29945 for
> > > > > | further
> > > > > | information)
> > > > > NOTE: recipe tclap-1.2.1-r0: task do_install: Failed
> > > > >
> > > > > Whole log in:
> > > > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-
> > > > > branches/log.world.20130313_114357.log/
> > > > >
> > > >
> > > > I did tests before sending the patch :-( Patch v3 has been sent.
> > > > Please review. Thanks.
> > > >
> > > > -Ting
> > > >
> > > > > > Signed-off-by: Ting Liu <b28495@freescale.com>
> > > > > > ---
> > > > > >  meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |   13
> +++++++++++++
> > > > > >  1 files changed, 13 insertions(+), 0 deletions(-)  create
> > > > > > mode
> > > > > > 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > > > >
> > > > > > diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > > > > b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > > > > new file mode 100644
> > > > > > index 0000000..c2b03a4
> > > > > > --- /dev/null
> > > > > > +++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > > > > > @@ -0,0 +1,13 @@
> > > > > > +DESCRIPTION =3D "Templatized C++ Command Line Parser"
> > > > > > +HOMEPAGE =3D "http://tclap.sourceforge.net/"
> > > > > > +SECTION =3D "tclap"
> > > > > > +LICENSE =3D "MIT"
> > > > > > +LIC_FILES_CHKSUM =3D
> > > > > "file://COPYING;md5=3Dc8ab0ff134bcc584d0e6b5b9f8732453"
> > > > > > +
> > > > > > +SRCREV =3D "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
> > > > > > +SRC_URI =3D
> "git://tclap.git.sourceforge.net/gitroot/tclap/tclap"
> > > > > > +
> > > > > > +S =3D "${WORKDIR}/git"
> > > > > > +inherit autotools
> > > > > > +
> > > > > > +BBCLASSEXTEND =3D "native nativesdk"
> > > > > > --
> > > > > > 1.7.3.4
> > > > > >
> > > > > >
> > > > > >
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedd
> > > > > > ed-d
> > > > > > evel
> > > > >
> > > > > --
> > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > >
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-d
> > > > evel
> > > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev
> > > el
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



