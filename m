Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1Ob9er-00014o-Gp
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 12:03:28 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1Ob9eX-0002pZ-Ae for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 06:02:21 -0400
Date: Tue, 20 Jul 2010 06:01:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C45619F.1060201@2net.co.uk>
Message-ID: <alpine.DEB.2.00.1007200556270.8124@lynx>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local>
	<4C45619F.1060201@2net.co.uk>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Tue, 20 Jul 2010 10:04:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 20 Jul 2010, Chris Simmonds wrote:

> On 20/07/10 08:01, Stefan Schmidt wrote:
> > Hello.
> >
> > On Fri, 2010-07-09 at 22:40, Stefan Schmidt wrote:
> > >
> > > I want to gather some feedback what people are feeling about a new stable
> > > branch. It feels like the right time to do it soon. We have so many big
> > > changes
> > > in that are not likely to get into stable/2009 like:
> >
> > > From the silence on this topic I gather that the interest to create a new
> > > branch
> > or change the process is quite low.
> >
>
> I would like to vote for a 2010 stable branch. There is a lot of
> good stuff in the dev branch that I would like to use in live
> projects.

  i second that, with the proviso that the primary focus for that
new stable branch be on resolving any unbuildable packages for major
distros.  as i've whined about before, there always seems to be a
package or two from the dev branch that doesn't build on my standard
64-bit ubuntu system (last time i checked, it was abiword).  i just
did a git pull on the dev branch and am checking again to see what
fails.

  not to belabour the point, but if a new branch is created and tagged
as "stable," it should build for anyone using any of the common
distros.

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Top-notch, inexpensive online Linux/OSS/kernel courses
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


