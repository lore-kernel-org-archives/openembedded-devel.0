Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0113.outbound.protection.outlook.com [157.55.234.113])
	by mail.openembedded.org (Postfix) with ESMTP id 954096012C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2016 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AwHutTfBcz62MKTk2woMmNu1qbpyfYt6hfdn35Fr1Fs=;
	b=ernEE/Go3NeZx35ygBsXjCiQ95uQgbrbcpk5irAkRvsuqA+7wIghqtnRD0ldItluBeVTHRMtLFnQWY0k+iy8YOe6NqfIHchp91jp/JkQqIGwlmZ7vYLPCQJ75aQmY5CqeRsmGqItQz3kA1srSIgdJa5aniMX58IJmBlJfUQZKN8=
Received: from DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.403.16; Fri, 12 Feb 2016 16:23:17 +0000
Received: from DB5PR02MB1175.eurprd02.prod.outlook.com ([10.162.163.21]) by
	DB5PR02MB1175.eurprd02.prod.outlook.com ([10.162.163.21]) with mapi id
	15.01.0403.017; Fri, 12 Feb 2016 16:23:17 +0000
From: Piippo Samuli <samuli.piippo@theqtcompany.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] Commercial License
Thread-Index: AQHRY1/Ceraq1C08+0+nUsE7X99UVp8omwPg
Date: Fri, 12 Feb 2016 16:23:17 +0000
Message-ID: <DB5PR02MB117525C57FE240091B542E5190A90@DB5PR02MB1175.eurprd02.prod.outlook.com>
References: <EC3D8C09-AC4A-40D6-A828-6B6E0CC34678@staylor.ca>
In-Reply-To: <EC3D8C09-AC4A-40D6-A828-6B6E0CC34678@staylor.ca>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=theqtcompany.com;
x-originating-ip: [91.217.248.11]
x-microsoft-exchange-diagnostics: 1; DB5PR02MB1174;
	5:3Swotul/juRdRlsiTom5Vi2qTInK8ym9iFAt3RFPT7BocLejLAJYvKbsJDcjdg2Mqwviuge1GkbqbV4k1YNo1555wPgHMRGQifGm0xbtJiOU5X5vxk4ywLjFSWycz1BRAhoxNtESjbpPALQzQrlWxQ==;
	24:7I2icSRi3Nr24s2PJ4ys7zSLWNNl3CQrIds7rCtoPWyNHFMxVVJ18mTQzSN9SvrVIWLSGV6M9ZrVKDRDmbznfPswAv317GtzURqgga/pR+A=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
x-ms-office365-filtering-correlation-id: 9e458cf0-407b-4dfa-be2f-08d333c8d0bd
x-microsoft-antispam-prvs: <DB5PR02MB11747E11C39830FDD7A6391F90A90@DB5PR02MB1174.eurprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
x-forefront-prvs: 0850800A29
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(450100001)(77096005)(19580395003)(40100003)(2950100001)(5002640100001)(92566002)(66066001)(74316001)(87936001)(189998001)(5008740100001)(106116001)(122556002)(19580405001)(2501003)(110136002)(33656002)(2900100001)(2351001)(76576001)(3660700001)(10400500002)(2906002)(15975445007)(11100500001)(1720100001)(5003600100002)(5001960100002)(50986999)(6116002)(107886002)(76176999)(5004730100002)(3846002)(102836003)(3280700002)(54356999)(86362001)(1096002)(1220700001)(586003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174;
	H:DB5PR02MB1175.eurprd02.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2016 16:23:17.6224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6fce4bb8-3501-41c9-afcc-db0fb51c7e3d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: Re: [meta-qt5] Commercial License
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
X-List-Received-Date: Fri, 12 Feb 2016 16:37:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

We have recipes available for Qt Charts, Qt Data Visualization, Qt Virtual =
Keyboard and Qt Quick 2D Renderer, all modules that are open sourced under =
GPL3 with Qt 5.7. Currently the recipes are available on the commercial Qt =
for Device Creation layer, but plan is to contribute these recipes to meta-=
qt5 once it switches to Qt 5.7.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of S=E9bastien Taylor
Sent: 9. helmikuuta 2016 19:31
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-qt5] Commercial License

I am looking to update the qt5 build to build the commercial version (as op=
posed to the open source) as well as adding the QtCharts and Visualization =
modules which are part of the commercial release.

I was hoping for some feedback as to whether this has already been looked a=
t and opinions on how to best handle toggling the license in the configurat=
ion in a way that can be submitted back into meta-qt5.


--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

