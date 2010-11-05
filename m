Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PEPcF-0005n9-Pc
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 17:58:16 +0100
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LBF00C488FC4ET7@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	05 Nov 2010 11:57:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BEFAA14AF6A; Fri,
	05 Nov 2010 12:57:11 -0400 (EDT)
Date: Fri, 05 Nov 2010 12:57:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101105165711.GC6115@denix.org>
References: <AANLkTin8J-vi624U2Z4Emr=Zajq0+CsSnFR=a8+kjuOv@mail.gmail.com>
	<20101105010014.GA6115@denix.org>
	<20101105073448.GD3702@excalibur.local>
MIME-version: 1.0
In-reply-to: <20101105073448.GD3702@excalibur.local>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Moving to layered structure of openembedded metadata
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
X-List-Received-Date: Fri, 05 Nov 2010 16:58:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Nov 05, 2010 at 08:34:48AM +0100, Stefan Schmidt wrote:
> Hello.
> 
> On Thu, 2010-11-04 at 21:00, Denys Dmytriyenko wrote:
> > 
> > That is already being discussed and decided. See the following previous topics 
> > on the mailing list...
> 
> To clear this up a bit. There can't be a real decision for now. Not all
> developers have been present at the OEDEM and we haven't discussed  every detail
> their either. :)
> 
> Most, if not all, people liked the idea during the OEDEM discussions, but we
> would need more input on problem that this may rise. As it stands I'm happy to
> see Khem coming up to put this on the ml. :)
> 
> One I currently see is how we can keep it all working when the layers are
> maintained in different places and what kid of combinational explosion we will
> have with layers in different places.

That is exactly what I said - being discussed and (being) decided. I didn't 
say it was or has been already decided. "Being" is not the same as "been"! :) 
I.e. present continuous instead of past tense.

And BTW, it may not be a simple decision after all - while technically Yocto 
seems quite a decent project and embracing it would be reasonable, many large 
companies are still having issues with it's governance model and past issues 
with Intel's other seemingly "open source" projects... The good news is that 
this side of the problem is now being actively looked at for any possible 
solutions, which would benefit all involved...

-- 
Denys


