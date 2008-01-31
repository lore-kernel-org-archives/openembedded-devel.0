Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JKZOV-0004ut-Dw
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2008 14:23:55 +0100
Received: by fk-out-0910.google.com with SMTP id 18so723839fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 05:24:03 -0800 (PST)
Received: by 10.78.171.20 with SMTP id t20mr3262013hue.41.1201785843184;
	Thu, 31 Jan 2008 05:24:03 -0800 (PST)
Received: from widy.localdomain ( [88.231.86.1])
	by mx.google.com with ESMTPS id t12sm12082099gvd.2.2008.01.31.05.24.00
	(version=SSLv3 cipher=OTHER); Thu, 31 Jan 2008 05:24:02 -0800 (PST)
Date: Thu, 31 Jan 2008 15:36:31 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080131153631.44580eb5@widy.localdomain>
In-Reply-To: <1201782532.4996.36.camel@localhost.localdomain>
References: <fnqakr$ffa$1@ger.gmane.org>
	<20080130203832.31fd5919@widy.localdomain>
	<fnqqtt$e5o$1@ger.gmane.org>
	<20080131015606.481c0eb7@widy.localdomain>
	<fns5k4$ti$1@ger.gmane.org>
	<20080131130015.6770440b@widy.localdomain>
	<fnsa6j$gt9$1@ger.gmane.org>
	<1201782532.4996.36.camel@localhost.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: RFC: aggressive usurpation of bugs.oe.net by Angstrom
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
X-List-Received-Date: Thu, 31 Jan 2008 13:23:55 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 31 Jan 2008 12:28:52 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> Hi Paul/Rolf,
> 
> I've mostly read this thread and I have a few comments to make as an
> observer:
> 
> a) it is good to see Rolf working on OE again

By all means!

> b) Angstrom is not the only distro OE supports and never will be. It
> was started as a means to merge several very similar distributions
> and focus various developer's efforts. It was also an opportunity to
> try and show how a distro should work since lots of people didn't
> understand the things a distro should control.
> 
> It therefore serves as a kind of role model in OE but that doesn't
> mean it will always serve that role or that its preferred over
> everything else. Angstrom needs to keep in mind that at least in
> theory if it drops the ball, OE could choose a different "role
> model" ;-). Other distros are welcome in OE and are welcome to use
> the bugzilla since a lot of bug reports have implications outside a
> given distribution.

Well, the problem (see subject) started with that Rolf, not an Angstrom
developer, started to intervene with how special kind of bugs - "known
release issues" are managed for Angstrom (rather transparently as for
OE). And that's the same issue which caused previous squall of flame in
December, but seemingly was settled then. Now it happens again. Strange.
So, it's more about making additional hardnesses for maintaining bugs
for one distro, than one distro not letting other distros maintain bugs.

> 
> c) Rolf is perfectly right to ask if there is a better way to handle
> this. "Can we do X better?" is always a good valid question.

Not only ask, do if he has better ideas! But in such way that don't
overrule other people's needs, please. I'd be glad to move to his
scheme or just leave all that to him - once it's clear that his scheme
works well, made for good transition, and maintained sustainably.

> d) Saying OE should only have one distro is not a way to solve the
> problem.

Dunno who said that. Heard only someone saying that having such an
idyll picture would not call in such pressing way for any problems like
being raised now.

> e) If nobody has useful for suggestions for improving things, lets
> wait for Rolf to propose any better ways for handling things. We can
> then discuss those improvements based on technical merit, not
> character assassination.

> Cheers,
> 
> Richard

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


