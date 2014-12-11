Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 809FE601F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 08:55:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44864398"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Dec 2014 16:52:33 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBB8tTji021431
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 16:55:29 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Thu, 11 Dec 2014 16:56:01 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] openct: add new recipe
Thread-Index: AQHQE1C+sShDOLX570yKE1rx0Au0SZyIPt2AgAHSB9A=
Date: Thu, 11 Dec 2014 08:55:51 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8738E94D6@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1418088972-3518-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20141210123539.GC2473@jama>
In-Reply-To: <20141210123539.GC2473@jama>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.35]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] openct: add new recipe
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
X-List-Received-Date: Thu, 11 Dec 2014 08:56:01 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, Jansa:

Thank you very much for your reply.
Those days you send some build errors about the recipe=20
Which I had committed.
But indeed the errors did not occur in my compile environment.
So I will do some extra test until I find the bug and sent new versions. :)

Best Regards,
Li=20

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Wednesday, December 10, 2014 8:36 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] openct: add new recipe
machines via TCP/IP.
>=20
> Fails to build because of bashisms in do_install:
> http://errors.yoctoproject.org/Errors/Search/Details/6223/1/10/3559
>=20
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

