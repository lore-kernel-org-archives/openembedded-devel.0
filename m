Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBAF78672;
	Thu,  4 Jan 2018 13:22:55 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id v187so558382ywc.2;
	Thu, 04 Jan 2018 05:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=umhAv1cjADcVjy6XP8TmP0M0h1Qs+R40NeYgzNSENdY=;
	b=Oc4g91spIkY4vDN3bj1UByJDSKBUL4RXUU6Noy53kQBaZE22NbEDWl8Le06FlEcBRL
	EIebQv7GvUszB9+RQ8GVecrJ0zp2cE+KYYXUqbYSzK6HDVnnwU5PYtq8mSKjyaOZ8P1u
	TmmFGwESPM2Tavcg+Zx1x6xCPq0joWvkmC4IayGBI39o1Q84hhxgADi00a2R8kI1p17H
	VEDdOFn70roIJQBPplLPKII/rloDWkeHwTGqL2oSpIMXBUlK/zVWdWEvtLnKx046VPgy
	1cJxxwpv0WKwwJr0tEKpNFqoJX3g79BDe3XBl1hp7xkq6m0hoYUSiwruDp/sDOrRAdY2
	036A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=umhAv1cjADcVjy6XP8TmP0M0h1Qs+R40NeYgzNSENdY=;
	b=Sd6TY1oLzl9bnmSCkAeR12aiZs1JJrhbhFjgXgZGG3xRBBvIB6rZs8LvQRCQzkWNYF
	zyU35DPC3vhEagM2w9rt+8CLWH6h77IwxG/ZZbUG5rcEGKcP52KLaV9UxtcxXGxRJJWD
	xqCsZfSqgkJSiFq6QpYL9EfKuX4KR/m/rJL0NdF9zbfst4WxkQ+YJi/vkc+igQaM6dG5
	vuzrZjmj6St7u6UF1Zf3O7CYBBqZ0JcpUzEB7P5UpkD1XHmDY6NPuqYQifqGZw6ngGl+
	SnlSgBi4TQxWq9Lb87WcFh3tOKaE/2kGxE5uwDEUNTfcjiiz9D1EmofVxp0DgGtNv7d8
	MKHg==
X-Gm-Message-State: AKGB3mIbhbZD0N5JbVJ+Bot3OcdQ7Uq1Uy//yHMPpL7F1n89qNkep/yu
	rvW5M7qSGW/XyMcO9vHxQ6uZ7/Qa1fvFO96TKbI=
X-Google-Smtp-Source: ACJfBotLSN5ehnMSqVwVGai520hLRaeJp1K/zaQPhmVqmSAIK42KT0PZzhJK4OJ7aQKEzVZJFEoBQ72rl31Tijt225M=
X-Received: by 10.13.242.6 with SMTP id b6mr4059142ywf.254.1515072176308; Thu,
	04 Jan 2018 05:22:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.130.136 with HTTP; Thu, 4 Jan 2018 05:22:55 -0800 (PST)
In-Reply-To: <1a0bbfc2-7b0a-c347-23eb-7cb1087ffb33@balister.org>
References: <CAPyrkgxupO+=0+bmA=+JO+zs=t_i=Pm06GJyRFvYfTb5sXjSBA@mail.gmail.com>
	<1a0bbfc2-7b0a-c347-23eb-7cb1087ffb33@balister.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 4 Jan 2018 14:22:55 +0100
Message-ID: <CALbNGRSz59HjuPX3=TLxxVoJEPrKnSmYMZu9RBf0YnCKU_SJOQ@mail.gmail.com>
To: Philip Balister <philip@balister.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: yocto <yocto@yoctoproject.org>, openembedded-members@lists.openembedded.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Slideshow for FOSDEM
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
X-List-Received-Date: Thu, 04 Jan 2018 13:22:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 3, 2018 at 6:29 PM, Philip Balister <philip@balister.org> wrote:

> On 01/03/2018 09:47 AM, Paul Barker wrote:
> > Hi all,
> >
> > As we've only got one table at FOSDEM this year we're not going to
> > have space for as many bits of hardware as usual. I'd still like us to
> > show off the project and what people are building with OpenEmbedded &
> > Yocto Project though. Given the limited space I think the best way to
> > do this would be to put a slideshow on my laptop.
> >
> > I've made a start on this here:
> > https://docs.google.com/presentation/d/1KYxhsxO-8GxhAreE0GKnTOCPdY6_
> 4uXYIEp6Lc55MB8/edit?usp=sharing
> >
> > I've made this publicly editable so please feel free to add slides for
> > any OE features you want to show off and any projects (professional or
> > hobbyist) built with OE. If anyone can add a slide on project history
> > that would also be great. I'd also like a slide on the latest release
> > and the new features added. Photos of hardware projects using OE and
> > features like Toaster would be especially welcome!
> >
> > I'll give this a final edit before FOSDEM and the put it on rotation
> > on a laptop at the stand. Hopefully it will be useful for future
> > events as well.
>
> Can we build a small board with a largish screen so we can run the show
> on a device running an image built by OpenEmbedded?
>
> Philip
>
> Hi,

currently I am putting together something like a
'diy-rpi-notebook-on-tripod' - WIP no photos yet. Would like to put a music
keyboard in front of it. Area required 1-2 square meters - no table
required. Is such thing accepted / of interest?

Andreas

