Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8TG9-0002HR-NU
	for openembedded-devel@openembedded.org; Thu, 12 Nov 2009 07:34:24 +0100
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N645m-0003y2-TR
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 10:17:43 -0500
Date: Thu, 5 Nov 2009 10:17:17 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AF2EAF3.5020808@cs.put.poznan.pl>
Message-ID: <alpine.LFD.2.00.0911051014270.7161@localhost>
References: <1257427464-316-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
	<20091105140617.GA27537@mi.fu-berlin.de>
	<4AF2EAF3.5020808@cs.put.poznan.pl>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] boost-1.33.1: Corrected GNU_HASH error.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2009 06:34:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 5 Nov 2009, Przemyslaw Wesolek wrote:

> Henning Heinold wrote:
> > thanks for the patch, but I wonder who is using this older
> > version. Mainly 1.3.36 is used.
>
> Did you mean 1.36?
>
> I agree, the older versions look like unmaintained for a long time.

  if you go to boost's home page, they don't even *list* versions
earlier than 1.36:

  http://www.boost.org/users/news/

that's generally a good indication that it's time to start
deprecating.  and there's already a beta version of 1.41.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


