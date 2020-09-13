Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.36252.1599996087123901712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2020 04:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.198, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from bucephalus (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8E3C3C0002;
	Sun, 13 Sep 2020 11:21:23 +0000 (UTC)
Message-ID: <3745c1f552302c5287520a2e81a729995aac6b43.camel@redrectangle.org>
Subject: Re: [oe] [meta-oe][PATCH] consolation: Add recipe
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Sun, 13 Sep 2020 04:21:19 -0700
In-Reply-To: <CAMKF1srObQgDZQ_M8Kot_Bj0gFLO1m38MA-3bTsvi_n3_fbATg@mail.gmail.com>
References: <20200913021142.1262266-1-robert.joslyn@redrectangle.org>
	 <CAMKF1srObQgDZQ_M8Kot_Bj0gFLO1m38MA-3bTsvi_n3_fbATg@mail.gmail.com>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-12 at 19:20 -0700, Khem Raj wrote:
> On Sat, Sep 12, 2020 at 7:12 PM Robert Joslyn
> <robert.joslyn@redrectangle.org> wrote:
> > Consolation is a daemon that provide copy-paste and scrolling support
> > to
> > the Linux console.
> > 
> > It is based on the libinput library and supports all pointer devices
> > and
> > settings provided by this library,
> > 
> > Similar software include gpm and jamd.
> > 
> 
> Can you also add to to appropriate packagegroup in /packagegroup-meta-
> oe.bb

Sure, I'll send a v2.

Thanks,
Robert

