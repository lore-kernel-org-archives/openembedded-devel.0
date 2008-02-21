Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JS97G-00031n-0m
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 11:57:28 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JS973-0001eV-R3
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 10:57:13 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 10:57:13 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 10:57:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 21 Feb 2008 11:57:06 +0100
Message-ID: <fpjle1$p10$1@ger.gmane.org>
References: <E1JRbhB-0000nu-DN@linuxtogo.org>	<20080220015817.1e33f547@widy.localdomain>	<20080220020418.1e4dda5a@widy.localdomain>	<1203502545.6860.13.camel@hammer.suse.cz>	<20080220155339.67aed5d4@widy.localdomain>	<fphs3l$jcj$1@ger.gmane.org>
	<20080220212639.6e24e7ab@widy.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <20080220212639.6e24e7ab@widy.localdomain>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: what is a fixed bug?
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
X-List-Received-Date: Thu, 21 Feb 2008 10:57:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Junqian Gordon Xu wrote:
> I prefer this approach to opening a separate dup ticket.

This will and has led to problems in that some A* dev has in the past
repeatedly closed valid bugs as invalid because his interpration was
"not an A* RC bug".  The bug of course was a perfectly valid one, if not
for A* (they are free to choose) it was for OE.

Furthermore, I don't see why my already long list of open bugs shall be
made any longer (I have a search function defined in bugzilla) without
merit.  Essentially, Angstrom is demanding that only they can close bugs
because how is anyone to know whether A* intends to push a fix into
stable?  This aggressive behaviour of Angstrom is essentially what I
mean by "usurpation of bugs.oe.net".  Why should the folks interested in
OE-derived SharpROM not be afforded that luxury of "don't you dare to
close bugs unless you have the OK from us"?

I am sorry, but I have to maintain that Distro bugs/tasks and OE
bugs/tasks are different animals and while our tools are not ideal to
reflect this, we need to properly represent that.  The only way I see to
do that is to have two tickets which is right, it is two issues.  The
chain is "fix it in dev" and then Angstrom or any other distro not made
from .dev can decide whether they want to propagate the fix.

Cloning a ticket and titling it with "push bug #123 into A* stable" is 5
seconds work at most, link back to original bug automatically included.
 Too much?

Paul wrote:
> that's simply how it is, and let's not go thru that again.

My impression was that we had already established that bugs.oe.net was
not Angstrom property.  Does not look like your interpretation.

I think A* should fully embrace the proposed clone-solution because
AFAICS it is the only proper one for them to have a list of tickets open
for  A* 2007 vs. A* 2008.  The solution serves their interest.



