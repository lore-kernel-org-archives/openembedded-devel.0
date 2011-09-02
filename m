Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qzaj8-000319-0Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 22:52:38 +0200
Received: (qmail invoked by alias); 02 Sep 2011 20:47:40 -0000
Received: from p5B0A2324.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.35.36]
	by mail.gmx.net (mp025) with SMTP; 02 Sep 2011 22:47:40 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+wlIA7u16wMOHaiTQFvDICsSle03yjz5uMjeN7Ce
	1Lqk7brSaPomUw
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 2 Sep 2011 22:51:00 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1314962732.3526.32.camel@mattotaupa>
	<1314982816.5939.616.camel@rex>
	<1314994704.3526.60.camel@mattotaupa>
In-Reply-To: <1314994704.3526.60.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201109022251.01001.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [OE-core] Please merge lists openembedded-devel and openembedded-core again.
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
X-List-Received-Date: Fri, 02 Sep 2011 20:52:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit

On Friday, September 02, 2011 10:18:23 PM Paul Menzel wrote:
> Am Freitag, den 02.09.2011, 18:00 +0100 schrieb Richard Purdie:
> > On Fri, 2011-09-02 at 17:21 +0200, Paul Menzel wrote:
> > > Am Freitag, den 02.09.2011, 14:19 +0100 schrieb Richard Purdie:
> > > > On Fri, 2011-09-02 at 10:05 -0300, Otavio Salvador wrote:
> > > > > On Fri, Sep 2, 2011 at 08:25, Paul Menzel wrote:
> > > > > > it would be great if we could join the lists oe-devel and oe-core
> > > > > > again. As far as I know the only reason the list oe-core was
> > > > > > created was to discuss the initial setup and the creation of
> > > > > > oe-core. Now that it has been setup I do not see any reason to
> > > > > > have two separate lists.
> > > > > > 
> > > > > > I suggest to abandon/archive openembedded-core and use
> > > > > > openembedded-devel.
> > > > > 
> > > > > I fully support this merge.
> > > > 
> > > > I'm not so sure rushing into this is a great idea.
> > > 
> > > I interpret your answer that the merge is planned. What is the right
> > > time then?
> > 
> > Not planned, it has been talked about, particularly by the TSC members.
> 
> Well, and what is the current position of the TSC members?
> 
> > > > Speaking as someone who has problems trying to figure out where
> > > > patches are intended for
> > > 
> > > Also now you have to decide to what list to send them to. Now you just
> > > add a prefix/tag as is done on oe-devel already to differentiate
> > > between oe.dev and meta-oe.
> > 
> > Well, its relatively simple to decide if an email is appropriate for
> > oe-core or not.
> 
> I was just talking about patches and those can easily be prefixed.
> 
> > Sure we could start asking people to use tags/prefixes but I fail to see
> > the advantage of putting more email in one place when a reasonable and
> > logical separate exists which actively helps people.
> > 
> > > > and who tracks whether they've been applied,
> > > 
> > > Well, the list is not a patch tracker. The patch queue is [1].
> > 
> > For various reasons its not how I track patches for OE-Core.
> 
> It is kind of hard for me to understand your point of view, when your
> answers are that short. How do you track patches? Somebody sends it to
> the list and you review and apply or pull it when it is good enough.
> What would change when the lists merge?
> 
> > > > I do find the split useful...
> > > 
> > > Hmm, could you please elaborate?
> > 
> > We all try to find ways to make our workflows more efficient and to do
> > the best job we can at the things we attempt. The mailing list
> > separation actively helps me notice the most important things I need to
> > deal with.
> 
> How do you notice it now? Just skimming the subject line I guess?
> 
> > Now yes, I could use mail filters, I could do a variety of
> > things. Even with those I believe my response to various things would be
> > adversely impacted if we do merge the lists as with the best will in the
> > world, people sometimes don't do things like tags/prefixes/whatever and
> > its easier for anyone new to OE to get confused.
> 
> In my opinion reading oe-devel and being on IRC anyone gets confused
> right now because of all the different layers and so on. It would be a
> lot easier for beginners if there was just one list.
> 
> And looking at the overview for lists in our Wiki [1], oe-devel is the
> list for general discussions.
> 
> Skimming through the archive of oe-core [2][3] I have the impression
> that mostly developers are sending patches to the list and that user
> questions are more presented to oe-devel. Therefore in my opinion you
> folks would benefit from merge too by seeing what the users actually
> desire or what problems they hit.
> 
> As a wrote earlier already, I have the *impression* that you lost a lot
> of former OE developers during the transition and all these different
> places where discussions are going on is in my opinion one reason for
> this.
Maybe more (new) developers are afraid of effort causing style-guide-crusaders 
not willing to subscribe more than one mailing list...
> 
> I hope on Monday more folks will voice their opinion to get a better
> expression.
> 
> 
> Thanks,
> 
> Paul
> 
> 
> [1] http://openembedded.org/index.php/Mailing_lists
> [2]
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/thre
> ad.html [3]
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/thread.
> html


