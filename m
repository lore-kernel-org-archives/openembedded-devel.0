Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZ4AF-0004Cw-TG
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 14:05:12 +0100
Received: by nf-out-0910.google.com with SMTP id c7so930032nfi.20
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 06:03:10 -0700 (PDT)
Received: by 10.78.148.8 with SMTP id v8mr17729342hud.31.1205240589776;
	Tue, 11 Mar 2008 06:03:09 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id i5sm35012293mue.7.2008.03.11.06.03.03
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 06:03:05 -0700 (PDT)
Date: Tue, 11 Mar 2008 15:03:20 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080311150320.7c31b2f6@widy.localdomain>
In-Reply-To: <1205239153.4521.53.camel@dax.rpnet.com>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
	<1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
	<1205239153.4521.53.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.182.190
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Tue, 11 Mar 2008 13:05:12 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 11 Mar 2008 12:39:13 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Tue, 2008-03-11 at 14:30 +0200, Paul Sokolovsky wrote:
> > Yeah, I'd say, *every* git user hit your problem before - that
> > git is inconsistent, poorly implemented set of hacks. And if they
> > grow to love it, why that can't happen to yourself, right?
> 
> You will never have seen me argue git has a nice UI. I've said quite
> the opposite on many occasions. I have said its powerful but thats
> different.

It's nice to have that said explicit - different. Supposedly it's more
powerful for developers, but how good it is for end users? How many
industry entities select git as their in-house SCM? I doubt that too
many, knowing too well that many still select just CVS.

> 
> > > There is also an advantage if someone doesn't have to know yet
> > > another SCM to check out OE. I don't have hg installed, I do have
> > > git and if we conducted a poll of other OE devs/users I think
> > > we'd see a pattern. 
> > 
> > I probably dumb, but that pattern would be CVS? SVN? no? Nevermind,
> > of course.
> 
> I'm assuming we're considering distributed scms but you know this ;-)

Yes, I'm trying to hint that arguments like having something already
installed, or some niche, but big project already using it, are not
necessarily valid for the topic of selecting SCM for OE.

I'd really like someone who lead this idea to actually try few
"advanced" usecases with both git and hg. But if that's not going to
happen, at least let's not pretend that git is going to be "better"
than hg or even mtn. It will be just different, possibly, bringing more
issues overall.

> 
> Cheers,
> 
> Richard

[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


