Return-Path: <B40869@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0127.outbound.protection.outlook.com [65.55.169.127])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF7570EF1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 05:59:51 +0000 (UTC)
Received: from BN1PR0301MB0756.namprd03.prod.outlook.com (25.160.78.150) by
	BN1PR0301MB0755.namprd03.prod.outlook.com (25.160.78.15) with Microsoft
	SMTP Server (TLS) id 15.0.1029.13; Fri, 19 Sep 2014 05:59:51 +0000
Received: from BN1PR0301MB0756.namprd03.prod.outlook.com ([25.160.78.150]) by
	BN1PR0301MB0756.namprd03.prod.outlook.com ([25.160.78.150]) with
	mapi id 15.00.1034.003; Fri, 19 Sep 2014 05:59:51 +0000
From: "B40869@freescale.com" <B40869@freescale.com>
To: Khem Raj <raj.khem@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] pimd: add recipe for pimd-2.1.8
Thread-Index: AQHP0VpcTh/0akZGskmuKCh3FLkMIJwH5eMAgAAVHww=
Date: Fri, 19 Sep 2014 05:59:50 +0000
Message-ID: <1411106953404.51349@freescale.com>
References: <1410835738-27343-1-git-send-email-b40869@freescale.com>,
	<CAMKF1srPeXz=ek8e4R++Lc30jUei6h+8RZJDExJpvFZUAVvoNA@mail.gmail.com>
In-Reply-To: <CAMKF1srPeXz=ek8e4R++Lc30jUei6h+8RZJDExJpvFZUAVvoNA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.88.158.211]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;UriScan:;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(189002)(199003)(24454002)(106356001)(87936001)(36756003)(117636001)(92566001)(86362001)(64706001)(31966008)(92726001)(83072002)(4396001)(97736003)(106116001)(2656002)(74662003)(85852003)(66066001)(85306004)(81342003)(95666004)(99286002)(46102003)(105586002)(20776003)(107046002)(76482002)(21056001)(77096002)(81542003)(19580405001)(83322001)(99396002)(107886001)(101416001)(54356999)(50986999)(77982003)(74502003)(79102003)(90102001)(80022003)(76176999)(19580395003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR0301MB0755;
	H:BN1PR0301MB0756.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-networking][PATCH] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Fri, 19 Sep 2014 05:59:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

New patch is sent out. Replace with +=3D.=0A=
=0A=
BR,=0A=
YangHaibo=0A=
________________________________________=0A=
From: Khem Raj <raj.khem@gmail.com>=0A=
Sent: Friday, September 19, 2014 12:43 PM=0A=
To: openembeded-devel=0A=
Cc: Yang Haibo-B40869=0A=
Subject: Re: [oe] [meta-networking][PATCH] pimd: add recipe for pimd-2.1.8=
=0A=
=0A=
On Mon, Sep 15, 2014 at 7:48 PM, YangHaibo <b40869@freescale.com> wrote:=0A=
> +CFLAGS_prepend =3D "-I ${S}/include "=0A=
=0A=
why is prepend needed  +=3D would be better=0A=

