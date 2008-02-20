Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JRm0H-0001vt-9F
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2008 11:16:46 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 7F59E628091;
	Wed, 20 Feb 2008 11:15:46 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080220020418.1e4dda5a@widy.localdomain>
References: <E1JRbhB-0000nu-DN@linuxtogo.org>
	<20080220015817.1e33f547@widy.localdomain>
	<20080220020418.1e4dda5a@widy.localdomain>
Date: Wed, 20 Feb 2008 11:15:45 +0100
Message-Id: <1203502545.6860.13.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-SA-Exim-Connect-IP: 82.119.242.94
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev - Ignore false toggle signals	(work-around for OE#3390).
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
X-List-Received-Date: Wed, 20 Feb 2008 10:16:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:

> > On Wed, 20 Feb 2008 00:16:17 +0100
> > "utx commit" <openembedded-commits@lists.openembedded.org> wrote:
> > 
> > > - Ignore false toggle signals (work-around for OE#3390).
> > > - Fixed default ALSA state for SL-Cxx00 (OE#2617).
> > > - Do not alter incorrect mixer levels by zaurus-mixer-callback.
> > > - Allow to disable rotation by touch ~/.norot.
> > > - Fixed detection of panel_user.
> > > 
> > > Author: utx@openembedded.org
> > 
> > Stanislav, congratulations on getting commit access to OE! There're
> > few guidelines for developers at
> > http://www.openembedded.org/wiki/Policies . In particular, adhering to
> > http://www.openembedded.org/wiki/CommitPolicy allows for easy peer
> > review and per-package commit search.

I seen bad formatting in http://monotone.openembedded.org/ and gathered
bad format of the message. Further messages will be correct (I hope).

My current fixes were done long time ago and ported several times, so I
no more had one patch per particular change. All future changes will
follow the rule "each change as separate changeset".

Note that the policy is missing "Closing bugs policy". Bug was reported
against Angstrom, now it is fixed in OE.dev. Should the bug be closed
now, or after backporting the fix to stable Angstrom?

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



