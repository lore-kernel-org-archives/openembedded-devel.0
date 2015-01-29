Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AD26B60043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 09:47:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56820214"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jan 2015 17:44:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0T9ktUi029759;
	Thu, 29 Jan 2015 17:46:56 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Thu, 29 Jan 2015 17:47:40 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v3] sgpio: add new recipe
Thread-Index: AQHQNrdnqKlrTgTj00WgZ4zE+lXa7ZzU3dKAgAIClOA=
Date: Thu, 29 Jan 2015 09:47:35 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8738F1C4B@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <20150122151631.GB2456@jama>
	<1421981390-3786-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20150128105343.GF2477@jama>
In-Reply-To: <20150128105343.GF2477@jama>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.35]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v3] sgpio: add new recipe
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
X-List-Received-Date: Thu, 29 Jan 2015 09:47:41 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, Jansa:

Thank you very much for your reply.

> ERROR: Command Error: exit status: 1  Output:
> Applying patch Makefile-error-fix.patch
> patching file Makefile
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file Makefile Patch Makefile-error-f=
ix.patch does
> not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> NOTE: Running task 24080 of 31430 (ID: 15862,
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gno
> me/libwnck/libwnck3_3.0.2.bb, do_rm_work_all)
> ERROR: Logfile of failure stored in:
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/s=
gpio/
> 1.2.0.10-r0/temp/log.do_patch.22993
> NOTE: recipe sgpio-1.2.0.10-r0: task do_patch: Failed
> ERROR: Task 15924
> (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extend=
e
> d/sgpio/sgpio_1.2.0.10.bb, do_patch) failed with exit code '1'
>=20
I will rebuild it on my Ubuntu host, and resent the patch.

Best regards,
Li xin


