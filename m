Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C2A0C721BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 02:17:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43922938"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Nov 2014 10:14:09 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAP2H7KL005369
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 10:17:07 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Tue, 25 Nov 2014 10:17:28 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 5/5] sgpio : add new recipe
Thread-Index: AQHQAlXgPVyUTqKw9ESUlv80qPM1pZxngMsAgAMcJACABgjGUA==
Date: Tue, 25 Nov 2014 02:17:27 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8738E3E9A@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1416222008-9218-6-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20141119143330.GF3315@jama> <20141121140300.GF2163@jama>
In-Reply-To: <20141121140300.GF2163@jama>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.35]
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] sgpio : add new recipe
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
X-List-Received-Date: Tue, 25 Nov 2014 02:17:30 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Friday, November 21, 2014 10:03 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH 5/5] sgpio : add new recipe
>=20
> On Wed, Nov 19, 2014 at 03:33:30PM +0100, Martin Jansa wrote:
>=20
> But there is another issue:
>=20
> ERROR: Command Error: exit status: 1  Output:
> Applying patch 0001-Makefile-modify-some-parameters.patch
> patching file Makefile
> Hunk #1 FAILED at 23.
> 1 out of 1 hunk FAILED -- rejects in file Makefile Patch
> 0001-Makefile-modify-some-parameters.patch does not apply (enforce with -=
f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
gpio/
> 1.2.0.10-r0/temp/log.do_patch.5210
> NOTE: recipe sgpio-1.2.0.10-r0: task do_patch: Failed
> NOTE: recipe vlan-1.9-r0: task do_unpack: Succeeded
> ERROR: Task 15324
> (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extend=
e
> d/sgpio/sgpio_1.2.0.10.bb, do_patch) failed with exit code '1'
>=20
Thank you very much.
This is probably the problem of file format.
I will fix it and resent later.

Best regards,
Li xin
>=20
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

