Return-Path: <greghwang@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 30AEB7805C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 16:15:18 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id d14so15756384qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DQbDvJtTvqXKVvxjiE8hzxY4rpWNiDI3R99YLQJNkbg=;
	b=N4BT6uPkaWLVlZaIEPnSzHF+IsDo1CWlJiZQdhPzeWr30AERUXVIxLUS2Iq6I9DNZu
	K+f0N21sx8isn5zxTO/egIXVdURMfSrQiWMef4hcWNOT/7MDbE1CrpKCrsokLvtEoO+m
	EZAQsvrjF+R82Bxhfe8PP7sJkta2CkFi3enVlTZLfQqfuoR7sND/SWGx6BHZFiBCxwx3
	jQZabn1OIeNjJo200HEHmnDZX7gr2w9JQ/6bYgOWMca3nFavYbAMubY6XwF8Qpgic4Te
	3L3lwXu42e3pBqwxH9ZrditHLracvq3J0rzeISazHCPdFdE9HcjkJTs6ALTuGzaG2p3m
	B/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DQbDvJtTvqXKVvxjiE8hzxY4rpWNiDI3R99YLQJNkbg=;
	b=ghwql0pQyoeIivASqjCmGcWQKZd7JJwzqJ+DJ4dXeB+iW6sjZAuyl7/AUYCuNb3Us2
	B4hc+/QI5B181pYT+3ySB1vOBz9M9gMcx5GG98ybUJ5PBcnfGtinp5r9LZf3BnJDzPky
	zdHMm6auwIapWLP2uvmykCK2Zey+hB6Us1ePZrDALBRiQbjO33WOlFUB3x0QdQdjUsms
	gDxeRcKRB3dA/zSzFyRnV6HaqZLxmRDtqS7K/Pv0BDpXqpTmOeo4KmPPv/FYt8qizUOw
	l67TILq97/kFYVByK20v8xwTh4zG8VXy9/6OmSGtHum8HuwCbEWpCTVfhdpmlM18j4Z2
	XcqA==
X-Gm-Message-State: AODbwcDvTqprZHHdRMlIEn9p5c/8TWSJzf0J6Dbl0PcpKrw/FCXuEIPr
	N39OAQYXWl60V+b6PYhSGRzyGWVIwweYIBk=
X-Received: by 10.55.214.86 with SMTP id t83mr28260346qki.241.1496247320143;
	Wed, 31 May 2017 09:15:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.158.107 with HTTP; Wed, 31 May 2017 09:15:19 -0700 (PDT)
In-Reply-To: <1496243833.26945.66.camel@linux.intel.com>
References: <AM5PR0402MB2769D2B8C27E4DDADE64D7CEC4F00@AM5PR0402MB2769.eurprd04.prod.outlook.com>
	<1496243833.26945.66.camel@linux.intel.com>
From: Greg Hwang <greghwang@gmail.com>
Date: Wed, 31 May 2017 12:15:19 -0400
Message-ID: <CAL2S=Ku1-Ycwo9FhJhnr=_D9UuQYS6WC=841pu8A20YDR8x+-g@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: URL of devmem2
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
X-List-Received-Date: Wed, 31 May 2017 16:15:19 -0000
Content-Type: text/plain; charset="UTF-8"

Martin,

I noticed this issue with devmem2 as well.  I did some digging and I found
this post on the mailing list from Dec 2106

http://lists.openembedded.org/pipermail/openembedded-devel/2
016-December/110568.html.

Its possible that lartmarker domain has been down for some time.

It looks like the version of devmem2 on sources.openembedded.org has
changed and is now identical to the the updated devmem2.c on free-electrons
mirror, AND it is the same as the updated version in
http://sources.openembedded.org/devmem2-new.c.  This means the checksum on
the open embedded mirror doesn't match the checksum called out in the
devmem2 recipes older than pyro.

 What is the recommendation for developers who need to stay on older
branches such as Jethro for development cycle reasons?  Is it as easy as
contacting the maintainer of the open embedded source mirror to check if
devmem2.c has been modified lately?

Greg



On Wed, May 31, 2017 at 11:17 AM, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> On Tue, 2017-05-30 at 20:10 +0000, Martin Siegumfeldt wrote:
> > Hi,
> >
> >
> > Is there any chance that http://git.openembedded.org/
> meta-openembedded/commit/?id=fc801961457fe2fbb24973bb43b302ad46044cb8 and
> http://git.openembedded.org/meta-openembedded/commit/?id=
> 6c584374a599f6f8d3607f20ecfc13a67ccf1da1 will be backported to release
> branches? lartmaker domain seems no longer available - AFAICS all branches
> older than pyro is affected.
> >
>
> without much contexts on these two patches, send the backported patches
> with proper stable releases names as prefixes to the mailing list.
>
> >
> > Thanks,
> >
> > Martin
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

