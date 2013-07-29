Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8121B60958
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2013 07:48:16 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c13so148803vea.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2013 00:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=A2wciOL/zmSP9L9ZxREk9wpPKKpTzV4kK6ckog+Z1iM=;
	b=SVHk1eainK5p56mGKiX02pY5RgfYRNPFsI+Qs7HuW8SPx0hyfVviWu2Kehp6+8Atkj
	dshel9O94kxBwQ8SVTwV+ejJW+Crnlnk4O9QEfDqWZP62KrXV80/szg/Yfy40KWQkgfq
	Bt4Uwo2OaAx6vzLv/mps1a706h1jwaQ4qPdct9kih+qnp8Bhl52B4vgDzoDQvrgFUmol
	VxbrgkgB2XirxP+G63cE46u4hajBUtZ6hLRy6XSwkl7CQ94fu5I4hOernWeGaYJJvhxJ
	XBO8XaTMT2MDJPQdpTyJIPOUAsZqHASnTww2F0MdDgrbh9pVD0NDOUe5ucV4PFpMMr++
	3PEA==
X-Received: by 10.52.157.98 with SMTP id wl2mr6562272vdb.39.1375084097008;
	Mon, 29 Jul 2013 00:48:17 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Mon, 29 Jul 2013 00:47:36 -0700 (PDT)
In-Reply-To: <1989833.hj21tvi2MC@helios>
References: <51D42561.8060907@ts.fujitsu.com> <51D6BD77.4050008@ts.fujitsu.com>
	<CANyK_8deKJoCUCEnQeqCyBJNy0eKkk2GmJcX6ZDG80A66u52ng@mail.gmail.com>
	<1989833.hj21tvi2MC@helios>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 29 Jul 2013 08:47:36 +0100
X-Google-Sender-Auth: bxro1LgzpFijY_kP960sbPQ07DI
Message-ID: <CANyK_8evZbD5U_ykUcp5MjtotWZVVWvNJdsmhRf5fYYMW6FtRg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: bitbake dies with an python exception | AttributeError: 'NoneType' object has no attribute 'rfind'
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
X-List-Received-Date: Mon, 29 Jul 2013 07:48:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 July 2013 17:46, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> Hi Paul,
>
> On Sunday 28 July 2013 15:09:46 Paul Barker wrote:
>> Bitbake has no dylan branch so I just assumed I was correct using
>> master. Am I wrong here?
>
> Technically the matching bitbake branch for dylan is 1.18. I'm not sure if we
> spell this out anywhere, we probably should if not.
>

I'll drop back to the 1.18 branch to be safe. I couldn't find anything
telling me which branch to use but I only spent a couple of minutes
looking so I could easily have missed something.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

