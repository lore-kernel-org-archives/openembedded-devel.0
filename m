Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Pkm5Q-0003jO-6e
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 00:26:08 +0100
Received: (qmail invoked by alias); 02 Feb 2011 23:25:11 -0000
Received: from p5DE485FA.dip.t-dialin.net (EHLO localhost.localdomain)
	[93.228.133.250]
	by mail.gmx.net (mp020) with SMTP; 03 Feb 2011 00:25:11 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+BxlJG4vaBRj9eGZhueNltQKZtwY5dZ1qFZw8Qpm
	6FSpkRmdGU6v/l
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Feb 2011 00:21:50 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <201102012002.49849.schnitzeltony@gmx.de>
	<4D496DBC.6030709@opendreambox.org>
	<1F887C9B-2BD1-436C-8B7B-4162CA51857C@dominion.thruhere.net>
In-Reply-To: <1F887C9B-2BD1-436C-8B7B-4162CA51857C@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201102030021.50431.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: latest clutter-recipe
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
X-List-Received-Date: Wed, 02 Feb 2011 23:26:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 02 February 2011 15:57:33 Koen Kooi wrote:
> I checked patchwork first and that didn't show any clutter patches. I'll add the gtk and gst ones after fosdem
> 
> Op 2 feb. 2011 om 15:44 heeft Andreas Oberritter <obi@opendreambox.org> het volgende geschreven:
> 
> > Hello Andreas,
> > 
> > I can't answer your technical questions regarding the recipe, because
> > I'm not using a clutter/gtk/x11 based distro. I'd like to comment the
> > rest of your mail, though.
> > 
> > On 02/01/2011 08:02 PM, Andreas Mueller wrote:
> >> it surprised me to see that Koen committed a new recipe for clutter 1.4.2. As you might know I was also working on this and sent some pre-release version here of this (1). What makes me not running in happy mode:
> >> 
> >> - Many of my previous patches were rejected first because of some commit message. Here we read 'clutter: add 1.4.2' - cool. Which tests were performed?
> > 
> > In general, contrary to patches which modify existing files, I think
> > that patches adding new recipes don't need a detailed commit message.
> > Still, a message should describe the content of a commit in a suitable
> > and understandable way. In my opinion, "<name>: add <version>"
> > sufficiently describes any new recipe, unless there's anything special
> > about it.
> > 
> > In this case, I would have preferred glib-gettextize getting mentioned,
> > which was added to clutter.inc.
> > 
> >> Please don't tell me I am invited to change this situation:  Many patches send by non-commit guys are nit-picked at least for commit message - and then I read 'clutter: add 1.4.2' for a recipe breaking lots of others.
> > 
> > Well, shit happens, unfortunately. Hopefully it was tested and worked in
> > a different environment. Bug reports like this are needed to make it
> > work for as many environments as possible. I've added Koen to CC to
> > decrease the chance that your bug report gets lost without Koen
> > noticing. I think he didn't mean to offend you in any way with his commit.
> > 
> > Nit-picking happens frequently, and personally I prefer getting negative
> > feedback over no feedback at all. Usually it's not very hard to address
> > the complaints, although it can be very frustrating to get only a short
> > comment on something you've put a lot of time into. My guess is that
> > this has occurred at least once to everybody who contributed to open
> > source projects.
> > 
> >> Sorry for this, but to me the this should have been a hobby for having fun - but at the moment it's far from
> > 
> > So let's try to regain some fun after this problem gets solved! You
> > shouldn't take it personally.
I am afraid exactly this was my problem :-(
> > 
> >> Andreas
> >> 
> >> (1) http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/029260.html
> > 
> > Regards,
> > Andreas
> > 
> 
1. Thanks for response
2. I saw nights of efforts for good. This caused a short circuit  - sorry 
3. let's forget and have fun again :-))
4. I will send a patch for clutter-gst. 
5. clutter-gtk seems tricky...

Andreas


