Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZ6kN-0005G2-3V
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 16:50:44 +0100
Received: by fg-out-1718.google.com with SMTP id 13so1869284fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 08:48:37 -0700 (PDT)
Received: by 10.86.97.7 with SMTP id u7mr1713766fgb.54.1205250517057;
	Tue, 11 Mar 2008 08:48:37 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id d4sm9946517fga.2.2008.03.11.08.48.34
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 08:48:35 -0700 (PDT)
Date: Tue, 11 Mar 2008 17:49:23 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080311174923.22f93709@widy.localdomain>
In-Reply-To: <47D687F5.90604@kernelconcepts.de>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <20080311114938.GM30267@ibawizard.net>
	<20080311142330.35139ee1@widy.localdomain>
	<47D687F5.90604@kernelconcepts.de>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 11 Mar 2008 15:51:07 -0000
X-List-Received-Date: Tue, 11 Mar 2008 15:51:07 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 11 Mar 2008 14:24:05 +0100
Florian Boor <florian.boor@kernelconcepts.de> wrote:

> Hi,
> 
> Paul Sokolovsky schrieb:
> > 
> > That's because you don't know hg. Scientific studies has proven it
> > to be 27.92% easier.
> 
> I'm tempted to agree blindly ;) Where did you find this?

Ummm, I seem to lost the links! But I swear I heard that on TV! Also,
grandma in the nearby shop tells the same! ;-)

> *If* the user interaction of hg is much better than git then this
> would be a reason to prefer hg.

I assess that by: can I move away from using a tool for some time, then
come back and continue it using without learning it again. There're some
core commands which work almost the same in cvs/svn/mtn/hg. Git is
the most diverging from them. 

So, I used when played with Familiar's fork repo, and a bit with
kernel, but what I remember about it is that it has some weird
pre-commit buffer (they call it "index"), have many quirky switches,
you may spent time figuring out how to revert local changes, and at the
same time, lose your local changes without you wanting that, etc., etc.


> 
> Greetings
> 
> Florian

[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


