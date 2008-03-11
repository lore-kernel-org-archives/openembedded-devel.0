Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZ3X9-00036O-7s
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 13:24:48 +0100
Received: by wx-out-0506.google.com with SMTP id h27so2272736wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 05:22:45 -0700 (PDT)
Received: by 10.141.87.13 with SMTP id p13mr4095600rvl.295.1205238164578;
	Tue, 11 Mar 2008 05:22:44 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id x26sm10200642ugc.61.2008.03.11.05.22.42
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 05:22:43 -0700 (PDT)
Date: Tue, 11 Mar 2008 14:23:30 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080311142330.35139ee1@widy.localdomain>
In-Reply-To: <20080311114938.GM30267@ibawizard.net>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <20080311114938.GM30267@ibawizard.net>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.82.239
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Tue, 11 Mar 2008 12:24:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 11 Mar 2008 12:49:38 +0100
Petr Stetiar <ynezz@true.cz> wrote:

> Koen Kooi <koen@dominion.kabel.utwente.nl> [2008-03-11 11:46:09]:
> 
> > CVS also has a large user base and lots of OE developers have lots
> > of experience with it.
> 
> Didn't knew, that CVS is "distributed" SCM :-)
> 
> My reason for using Git, is, that I could drop my local overlays
> maintained in SVN, and could easily use Git's branches for it. It's
> then really easy to try out and build different braches and also
> easier to send patches back to OE.

That's because you don't know hg. Scientific studies has proven it to
be 27.92% easier.

> 
> -- ynezz

[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


