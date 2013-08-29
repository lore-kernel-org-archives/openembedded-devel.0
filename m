Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 598FE6BED3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:41:42 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id x18so1109043lbi.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 12:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HW597z7bSsaXcgFIiBfZIO4ZS//sc3yB9EgeRciWAwo=;
	b=o/3R7AcAPs8ZmBepWp4u7s2P4hejVXe07ZkDy5prwb84Lg93/p9i4Mzi6p9lS38OIj
	Kl4WmNGfN66s0DIGXBtLzqx44ktoalvRZv9D2kTyCy6CqYkNOTppw9R9qtIFGtkAYeoY
	yN7SvtU409o4xkHpJgb0aft/UtUAstWsHjV+yRcpkWBXdJo657Faqeb9GnUtF6NLLU9Z
	AEBTkAjhTEVH3jxSzuvhXP75ApIdhQRD3QI79ZwIjHheHRgge6TQO4enWWtRiL1MbX8A
	HZaugFLrdSNOzOeRdxIkkhiafMX17ystdKDRyV4t44pR2kF2gJEWteUXhFaYrEfoiwgP
	TsuQ==
MIME-Version: 1.0
X-Received: by 10.112.155.39 with SMTP id vt7mr4452676lbb.29.1377805302449;
	Thu, 29 Aug 2013 12:41:42 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 12:41:42 -0700 (PDT)
In-Reply-To: <E1133807-C464-4793-8EFB-4328B0FCE7BF@gmail.com>
References: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
	<CADkTA4NWhz3rmAqH=yB_5H4V4f11w4qZdYUTOG73SNLyv6R-=A@mail.gmail.com>
	<1CD7EF41-C972-4088-B6CD-21975EEBB93B@gmail.com>
	<CADkTA4M=sOdCcYWXeoM5HTNDq8P661XZyGv8V+KHXgi=WZw5Vg@mail.gmail.com>
	<E1133807-C464-4793-8EFB-4328B0FCE7BF@gmail.com>
Date: Thu, 29 Aug 2013 15:41:42 -0400
Message-ID: <CADkTA4NTetttQWMsH4faYDLezrDHVpLO_eLg8oeuE+2-W1h09Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2013 19:41:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 3:39 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> On Aug 29, 2013, at 11:24 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>>>
>>> I mean either you don't publish anything that Wind River chooses to keep proprietary
>>> or support the machine configurations defined in the linux-yocto meta branch.
>>
>> I'm not following what you mean here  .. sorry.
>
>
> I'm referrring to the qemuarma9 machine definition in the linux-yocto kernel meta-branch.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.8/tree/meta/cfg/kernel-cache/bsp/qemuarma9?h=meta
>
> It's presence indicates that it was developed at some point, but not released with full support.

There never was any runqemu or any integration more than what you see there.
Everything was pushed that was available, and I mentioned a few days ago that
I've just been carrying it along in case it ever became useful again.

Cheers,

Bruce

>
> Elvis Dowson



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

