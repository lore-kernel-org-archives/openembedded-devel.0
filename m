Return-Path: <Arturo.Buzarra@digi.com>
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
	[67.219.250.4])
	by mail.openembedded.org (Postfix) with ESMTP id DAE637DD6A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 07:31:46 +0000 (UTC)
Received: from [67.219.250.101] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.us-west-2.aws.symcld.net id 7B/5A-17907-367625D5;
	Tue, 13 Aug 2019 07:31:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRWlGSWpSXmKPExsXi5LtOQDcxPSj
	WYEO7lcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH10ynGggmCFYebv7M0MD7k72Lk4hASWMUo
	cfDkUnYIZy+jxO1/y1i7GDk52AQMJT72zmQBsUUEYiSWnj/PBmILC4QBNXxngohHS0xf9ROon
	gPI1pO4+UsRJMwioCqxY8JeJpAwr4CvxN2vsSBhIQFTiZn7frGBhBkFVCQm7C8GCTMLiEvcej
	IfbKCEgIDEkj3nmSFsUYmXj/+xQtgKEksXHWOFqM+TuH/3PiOIzSsgKHFy5hMWiPEqEs+fL2e
	fwCg0C8nYWUhaZiFpgYjrSCzY/YkNwtaWWLbwNTOMfebAYyZk8QWM7KsYLZKKMtMzSnITM3N0
	DQ0MdA0NjXQNjUG0oV5ilW6iXmmxbnlqcYmukV5iebFecWVuck6KXl5qySZGYCylFDTl72B8P
	/ON3iFGSQ4mJVHe6WcCY4X4kvJTKjMSizPii0pzUosPMcpwcChJ8IqmBsUKCRalpqdWpGXmAO
	MaJi3BwaMkwssMkuYtLkjMLc5Mh0idYrTnmPBy7iJmjjurlgDJj2DyO4gUYsnLz0uVEuf9DtI
	mANKWUZoHNxSWhi4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZNBZnCk5lXArf7FdBZTEBn
	vbkRCHJWSSJCSqqByacj48Zth/0+0Vqn/3kn9L+9r9BwiqPSZw/7D5sspcauH+KtCgpKe+vKO
	lOVFN8Yrv02aZuq+94Z02zuvRXN4/luzXYmVPgXc6nNvZAD8+pcWvpOsX174PbooJ5TWc31OR
	ZMd6QMlsT5nJoo/9eFP4b3+11d1mtHZ8VfmO7U0c0erMX6yVbrttSdFyL1vVNXbOJ+cP0XY3r
	QLA5x0apjNTUaJ75eN/sm8Td8c6G7gzzLM51kSZ0pSxzm+v/uuc1rqWd25FtrP9Mnh+3fRE1b
	Q3In2zeF71Wat8vyab9vHbPCrsmxpq/yrUKjrS4JhERsXRIdFrK20S9U8f38j1uOdzgzy5W9k
	Hna1i9TxK3EUpyRaKjFXFScCAC2ViBQvgMAAA==
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-18.tower-325.messagelabs.com!1565681504!3179!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32218 invoked from network); 13 Aug 2019 07:31:45 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-18.tower-325.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 13 Aug 2019 07:31:45 -0000
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 13 Aug 2019 02:31:44 -0500
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([fe80::c47f:be41:1dc7:5ab8%11]) with mapi id
	14.03.0468.000; Tue, 13 Aug 2019 09:31:42 +0200
From: "Buzarra, Arturo" <Arturo.Buzarra@digi.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Re: Re: [oe] [meta-oe][PATCH v2] lvm2: Fix RDEPEND on lvm2 to
	lvm2-udevrules
Thread-Index: AdVRpY8OSkqyGKGfShCA8tz3GZh99Q==
Date: Tue, 13 Aug 2019 07:31:41 +0000
Message-ID: <1F1C12BB7E7BAA40ACCAD76309F0BEC301C8D8D3@dor-sms-xch01.digi.com>
Reply-To: "Buzarra, Arturo" <Arturo.Buzarra@digi.com>
Accept-Language: es-ES, es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.111]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Tue, 13 Aug 2019 07:31:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any feedback about this patch?

Thanks,

