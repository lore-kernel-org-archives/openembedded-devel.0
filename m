Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JSBBP-0006Rh-AW
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2008 14:10:27 +0100
Received: by fk-out-0910.google.com with SMTP id 18so32338fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2008 05:09:47 -0800 (PST)
Received: by 10.78.180.16 with SMTP id c16mr15643619huf.35.1203599386931;
	Thu, 21 Feb 2008 05:09:46 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id d24sm10669nfh.29.2008.02.21.05.09.43
	(version=SSLv3 cipher=OTHER); Thu, 21 Feb 2008 05:09:45 -0800 (PST)
Date: Thu, 21 Feb 2008 15:11:26 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080221151126.243a718f@widy.localdomain>
In-Reply-To: <fpjrg3$ef9$1@ger.gmane.org>
References: <E1JRbhB-0000nu-DN@linuxtogo.org>
	<20080220015817.1e33f547@widy.localdomain>
	<20080220020418.1e4dda5a@widy.localdomain>
	<1203502545.6860.13.camel@hammer.suse.cz>
	<20080220155339.67aed5d4@widy.localdomain>
	<fphs3l$jcj$1@ger.gmane.org>
	<20080220212639.6e24e7ab@widy.localdomain>
	<fpjle1$p10$1@ger.gmane.org>
	<20080221140439.2612fffe@widy.localdomain>
	<fpjrg3$ef9$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.184
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: no2spam@nospam.arcornews.de
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
X-List-Received-Date: Thu, 21 Feb 2008 13:10:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 21 Feb 2008 13:40:35 +0100
Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:

> Paul,
> 
> let's make your long story short.
> 
> Essentially, the question amounts to whether I (and everybody else)
> need to consult with A* people first before closing a bug that is
> fixed in .dev from now on?  Once we have established that, we can
> either outright forget about my proposal, accept it or try and find
> something better.

Rolf, my answers to your mails are in the following vien: 1) to
describe why it is now like it is; 2) to express my opinion why it
cannot change immediately to something else.

Otherwise, I'm all for the changes you propose - if they will work.
That depends not on you, not on me, and even not on coredevs, but on
each and every developer to follow it. As we now have situation that
bugs are not processed, and fixed bugs are not closed for long time, I
don't think that setting a process with more legwork to perform will
improve *real* situation any better.

As for consulting A* devs, each bug has list of other bug it blocks.
I'm trying to keep A* release bug hierarchy shallow and simple (hence
the tree'iness preference I expressed). Bugzilla also shows tooltip
when hovering an pausing cursor on a bug in Blocks/Depends on lists.
Summing up, it's pretty easy to see that a bug is included in
A*-stable release set, and thus takes special care to close. And
Angstrom is not just some niche thing, we all know about it, so taking
care that that fix went to stable user is in each of us best interests,
I would guess.

> 
> My interpretation:
> * I believe we have already heard the result of that vote previously,
>   but it seems you did not get the message, so I guess the question
>   needs to be answered again.  RP?
> * I already mentioned that IMHO A* should heartily embrace the
> changes I proposed because of the benefits it brings to them, but A*
> is free to reject my ideas.  But IMNSHO it cannot and should not
> force their rejection on others who use OE as a basis IMNSHO.
> 
> Regards
> 
> Rolf
> 
> 
> PS: I'd also like you to finally stop your (unfounded) accusations
> against my person.

Please take it easy, those are not accusations, and I apologize if they
sounded so to you, and I myself hope too that we'll keep to core
technical and organizational matters.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


