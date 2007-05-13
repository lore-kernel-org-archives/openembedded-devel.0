Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HnF9V-0001XO-PN
	for openembedded-devel@openembedded.org; Sun, 13 May 2007 16:34:26 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HnF8R-0000BZ-1A
	for openembedded-devel@openembedded.org; Sun, 13 May 2007 16:33:19 +0200
Received: from p54b95c14.dip.t-dialin.net ([84.185.92.20])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 13 May 2007 16:33:19 +0200
Received: from no2spam by p54b95c14.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 13 May 2007 16:33:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 13 May 2007 16:33:06 +0200
Message-ID: <f277j3$i00$1@sea.gmane.org>
References: <1179059149.5404.3.camel@cimmeria.hyboria>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: p54b95c14.dip.t-dialin.net
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
In-Reply-To: <1179059149.5404.3.camel@cimmeria.hyboria>
Sender: news <news@sea.gmane.org>
Subject: RFD: Bugzilla in general & bug triaging
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
X-List-Received-Date: Sun, 13 May 2007 14:34:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> RFC
> 
> Dont add people to CC field of bugs without talking to them.

Thank you Graeme for raising this issue.  It is something I meant to 
discuss earlier but never found enough time to think it through and 
write up something.  I still have not thought it through, but here it goes.

Let me first say, that I am totally aware that we are all doing this in 
our limited free time.  We also all don't like things being stuffed down 
our throat.  There is a bit of dilemma here.

As a non-dev, I feel one of the better ways for me and others alike is 
to make sure the BTS is in good shape.  It is called bug triaging which 
I also do in other projects.  For me, this is all about efficiency, 
division of labor so to speak (although that capitalistic thinking might 
not go down too well with all of us freeminds ;-))  The idea is that 
there is someone who sifts through the bug reports and makes sure they 
are understandable, complete and real.  The triager also crosslinks bugs 
that share similarities and classifies them.   All this *before they eat 
up valuable time from a real dev*.  That is at least what I am trying to 
do, for the devs to sit down and find well-structured problems to work 
on whenever they feel like it (I know the OE BTS is not there yet, bug 
2194 is a shy start at this).

This is how Ubuntu and Mozilla approach the bugs they receive.  But it 
needs a way to signal "Hey, this bug is OK" and furthermore bugs are 
usually assigned to the most appropriate person.  So that is what I did 
first, assign bugs to the people I thought would be most appropriate in 
dealing with them.  That did not go down so well :-)  So, it was 
suggested to me that instead of assigning, I should cc people.  But that 
is certainly not the best solution, either.

I believe it would be great if OE started some kind of not too rigid 
process of triaging bugs.  All projects are a bit different, so what do 
you think would be the best way for OE to handle this?

 > Everyone on oe-issues list gets all bug reports anyway and I can use
 > web search quite effectively myself.

Graeme, I understand your concern.  I don't mean to say "Hey, here is 
the solution" but maybe there are some options you might consider.

First is that I would think that it might be a waste of valuable dev 
time if all core devs read all bug reports on oe-issues.  Of course, 
that is an individual decision.  But if we got something like bug 
triaging going in a more instituationalized way, it might indeed become 
unnecessary.  Second, bugzilla offers many settings on what mails you 
want to receive and which you don't at 
http://bugs.openembedded.org/userprefs.cgi?tab=email.  If you read 
oe-issues, you might want to consider deactivating all mail from 
bugzilla itself to keep the load down.



