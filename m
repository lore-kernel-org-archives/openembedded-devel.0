Return-Path: <bevenson@melinkcorp.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0139.outbound.protection.outlook.com [207.46.163.139])
	by mail.openembedded.org (Postfix) with ESMTP id E347D6F7D3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 12:02:51 +0000 (UTC)
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB040.namprd05.prod.outlook.com (10.255.210.156) with Microsoft
	SMTP Server (TLS) id 15.0.898.11; Mon, 31 Mar 2014 12:02:50 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.15.8]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.15.238]) with mapi id
	15.00.0908.008; Mon, 31 Mar 2014 12:02:50 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Thread-Topic: php: Backport PHP SRC_URI update patch to dylan?
Thread-Index: Ac9M2PX28ljXLfj5SD2MEpXtt97ymw==
Date: Mon, 31 Mar 2014 12:02:48 +0000
Message-ID: <14e2a65afdb24b6f96f3b87a5cb04881@BLUPR05MB037.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 000CD864006CE8000CD9B1
x-originating-ip: [98.100.91.242]
x-forefront-prvs: 0167DB5752
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(199002)(189002)(74316001)(97336001)(4396001)(92566001)(83322001)(69226001)(81686001)(90146001)(97186001)(81342001)(74366001)(76176001)(81816001)(99286001)(77982001)(47976001)(49866001)(80976001)(50986001)(59766001)(98676001)(15975445006)(79102001)(76786001)(51856001)(81542001)(85852003)(94946001)(74706001)(87266001)(54356001)(63696002)(76482001)(76576001)(20776003)(54316002)(2656002)(74662001)(95666003)(74502001)(87936001)(33646001)(47446002)(46102001)(66066001)(86362001)(74876001)(56816005)(77096001)(19580395003)(83072002)(53806001)(85306002)(93516002)(93136001)(76796001)(94316002)(47736001)(65816001)(95416001)(15202345003)(31966008)(80022001)(24736002)(15302535010);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR05MB040;
	H:BLUPR05MB037.namprd05.prod.outlook.com;
	FPR:3FD3C30B.29226DCA.8EE196E1.ACB71E82.200F3; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: melinkcorp.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Subject: php: Backport PHP SRC_URI update patch to dylan?
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
X-List-Received-Date: Mon, 31 Mar 2014 12:02:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm on the dylan branch, I recently had to do a complete rebuild of my imag=
e to recover from a mistake I'd made.  During the rebuild, it failed to fet=
ch php until I applied this patch: http://git.openembedded.org/meta-openemb=
edded/patch/?id=3D2c63ef6da286e528a23509a87d55c79098e1c2b7.   I see this pa=
tch has been applied to dora and master, but it is not present in dylan.  C=
ould this patch get backported to dylan?  Without it, anyone on the dylan b=
ranch can't fetch php.

Regards,
Bryan Evenson

