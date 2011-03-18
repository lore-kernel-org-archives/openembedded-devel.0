Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0WgK-0000qg-Jw
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 11:13:20 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0Wef-0003IJ-Le
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 11:11:37 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
References: <20110311081950.GG7353@excalibur.local>
	<1300385432.2298.33.camel@saphir> <1300396447.30423.2113.camel@rex>
	<AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
Date: Fri, 18 Mar 2011 10:15:29 +0000
Message-ID: <1300443329.9054.53.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Fri, 18 Mar 2011 10:13:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-18 at 08:57 +0100, Frans Meulenbroeks wrote:
> 2011/3/17 Richard Purdie <richard.purdie@linuxfoundation.org>:
> > On Thu, 2011-03-17 at 19:10 +0100, Michael 'Mickey' Lauer wrote:
> >> I'm in favor of keeping it, cleaning it up, and improve
> >> the integration with patchwork / git. Throwing it away
> >> would be a very bad sign to all those countless people
> >> who've gone through the pains of actually working with
> >> the bugtracker.
> >
> > The simple question is who is actually going to sort out the mess its
> > in?
> >
> > Who is going to look after it on a continuing basis?
> >
> > If there isn't ownership, nothing is going to change.
> 
> Actually I feel the real problem is that:
> - people did not want to get bugs assigned to them (at least that was
> what someone told me in the past)
> - we're lacking a good notion of package or recipe ownership, so even
> if we had someone acting as a bug manager, (s)he would have a hard
> time to find out who to assign an issue to.

Yes, agreed.  A few people have tried in the past to take responsibility
for bugzilla itself (in infrastructure terms) and I would be happy
enough to do that for the future.  But it clearly is not reasonable to
expect the Bugzilla maintainer(s) to be personally responsible for
fixing every bug that gets reported.  Unless other developers are
cooperative, this leads inevitably to the current situation of issues
languishing in bugzilla forever.

As you say, the real issue here seems to be that someone (presumably the
TSC) needs to determine the workflow that OE is going to use and then
convince the developers to stick to it.  Bugzilla works most effectively
if everything goes through it, which means you can use the bug list as a
kind of dashboard showing the issues which need attention each day, and
if everybody uses it (and hence is diligent about closing bugs once they
are actually fixed).  To that extent its role overlaps somewhat with
patchwork and, personally, I would be quite happy to see bugzilla
replace patchwork for email submissions.  But clearly others have a
different view on that and, again, it is probably going to be down to
the TSC to decide what tools are right for OE.

p.




