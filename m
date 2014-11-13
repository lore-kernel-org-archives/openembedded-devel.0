Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7DD60167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 09:11:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2014 01:11:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,375,1413270000"; d="scan'208";a="621693010"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2014 01:10:26 -0800
Received: from irsmsx108.ger.corp.intel.com (163.33.3.3) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 13 Nov 2014 09:09:00 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.101]) by
	IRSMSX108.ger.corp.intel.com ([169.254.11.82]) with mapi id
	14.03.0195.001; Thu, 13 Nov 2014 09:09:00 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 0/2] meta-java fixes
Thread-Index: AQHP5IHuLvpwKaHv4kyIYoSZtKwyJ5wv64KAgC6N40A=
Date: Thu, 13 Nov 2014 09:08:59 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F3980E9@IRSMSX105.ger.corp.intel.com>
References: <1412942429-14728-1-git-send-email-cristian.iorga@intel.com>
	<20141014191111.GC12024@mail.itconsulting-heinold.de>
In-Reply-To: <20141014191111.GC12024@mail.itconsulting-heinold.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] meta-java fixes
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
X-List-Received-Date: Thu, 13 Nov 2014 09:11:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Henning,
Will these patches get integrated in master?
Also, I am not familiar with the release cycle of meta-java, is there some =
place where I can get this info from?

Regards,
Cristian Iorga
Yocto Project
Intel Corporation

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Henning Heinold
Sent: Tuesday, October 14, 2014 10:11 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH 0/2] meta-java fixes

On Fri, Oct 10, 2014 at 03:00:27PM +0300, Cristian Iorga wrote:
> meta-java build time fixes with the pre 1.7 Yocto Project release.
>=20
> Cristian Iorga (2):
>   openjdk: add pkgconfig support
>   ecj: fix unpackpost task
>=20
>  recipes-core/ecj/libecj-bootstrap.inc   | 2 +-
>  recipes-core/openjdk/openjdk-common.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Hi,

thanks for the patches I have applied them for the dora branch, master is s=
till building.

Bye Henning
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

