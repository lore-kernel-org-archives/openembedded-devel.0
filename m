Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jin@mediatomb.cc>) id 1Jut4F-0001AJ-B5
	for openembedded-devel@openembedded.org; Sat, 10 May 2008 19:41:08 +0200
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id 8F98E83755; Sat, 10 May 2008 19:40:05 +0200 (CEST)
Date: Sat, 10 May 2008 19:40:05 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080510174005.GA28630@deadlock.dhs.org>
References: <g049dg$2ks$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <g049dg$2ks$1@ger.gmane.org>
User-Agent: Mutt/1.5.15 (2007-04-06)
Cc: openembedded-devel@openembedded.org
Subject: Re: RFC: reverse the name change for org.oe.stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 10 May 2008 17:41:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sat, May 10, 2008 at 03:53:52PM +0200, Rolf Leggewie wrote:
> I am concerned about the loss of reputation that OE is incurring because
> the .stable guys are willfully ignoring the official bug tracker.  I
> think it should be renamed back to angstrom$whateveritwasbefore.  We
> can't seriously be telling guys all the time "report your problems to
> the BTS" and then have the "official" stable branch completely and
> willfully ignore it.  I'd go as far as requesting it should be denied
> the org.openembedded.* namespace in monotone.
> 
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/18400/focus=18462
>

I've been following the threads on oe.stable and this leads to some questions:

what is the "official" definition of the oe.stable branch?

at first I had the impression that it is intended for product development
(hence - stable), is this the case or was this a misconception?

is there any point in submitting bugs to BTS vs. oe.stable (i.e. can at least
some help regarding those bugs be expected)?

is the stable branch actively maintained (well, the answer to this probably
results from the anwer to the previous question)?


Please don't get me wrong, it is not my intention to get in the middle of the
discussion about reversing names or whatever. I use OE for product development
and I ultimately need to know what branch I should base my work on.

It would also be nice if the status of the branches gets clearly communicated
once this discussion is over. I think it's important that people who do 
product dev know where to start and what to expect.

Again, just to make it clear: my argument is not about usage of 
BTS/maintenance/naming/etc., it's about a clear communication on the status
of things, so that people know what branch to choose.

Kind regards,
Jin



