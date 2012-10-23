Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1TQgD1-0004W9-I7
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 17:15:59 +0200
Received: from gandalf.denix.org ([unknown] [108.45.52.73])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCC00NP4MZB5180@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Oct 2012 09:02:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1FD7C200D7; Tue,
	23 Oct 2012 10:01:59 -0400 (EDT)
Date: Tue, 23 Oct 2012 10:01:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20121023140159.GA8716@denix.org>
References: <CAMKF1sqkMb8Z5Cda7qDXKYF1npKbJ-2yOAdWA=gNADs5UJAEew@mail.gmail.com>
	<7074844.QapBLE5b39@helios>
	<CAMKF1spmOOZXgWTSigq7PKDPYwi7j-273cwEM6ryFM0P1cHe+A@mail.gmail.com>
	<1564404.2akYnFFVx7@helios>
MIME-version: 1.0
In-reply-to: <1564404.2akYnFFVx7@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: patchwork is up again
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
X-List-Received-Date: Tue, 23 Oct 2012 15:15:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 23, 2012 at 09:59:19AM +0100, Paul Eggleton wrote:
> On Monday 22 October 2012 09:25:45 Khem Raj wrote:
> > On Sat, Oct 20, 2012 at 4:45 AM, Paul Eggleton
> > <paul.eggleton@linux.intel.com> wrote:
> > > On Friday 19 October 2012 16:37:19 Khem Raj wrote:
> > >> If you dont use patchwork dont bother but if you do then it had some
> > >> hiccups which now has been fixed hopefully. So if you dont see your
> > >> latest patch on patchwork resend it.
> > > 
> > > I just sent my hddtemp patch for the third time and it still hasn't been
> > > picked up by patchwork, so I'm afraid something is still not working
> > > properly.
> >
> > we have always had issue with large patches. I dont know exact size but
> > pw did not parse large emails well. I wonder if your patch is large enough
> > to cross the bar.
> 
> I've just posted v2 of the patch which is less than half the size, still no 
> dice though.
> 
> However, one unusual thing about this patch (and the previous version) is that 
> git send-email did prompt me for an encoding, I used the default (UTF-8); even 
> the subject line is encoded. Maybe patchwork doesn't understand UTF-8 - could 
> that be the reason it's not being picked up?

Well, if your patch got uuencoded or base64-encoded, I'd say patchwork might 
choke on it...

-- 
Denys


