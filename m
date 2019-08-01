Return-Path: <Arturo.Buzarra@digi.com>
X-Greylist: delayed 811 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Aug 2019 08:08:17 UTC
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
	[67.219.246.4])
	by mail.openembedded.org (Postfix) with ESMTP id 75B817F539
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 08:08:17 +0000 (UTC)
Received: from [67.219.246.101] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.us-east-1.aws.symcld.net id 09/84-10960-7CA924D5;
	Thu, 01 Aug 2019 07:54:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRWlGSWpSXmKPExsXi5LtOQPf4LKd
	Yg/Pt3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a8eZ/YCpqEKvb/ms/WwHhSoIuRi0NIYBWj
	xN+LD9ggnNWMEi/n3GCEcPYwSqzbPZ+5i5GTg03AUOJj70wWEFtEIEZi6fnzbCC2sECQxKnzO
	5kg4uESH7+uYYaw9SRer+hkBbFZBFQknn5tAKvnFfCVmPdoG3sXIwcHI1B8wv5ikDCzgLjErS
	fzwcZICAhILNlznhnCFpV4+fgfK4StILF00TFWiPo8iR8TDzNBjBSUODnzCdhpQkAjnz9fzj6
	BUWgWkrGzkLTMQtICEdeRWLD7ExuErS2xbOFrZhj7zIHHTMjiCxjZVzGaJRVlpmeU5CZm5uga
	GhjoGhoa6RrqGpka6yVW6SbplRbrpiYWl+ga6iWWF+sVV+Ym56To5aWWbGIERlNKAePfHYynZ
	73RO8QoycGkJMrbmeMUK8SXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV20mUE6wKDU9tSItMwcY2T
	BpCQ4eJRFeHpA0b3FBYm5xZjpE6hSjPceEl3MXMXPcWbUESH4Ek99BpBBLXn5eqpQ4bxBImwB
	IW0ZpHtxQWCK6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYd+MMoCk8mXklcLtfAZ3FBHSW
	MCvYWSWJCCmpBqanYo2eCiLPDJYXfypedTeMZ9EcFfWKul8v+25yaCyZcO66zT+//BaNtTt+z
	7R/O7GngZtXfO/xd35rdvYHFcz4+6jfVe/BEfZkzaks3HlFCZ2R9zvXBwp++Xhi1f1z6dXsm0
	Qm/9xr/ukQu0L5F7k1l3PdHru7ccq+PaThd/LuVP+rX951fVDefyN87a78BJYFL6YpzXI4eHz
	fbH9PB8tOtUlT5G4dt0mYfObu9+Msz1iPaky737HVsCKOWzxgzc+HooaOP1T0/of8WDl5zs4z
	J+ZIsghueMp8aNK8GVMnnLf/+MwuwnH/N75mFX7l+ZPXpi280HMk5sZu1R8vGpsZjucv/yFam
	6IfqrBjjenvZ0osxRmJhlrMRcWJAEGpPoS/AwAA
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-10.tower-385.messagelabs.com!1564646086!37968!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19253 invoked from network); 1 Aug 2019 07:54:47 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-10.tower-385.messagelabs.com with ECDHE-RSA-AES256-SHA384
	encrypted SMTP; 1 Aug 2019 07:54:47 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 1 Aug 2019 02:54:46 -0500
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 1 Aug 2019 02:54:45 -0500
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([fe80::c47f:be41:1dc7:5ab8%11]) with mapi id
	14.03.0468.000; Thu, 1 Aug 2019 09:54:44 +0200
From: "Buzarra, Arturo" <Arturo.Buzarra@digi.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Re: Re: [oe] [meta-oe][thud] lvm2: Fix RDEPEND on lvm2 to
	lvm2-udevrules
Thread-Index: AdVIPiiqUB3a9fXxQnmvVV25gejuzA==
Date: Thu, 1 Aug 2019 07:54:43 +0000
Message-ID: <1F1C12BB7E7BAA40ACCAD76309F0BEC301C8B602@dor-sms-xch01.digi.com>
Accept-Language: es-ES, es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.111]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][thud] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Thu, 01 Aug 2019 08:08:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Any feedback about this patch?

Thanks in advance,

