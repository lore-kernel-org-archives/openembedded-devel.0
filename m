Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0142.outbound.protection.outlook.com [207.46.163.142])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4426EA1C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:18:12 +0000 (UTC)
Received: from BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) by
	BY2PR03MB253.namprd03.prod.outlook.com (10.242.37.15) with Microsoft
	SMTP Server (TLS) id 15.0.898.11; Fri, 28 Mar 2014 10:18:11 +0000
Received: from BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.84]) by
	BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.84]) with mapi id
	15.00.0898.005; Fri, 28 Mar 2014 10:18:10 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] daq: update to 2.0.2
Thread-Index: AQHPSktwccNBMcL9Hki4VyR3Uc6TFpr2RwsAgAABroA=
Date: Fri, 28 Mar 2014 10:18:09 +0000
Message-ID: <607b033dd0ee43e6963425d897b1f5b1@BY2PR03MB254.namprd03.prod.outlook.com>
References: <1395986585-15248-1-git-send-email-b40290@freescale.com>
	<20140328100934.GA3714@jama>
In-Reply-To: <20140328100934.GA3714@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(24454002)(189002)(199002)(164054003)(377454003)(13464003)(95666003)(81342001)(69226001)(33646001)(80022001)(20776003)(66066001)(63696002)(65816001)(74662001)(31966008)(81542001)(74502001)(47446002)(15395725003)(74316001)(74706001)(59766001)(74876001)(74366001)(77982001)(94946001)(76576001)(575784001)(76786001)(76796001)(94316002)(85306002)(77096001)(86362001)(15202345003)(92566001)(80976001)(93516002)(83322001)(19580405001)(19580395003)(53806001)(81816001)(85852003)(90146001)(51856001)(54356001)(83072002)(56816005)(95416001)(46102001)(56776001)(49866001)(87266001)(54316002)(47736001)(2656002)(87936001)(47976001)(81686001)(76482001)(50986001)(93136001)(15975445006)(97186001)(4396001)(97336001)(98676001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB253;
	H:BY2PR03MB254.namprd03.prod.outlook.com;
	FPR:14B66D07.20D196CA.58E2B70B.4CFDB248.202E8; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH] daq: update to 2.0.2
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
X-List-Received-Date: Fri, 28 Mar 2014 10:18:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
 I can not reproduce the issue.
Can you give me your host environments?

Thanks,
chunrong

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Friday, March 28, 2014 6:10 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] daq: update to 2.0.2

On Fri, Mar 28, 2014 at 02:03:05PM +0800, b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

There is patch like this already, but it still doesn't fix the build issue.

> ---
>  meta-oe/recipes-connectivity/daq/{daq_2.0.1.bb =3D> daq_2.0.2.bb} | 4=20
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)  rename=20
> meta-oe/recipes-connectivity/daq/{daq_2.0.1.bb =3D> daq_2.0.2.bb} (73%)
>=20
> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb=20
> b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> similarity index 73%
> rename from meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> rename to meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> index c12ccde..2675e2a 100644
> --- a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> @@ -10,7 +10,7 @@ DEPENDS =3D "libpcap libpcre "
>  SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
>              file://disable-run-test-program-while-cross-compiling.patch =
"
> =20
> -SRC_URI[md5sum] =3D "044aa3663d44580d005293eeb8ccf175"
> -SRC_URI[sha256sum] =3D "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d=
1ba1ea6ce518ec6d"
> +SRC_URI[md5sum] =3D "865bf9b750a2a2ca632591a3c70b0ea0"
> +SRC_URI[sha256sum] =3D "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51=
f605309beac269a8"
> =20
>  inherit autotools
> --
> 1.8.3.2
>=20
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

