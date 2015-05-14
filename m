Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0112.outbound.protection.outlook.com [157.56.111.112])
	by mail.openembedded.org (Postfix) with ESMTP id 021717226D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 06:44:33 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.160.10; Thu, 14 May 2015 06:44:33 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0160.009; Thu, 14 May 2015 06:44:33 +0000
From: Guo Chunrong <B40290@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][fido][PATCH] lmsensors-config: add
	rrdtool to lmsensors-config-cgi RDEPENDS
Thread-Index: AQHQgXTi45U4OazR+Um0bRWxou0MdJ1iQooAgBjdLbA=
Date: Thu, 14 May 2015 06:44:32 +0000
Message-ID: <BY2PR03MB441E6C1684F212E54060F7E84D80@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1430199212-16711-1-git-send-email-b40290@freescale.com>
	<CAP9ODKrixZ2FWY1Upb3ecpji_cbbJee1ifeG2VuEYXbj6OC5Ug@mail.gmail.com>
In-Reply-To: <CAP9ODKrixZ2FWY1Upb3ecpji_cbbJee1ifeG2VuEYXbj6OC5Ug@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [199.59.231.64]
x-microsoft-exchange-diagnostics: 1; BY2PR03MB441;
	3:A85t7ipBzRo2cQdt30r6lM0Af3wGrA3anPunyqdVh7bzYkElXdB4NSPVBXiee54zjgjEWZJU0ZBwQhM9n8vSiFFgFey8EfRVrofRFiDKezsC0cstaBKEzgP8zlxxXJzjj6ZihoNfCeKOUfUvRW3sug==;
	10:lkPjaBXyCcNnv8nQeorMOwFYiIIcFl9LlqrdmvTdKHhU4Sc1GaG85a6NzR0RFGtYOcf58Bj45Ki1ECyzrDPVLFh/iw+0LJydYL7zqEnhIs0=;
	6:A+50Kd/tEpERDsA+xOIzerZV5mJXmp89U3WtpKRcRqJJoR2WirjqmXlwhk0OQHZA
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
x-microsoft-antispam-prvs: <BY2PR03MB441912DB4B3648EB1D6720E84D80@BY2PR03MB441.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY2PR03MB441; BCL:0;
	PCL:0; RULEID:; SRVR:BY2PR03MB441; 
x-forefront-prvs: 0576145E86
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(24454002)(51704005)(377454003)(230783001)(106116001)(74316001)(87936001)(40100003)(2656002)(122556002)(16601075003)(2501003)(76576001)(2351001)(33656002)(86362001)(54356999)(76176999)(50986999)(66066001)(450100001)(62966003)(77156002)(19580405001)(19580395003)(5001960100002)(107886002)(99286002)(92566002)(102836002)(77096005)(15975445007)(189998001)(2900100001)(2950100001)(1720100001)(46102003)(110136002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2015 06:44:32.5468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB441
Subject: Re: [meta-networking][fido][PATCH] lmsensors-config: add rrdtool to lmsensors-config-cgi RDEPENDS
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
X-List-Received-Date: Thu, 14 May 2015 06:44:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pings!

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
Sent: Tuesday, April 28, 2015 7:02 PM
To: OpenEmbedded Devel List
Subject: Re: [oe] [meta-networking][fido][PATCH] lmsensors-config: add rrdt=
ool to lmsensors-config-cgi RDEPENDS

On Tue, Apr 28, 2015 at 2:33 AM,  <b40290@freescale.com> wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
>   QA reports a warning because lmsensors-config-cgi uses rrdtool, but doe=
s not declare runtime dependency on it.
>   Add rrdtool to RDEPENDS_${PN}-cgi.
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

Martin, I replied in the other one. The second cherry-pick is the original =
patch this refers to.
--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

