Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HnFo7-0008JM-20
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 May 2007 17:16:23 +0200
Received: by py-out-1112.google.com with SMTP id n39so1185681pyh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2007 08:15:25 -0700 (PDT)
Received: by 10.65.211.16 with SMTP id n16mr8549687qbq.1179069325045;
	Sun, 13 May 2007 08:15:25 -0700 (PDT)
Received: from cube ( [82.193.98.2])
	by mx.google.com with ESMTP id r9sm11903081nza.2007.05.13.08.15.23;
	Sun, 13 May 2007 08:15:24 -0700 (PDT)
Date: Sun, 13 May 2007 18:15:30 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <419056356.20070513181530@gmail.com>
To: Rolf Leggewie <no2spam@nospam.arcornews.de>
In-Reply-To: <f277j3$i00$1@sea.gmane.org>
References: <1179059149.5404.3.camel@cimmeria.hyboria>
	<f277j3$i00$1@sea.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFD: Bugzilla in general & bug triaging
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
X-List-Received-Date: Sun, 13 May 2007 15:16:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rolf,

Sunday, May 13, 2007, 5:33:06 PM, you wrote:

> Graeme Gregory wrote:
>> RFC
>> 
>> Dont add people to CC field of bugs without talking to them.

> Thank you Graeme for raising this issue.  It is something I meant to 
> discuss earlier but never found enough time to think it through and 
> write up something.  I still have not thought it through, but here it goes.

> Let me first say, that I am totally aware that we are all doing this in
> our limited free time.  We also all don't like things being stuffed down
> our throat.  There is a bit of dilemma here.

> As a non-dev, I feel one of the better ways for me and others alike is
> to make sure the BTS is in good shape.  It is called bug triaging which
> I also do in other projects.  For me, this is all about efficiency, 
> division of labor so to speak (although that capitalistic thinking might
> not go down too well with all of us freeminds ;-))  The idea is that 
> there is someone who sifts through the bug reports and makes sure they
> are understandable, complete and real.  The triager also crosslinks bugs
> that share similarities and classifies them.   All this *before they eat
> up valuable time from a real dev*.  That is at least what I am trying to
> do, for the devs to sit down and find well-structured problems to work
> on whenever they feel like it (I know the OE BTS is not there yet, bug
> 2194 is a shy start at this).

        I'm sure that I can speak from many peoples' side: your work
and effort on bug management is *much* appreciated. Thanks to you, we
now have *live* bugtracker, not a swamp, which it was just few months
ago.

> This is how Ubuntu and Mozilla approach the bugs they receive.  But it
> needs a way to signal "Hey, this bug is OK" and furthermore bugs are 
> usually assigned to the most appropriate person.  So that is what I did
> first, assign bugs to the people I thought would be most appropriate in
> dealing with them.  That did not go down so well :-)  So, it was 
> suggested to me that instead of assigning, I should cc people.  But that
> is certainly not the best solution, either.

> I believe it would be great if OE started some kind of not too rigid 
> process of triaging bugs.  All projects are a bit different, so what do
> you think would be the best way for OE to handle this?

        I guess this can be expressed as:

1. If there's a confirmed bugtracker manager, whatever he does,
already has good weight in it.
2. There're indeed well-known work flow patterns and best practices,
and those should be rather reused, not ignored.
3. There should be room for improvements and adaption to our specific
case and environment.

        In this regard, I think that current scheme, and your use of
it, is good enough to go with. In particular, I appreciate, and
recommend, that everyone who submits something important (or having
other special criteria) for the area I maintain/watch, to add myself
to cc:, to ensure prompt replies and addition guarantee that important
issues are not lost in awful amount of mail I receive, and don't
depend on not 100% reliable things like my watching bug tracker
notifications.

 >> Everyone on oe-issues list gets all bug reports anyway and I can use
 >> web search quite effectively myself.

> Graeme, I understand your concern.  I don't mean to say "Hey, here is 
> the solution" but maybe there are some options you might consider.

> First is that I would think that it might be a waste of valuable dev 
> time if all core devs read all bug reports on oe-issues.  Of course, 
> that is an individual decision.  But if we got something like bug 
> triaging going in a more instituationalized way, it might indeed become
> unnecessary.  Second, bugzilla offers many settings on what mails you 
> want to receive and which you don't at 
> http://bugs.openembedded.org/userprefs.cgi?tab=email.  If you read 
> oe-issues, you might want to consider deactivating all mail from 
> bugzilla itself to keep the load down.

        I guess this solution is straight into bull's eye - why spend
time communicating your preferences to other people (or, fingers
crossed, quarrel with them), if they instead can be communicated to
Bugzilla, which is there to serve all needs. The same goes for
everyone's best friend, an email client, which has cool things like
folders and filters, and opens their wonders to everyone who wants to
*receive* their mail the way they want, instead of arguing with the
whole world (or arbitrary part of it) how it should send mail to them ;-)


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



