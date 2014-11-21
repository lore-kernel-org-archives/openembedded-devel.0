Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 42D0C721C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 07:15:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43774603"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2014 15:12:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAL7F2UW019177
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 15:15:02 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Fri, 21 Nov 2014 15:15:18 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: lvm2 compile error
Thread-Index: AdAEbN96Q+W9lsi2S96Zrwlpiu5PbQAAx3AwAABU/oAABHs38AA110jA
Date: Fri, 21 Nov 2014 07:15:22 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8738CE14B@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <A8FC939F80655644A89BB21CCD3741E87C670D@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CCCB4BC1@G08CNEXMBPEKD02.g08.fujitsu.local>
	<A8FC939F80655644A89BB21CCD3741E87C674D@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CCCB4C3F@G08CNEXMBPEKD02.g08.fujitsu.local>
In-Reply-To: <30DC4EDFD798C94083F3E083754532CCCB4C3F@G08CNEXMBPEKD02.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.35]
MIME-Version: 1.0
Subject: Re: lvm2 compile error
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
X-List-Received-Date: Fri, 21 Nov 2014 07:15:23 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Bian, Naimeng
> Sent: Thursday, November 20, 2014 1:41 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] lvm2 compile error
>=20
> Please add "SECURITY_CFLAGS_pn-lvm2 =3D "${SECURITY_NO_PIE_CFLAGS}"" into
> security_flags.inc of your distro.

It is work.
Thank you very much for your reply.

Best regards,
Li xin



