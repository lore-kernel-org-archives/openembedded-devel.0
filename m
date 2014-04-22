Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F240609C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 01:41:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M1fPMB012727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 18:41:25 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.80]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0169.001;
	Mon, 21 Apr 2014 18:41:25 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 0/3] gd: update to version 2.1.0 and two
	fixes
Thread-Index: AQHPXVWXNvJa8q8oyEecEbKMHz+YSZsc3Q3g
Date: Tue, 22 Apr 2014 01:41:24 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BF733B@ALA-MBB.corp.ad.wrs.com>
References: <cover.1397545082.git.jackie.huang@windriver.com>
	<20140421113331.GZ2486@jama>
In-Reply-To: <20140421113331.GZ2486@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 0/3] gd: update to version 2.1.0 and two fixes
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
X-List-Received-Date: Tue, 22 Apr 2014 01:41:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Monday, April 21, 2014 7:34 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 0/3] gd: update to version 2.1.0 and tw=
o fixes
>=20
> On Tue, Apr 15, 2014 at 03:01:23PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Merged 2 from 3 and 1 mine, thanks
>=20
> "add perl" one has some feedback

I'm working for v2 for this one, thanks!

Thanks,
Jackie

>=20
> >
> > --
> > The following changes since commit 477ccd867cc71f8277f2670b7be34b3b1530=
0052:
> >
> >   klibc: restylize a bit the recipes (2014-04-06 13:36:20 +0100)
> >
> > are available in the git repository at:
> >
> >   git://git.pokylinux.org/poky-contrib jhuang0/t_gd_140415-1
> >
> > http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Djhuang0/t_gd_14=
0
> > 415-1
> >
> > Hongxu Jia (1):
> >   gd: add perl to RDEPENDS
> >
> > Jackie Huang (1):
> >   gd: update to version 2.1.0
> >
> > Robert Yang (1):
> >   gd: fix the subdir-objects error
> >
> >  .../gd/gd-2.1.0/fix-the-subdir-objects-error.patch |   39 ++++++++++++=
++++++++
> >  .../gd/{gd_2.0.35+2.0.36rc1.bb =3D> gd_2.1.0.bb}     |   25 ++++++++--=
---
> >  2 files changed, 55 insertions(+), 9 deletions(-)  create mode 100644
> > meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch
> >  rename meta-oe/recipes-support/gd/{gd_2.0.35+2.0.36rc1.bb =3D>
> > gd_2.1.0.bb} (40%)
> >
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

