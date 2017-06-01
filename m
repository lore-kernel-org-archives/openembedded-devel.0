Return-Path: <mns@gomspace.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0107.outbound.protection.outlook.com [104.47.2.107])
	by mail.openembedded.org (Postfix) with ESMTP id BA2C871B69
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 07:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gomspace01.onmicrosoft.com; s=selector1-gomspace-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jxZP7s/7OkJG5pQ16Z9X+8tGheA98O7CwddO0uLkWN8=;
	b=Oxe1epdvrQ6EYTCIPjYe2zrVYBw8GSKvPSK9A/oGRsFmHcP64wSPPyUpr+zNNXUV6t2JqtBRf9TTn82bGT17fCWZFayJ7GCYwfeZY8B32BmE3u0Xi2O+b3myR9N0Swn2zhwogpZj9dauJ0dPPqouli8xRUvup6zWNVFCHHEGiLo=
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com (10.175.41.11) by
	AM5PR0402MB2770.eurprd04.prod.outlook.com (10.175.41.12) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Thu, 1 Jun 2017 07:50:33 +0000
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998]) by
	AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998%18]) with mapi id 15.01.1124.020;
	Thu, 1 Jun 2017 07:50:32 +0000
From: Martin Siegumfeldt <mns@gomspace.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Thread-Topic: [oe] URL of devmem2
Thread-Index: AQHS2X4ttMq8BE90gUOOHHpqWZndxqIOjvmAgABB0ySAANMAMg==
Date: Thu, 1 Jun 2017 07:50:32 +0000
Message-ID: <AM5PR0402MB2769DE8A61AB11D9F7B69659C4F60@AM5PR0402MB2769.eurprd04.prod.outlook.com>
References: <AM5PR0402MB2769D2B8C27E4DDADE64D7CEC4F00@AM5PR0402MB2769.eurprd04.prod.outlook.com>,
	<1496243833.26945.66.camel@linux.intel.com>,
	<AM5PR0402MB2769B4C2EB8E2882A248DD34C4F10@AM5PR0402MB2769.eurprd04.prod.outlook.com>
In-Reply-To: <AM5PR0402MB2769B4C2EB8E2882A248DD34C4F10@AM5PR0402MB2769.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=gomspace.com;
x-originating-ip: [2603:10a6:203:2:cafe::df]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2770;
	7:WiUmmHOB5F76RarJXmsG4AolcgNUBKp7ZL7xMTvTlCts14J5pGroPFIQQS5hARFV1bASeW6XqaWCopxjs79KMJwfZkg3hfqWfLUZOJ58kLELaWYJ9DCKZISEfCCfnoO2XC77J/zSX/YRvzp7/s7NoWsr7SJL7xTZdSqMAVi2Ijl1Ap8CSBjyGmZMEMMl1MEaoYExms9ndFROXT9SF+1zYS6mQk7ze9iXhvqiI8H5vTG06QNZ0iTs5Ex6hvsuVDQ6IHaODBJg4/om9mxItLMSkEEGSpgdbrqaDdxh1oNXD8CzAVfGV48gag/mdrUKX96ZZ91b3G0DTEaaNojNZWy/uQ==
x-ms-traffictypediagnostic: AM5PR0402MB2770:
x-ms-office365-filtering-correlation-id: d280ecd0-d602-4caf-7d02-08d4a8c2e1ad
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201702281549075);
	SRVR:AM5PR0402MB2770; 
x-microsoft-antispam-prvs: <AM5PR0402MB2770857206CEEBDC27A61E33C4F60@AM5PR0402MB2770.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(264703809997249)(228905959029699); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700086)(100105000095)(100000701086)(100105300095)(100000702086)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(100000703086)(100105400095)(3002001)(93006095)(93001095)(10201501046)(6041248)(2016111802025)(20161123564025)(20161123555025)(20161123558100)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(6043046)(100000704086)(100105200095)(100000705086)(100105500095);
	SRVR:AM5PR0402MB2770; BCL:0; PCL:0;
	RULEID:(100000800086)(100110000095)(100000801086)(100110300095)(100000802086)(100110100095)(100000803086)(100110400095)(100000804086)(100110200095)(100000805086)(100110500095);
	SRVR:AM5PR0402MB2770; 
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39840400002)(39450400003)(39410400002)(39400400002)(377424004)(24454002)(6916009)(3660700001)(55016002)(54906002)(99286003)(4326008)(33656002)(39060400002)(53936002)(189998001)(14454004)(3280700002)(5660300001)(9686003)(478600001)(86362001)(7736002)(74316002)(2906002)(6306002)(2900100001)(2950100002)(966005)(7696004)(229853002)(305945005)(6436002)(5250100002)(6246003)(6506006)(53546009)(25786009)(50986999)(76176999)(81166006)(54356999)(8676002)(110136004)(6116002)(102836003)(38730400002)(8936002)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0402MB2770;
	H:AM5PR0402MB2769.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2017 07:50:32.7125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2770
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"akuser808@gmail.com" <akuser808@gmail.com>
Subject: Re: URL of devmem2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Jun 2017 07:50:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Martin Siegumfeldt
Sent: Wednesday, May 31, 2017 21:15
To: Leonardo Sandoval
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] URL of devmem2
=A0  =20
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Sent: Wednesday, May 31, 2017 17:17
To: Martin Siegumfeldt
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] URL of devmem2
=A0=A0=A0=20
On Tue, 2017-05-30 at 20:10 +0000, Martin Siegumfeldt wrote:
> Hi,
>=20
>=20
> Is there any chance that=A0  http://git.openembedded.org/meta-openembedde=
d/commit/?id=3Dfc801961457fe2fbb24973bb43b302ad46044cb8 and=A0  http://git.=
openembedded.org/meta-openembedded/commit/?id=3D6c584374a599f6f8d3607f20ecf=
c13a67ccf1da1 will be backported to release branches? lartmaker domain seem=
s no longer available - AFAICS all branches older than pyro is affected.
>=20

without much contexts on these two patches, send the backported patches
with proper stable releases names as prefixes to the mailing list.

Thanks Leonardo, assuming=A0https://www.openembedded.org/wiki/How_to_submit=
_a_patch_to_OpenEmbedded=A0still applies I will try it out - cheers...


Pull request issued:=A0https://github.com/openembedded/meta-openembedded/pu=
ll/46=A0as recommended at=A0https://github.com/openembedded/meta-openembedd=
ed/blob/master/meta-oe/README


>=20
> Thanks,
>=20
> Martin


=A0=A0=A0     =

