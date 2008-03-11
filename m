Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZE6a-0005Nj-Bl
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 00:42:02 +0100
Received: by ug-out-1314.google.com with SMTP id i24so244397ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 16:40:00 -0700 (PDT)
Received: by 10.78.147.6 with SMTP id u6mr19900277hud.13.1205278799890;
	Tue, 11 Mar 2008 16:39:59 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id j33sm501443ugc.63.2008.03.11.16.39.55
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 16:39:57 -0700 (PDT)
Date: Wed, 12 Mar 2008 01:40:43 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080312014043.572c6a26@widy.localdomain>
In-Reply-To: <47D6AF65.1020007@am.sony.com>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
	<1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
	<1205239153.4521.53.camel@dax.rpnet.com>
	<20080311150320.7c31b2f6@widy.localdomain>
	<1205243052.4521.82.camel@dax.rpnet.com>
	<47D6AF65.1020007@am.sony.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.172
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2008 23:42:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 11 Mar 2008 09:12:21 -0700
Tim Bird <tim.bird@am.sony.com> wrote:

> Richard Purdie wrote:
> > On Tue, 2008-03-11 at 15:03 +0200, Paul Sokolovsky wrote:
> >> It's nice to have that said explicit - different. Supposedly it's
> >> more powerful for developers, but how good it is for end users?
> >> How many industry entities select git as their in-house SCM? I
> >> doubt that too many, knowing too well that many still select just
> >> CVS.
> 
> 
> 
> > Regarding industrial entities, hopefully we call agree CVS is a
> > pretty bad SCM and that proves said industrial entities don't know
> > what they're doing, usually since it often it comes down to
> > politics rather than technical merit. I know of a few surprising
> > companies using git FWIW although I know of a few abominations in
> > use too.
> 
> Just a data point...
> Sony uses git as its in-house SCM for Linux-related work.

Well, that's no wonder. Linux uses git, so everyone who does Linux
development uses git. But now people think that: 1) if Linux kernel
uses it, that everyone else must use it; 2) just as for many years
before people have been thinking that there's no other SCM except CVS
which can do better, then now they think there's no other DSCM except
GIT which can do better. 

The last similarity is very striking, and let's just hope that we won't
have reasons to say something like "hopefully we can agree CVS is a
pretty bad SCM and that proves said entities don't know what
they're doing" in regard to GIT.


[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


