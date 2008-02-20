Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JRy3l-0001Fk-Ir
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2008 00:09:13 +0100
Received: by an-out-0708.google.com with SMTP id b33so635050ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2008 15:09:04 -0800 (PST)
Received: by 10.100.138.4 with SMTP id l4mr17841380and.110.1203535494248;
	Wed, 20 Feb 2008 11:24:54 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id c4sm111997nfi.4.2008.02.20.11.24.52
	(version=SSLv3 cipher=OTHER); Wed, 20 Feb 2008 11:24:52 -0800 (PST)
Date: Wed, 20 Feb 2008 21:26:39 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080220212639.6e24e7ab@widy.localdomain>
In-Reply-To: <fphs3l$jcj$1@ger.gmane.org>
References: <E1JRbhB-0000nu-DN@linuxtogo.org>
	<20080220015817.1e33f547@widy.localdomain>
	<20080220020418.1e4dda5a@widy.localdomain>
	<1203502545.6860.13.camel@hammer.suse.cz>
	<20080220155339.67aed5d4@widy.localdomain>
	<fphs3l$jcj$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.132.242
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: no2spam@nospam.arcornews.de
Subject: Re: what is a fixed bug? (was: [oe-commits] org.oe.dev - Ignore false toggle signals (work-around for OE#3390).)
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
X-List-Received-Date: Wed, 20 Feb 2008 23:09:13 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 20 Feb 2008 19:38:40 +0100
Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:

> Paul Sokolovsky wrote:
> > feeds. So, if bug is fixed in source, but corresponding package
> > hasn't made to feeds, then per above idea (hopefully pretty obvious
> > and no-nonsense), the bug should not be closed.
> 
> I disagree (see mail about Angstrom usurping bugs.oe.org).
> 
> I have yet to come up with a complete plan how things should work (one
> idea fell apart because a partner had to retract their offer).  But
> let's discuss this piece since it came up: when to consider a normal
> bug closed.
> 
> The above are really two or more issues.
> 
> a) fix the problem itself
> b) propagate the fix to A*
> c) propagate the fix to PS Distro
> 
> IMO, any bug fixed in .dev ought to be closed.  If it needs to be
> backported or released to A*, then a separate ticket should be opened
> (one issue, one bug, remember!).  

When you'll find someone who will dup tickets in such way (with the
rest of associated management!), invite them to join this discussion,
until then, that's simply how it is, and let's not go thru that again.

> The cloning function from bugzilla
> can easily be used for that.
> 
> We just face the problem that - unlike launchpad - bugzilla is
> incapable of tracking the status according to project for the same
> issue (open for ubuntu, closed in debian for example)

[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


