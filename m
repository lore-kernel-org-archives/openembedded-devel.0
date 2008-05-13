Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jvqy4-000388-0G
	for openembedded-devel@openembedded.org; Tue, 13 May 2008 11:38:44 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jvqwj-0005Cr-Bh
	for openembedded-devel@openembedded.org; Tue, 13 May 2008 09:37:21 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 13 May 2008 09:37:21 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 13 May 2008 09:37:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 13 May 2008 11:37:05 +0200
Message-ID: <g0bng7$mtg$1@ger.gmane.org>
References: <g049dg$2ks$1@ger.gmane.org> <4826A3B9.3050103@balister.org>
	<1210577770.4981.13.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <1210577770.4981.13.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Tue, 13 May 2008 09:38:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> We do need a stable branch.

I guess so.  And I don't question that.  I just raise the flag that if
nobody is indeed interested in actually fixing bugs, we should
reconsider having it.  Right now, we have a snapshot with virtually no
activity, not a stable, actively maintained branch.  IMNSHO, OE should
be honest or it will loose credibility.  If we can't support a stable
branch (because supposedly people are too busy), we should not be
suggesting we do.  The openembedded-stable ml and the bug tracker,
together with the many people here who say "We should have a stable
branch, *but* right now I can't work on it" tell a clear story.

> The stable branch people have commented on the use of the bugzilla and I
> can't really see a problem there. 

They say they want mail, fine.

The problem is that they both block mail from bugzilla to the oe-stbale
list (and I am not going to play human gateway) and ignoring it in the
case of koen (who I added specifically as cc for bp flags raised).  I
don't think I should even be doing this.  If people are supporting
stable as the claim stands, there should be at least some activity in
the bug tracker wrt fixing bugs.

* several weeks if not months of no bug triaging from .stable
  causes concern
* no activity after some bug triaging is done for them
  causes real concern
* still no activity after blocking their meta bugs about a month ago
  causes serious concern
* still no activity after sending several reminder mails to the ml
  causes grave concern
* a "do as you please"-attitude after issuing a last warning and still
  no activity after providing them the patches the stable guys should
  have derived themselves if claims of support are to be taken serious

  this falls back on OE

BTW, still no bug triaging and not even the simple activity of looking
through the bugs that have been meticulously prepared.

> technical rather than emotive and discuss the problems before proposing
> inflammatory solutions.

I am absolutely technical.  The choice is simple

a) support it, including at least some work in the bug tracker
b) rename it
c) risk loss of reputation for OE as not living up to claims made

It is one of the three and really that easy.  Unfortunately, it looks
like everybody choosing c) because "we want stable".



