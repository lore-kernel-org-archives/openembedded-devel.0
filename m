Return-Path: <jefro.net@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id DED0177E86;
	Wed, 20 Sep 2017 18:25:13 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 13so9603883wmq.2;
	Wed, 20 Sep 2017 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Vec7Pexr6nTAMgAGzBsVKzttXYgwNO8+MdJX7Ciwnxo=;
	b=taCAS3DOruwsS7l9X7J6UuxuBPPP1rs2Wm1Z7aw+eP/3yH6YGIhTwNoWhD6wANO6t2
	fBWp5jDdaQ1TO/x/loOZOsoJ7CJPoSBa/bmtNBzexBgKN/+6l0VwhMe98YfldB28evys
	iILJMvuT7a0eQZ+6OLiGRp7E5LOyCyeV+js9POdzNnP8Xp5TvMdKB+yMtc9+MxPkzN+T
	PogP3X0wYyuceyrYVLuTb4PZp3+uqR7b+K4XjB2KoNkeyo4GcY6g3SZfTR01KzK19zeZ
	RWyB0hk8c87tCsCoM5zvy1B7LX1pnAcOPv8fSy++3p/AqxVb599sThLidty9lM1ON3pN
	/iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Vec7Pexr6nTAMgAGzBsVKzttXYgwNO8+MdJX7Ciwnxo=;
	b=WJI6URoKrhMP7XLdSbaNQvCa32gcXCVFe4JtFPpXoRpDorg/WBU1GmxutWMVtMmJSj
	K75UlgrBef3GzEC8Rrnwg7UYcYMTNo8G3hlCdTMZsPzVO87bDr627ebLsX3z2crJGRqq
	+OBROBqeIRMHQTC97DjQo72EVClPz2wipfhZIustFAhcD7dowzYR4cmIc5JTCGOp7ho2
	86l4dwrs7jxqsyxOXbv/7QEsKPuuXcPUlH6YWfCIfaZkdRJ4OVsAQ6G/6gc5IyLOG/iI
	SJVpcxqY6q6vKsVtKxWWZbzzis5KAH8cAbjcHb5iEnCGm62yqWtbneVPo1tjBxLsUj4s
	qw3A==
X-Gm-Message-State: AHPjjUhsgRK/Akq7ieRtkfXnAOy5kpuGoS82ZXBClSYe2HEDs5wylAL7
	Hw8q9JmHIn87uYsMj/Syiv5wAAPcGU2S0tQubtI=
X-Google-Smtp-Source: AOwi7QC3thBtCImxUcbfe2tQeLNyt818Oon4vN/slQ66BreEM2HpkxmE99jJHOO6BTk9uF7mcUUaHp27Ytig99KRq7c=
X-Received: by 10.28.191.88 with SMTP id p85mr5104962wmf.135.1505931914437;
	Wed, 20 Sep 2017 11:25:14 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.134.180 with HTTP; Wed, 20 Sep 2017 11:24:53 -0700 (PDT)
In-Reply-To: <CAMKF1spb4tz=te84G=JA40HxiF+wX=YSJnJcK8viyx_OwZ87uw@mail.gmail.com>
References: <c2ec1aa7-8279-78f1-6523-c345af1ffe8f@mentor.com>
	<CAHUNapQDGe3b4Nmg6OmL0hxkMGyY9e3z=GKdkOW8VuJe9-q2Ew@mail.gmail.com>
	<CAMKF1spb4tz=te84G=JA40HxiF+wX=YSJnJcK8viyx_OwZ87uw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Wed, 20 Sep 2017 11:24:53 -0700
X-Google-Sender-Auth: 9bUMsyP5WxsKC_60R6gaxFquFN4
Message-ID: <CA+YB3rZv+=nB=7J98XGqemV5GHW3QkmA7siyn-vArqfK8GHKmA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: OE general meeting before OEDEM next month.
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
X-List-Received-Date: Wed, 20 Sep 2017 18:25:14 -0000
Content-Type: text/plain; charset="UTF-8"

Zoom might be easier, as people can dial in or connect online. We'll make
it work.

On Tue, Sep 19, 2017 at 12:13 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Sep 19, 2017 at 9:54 AM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> > On Tue, Sep 19, 2017 at 11:34 AM, Sean Hudson <sean_hudson@mentor.com>
> wrote:
> >>   Meeting information, including dial-in numbers, is on the wiki. [2]
> >
> > In addition to the above, we could also make use of the little-used
> > #oe-meeting channel on freenode (?)
>
> +1
>
> I can dial in. Or someone can setup a zoom meeting
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Jeff Osier-Mixon - Open Source Community Manager, Intel Corporation

