Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C18E6BE2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:39:57 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id r10so876356pdi.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 12:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=o/Z2X5OGKV3LO1/FLEVpZmOdSS8+buSEUOcqdkoG5kc=;
	b=j37ROK6yhH66AfEBybCsG4g8Oi+3dv0kbcZ6S/Suxukx+DFlMnyiv1aWTQ47rQxGjg
	6zVA7qbbjndN14PxtkmZCdT5Gmgnj7ADe3VH0U0NWC31Lo2dhZfbhywsbqf0anquN3hs
	dfXtL+IhyqRXAcz15U/7XqaW/nCyMPYP4W9ItnN8wCx+YJAiVrln7/TvpyHzDR/DZAkC
	7d7Q4q9mkE3GLWPaTIK42V4t7eK2bBnYhXrQvpymb8k1GcMUWd010R/pxcliT/AcQHMt
	mSDaIRkeA6acC/gPuFTUWO1+cne29UZEvWmOlbrpK25/RmdE4+1JhwqBKoipoT6Av40p
	VsbA==
X-Received: by 10.68.223.161 with SMTP id qv1mr5597490pbc.79.1377805198461;
	Thu, 29 Aug 2013 12:39:58 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	iu10sm42708744pac.18.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 12:39:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CADkTA4M=sOdCcYWXeoM5HTNDq8P661XZyGv8V+KHXgi=WZw5Vg@mail.gmail.com>
Date: Thu, 29 Aug 2013 23:39:50 +0400
Message-Id: <E1133807-C464-4793-8EFB-4328B0FCE7BF@gmail.com>
References: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
	<CADkTA4NWhz3rmAqH=yB_5H4V4f11w4qZdYUTOG73SNLyv6R-=A@mail.gmail.com>
	<1CD7EF41-C972-4088-B6CD-21975EEBB93B@gmail.com>
	<CADkTA4M=sOdCcYWXeoM5HTNDq8P661XZyGv8V+KHXgi=WZw5Vg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [oe-core] QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 19:39:57 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 29, 2013, at 11:24 PM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:

>>=20
>> I mean either you don't publish anything that Wind River chooses to =
keep proprietary
>> or support the machine configurations defined in the linux-yocto meta =
branch.
>=20
> I'm not following what you mean here  .. sorry.


I'm referrring to the qemuarma9 machine definition in the linux-yocto =
kernel meta-branch.

=
http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.8/tree/meta/cfg/ke=
rnel-cache/bsp/qemuarma9?h=3Dmeta

It's presence indicates that it was developed at some point, but not =
released with full support.

Elvis Dowson=

