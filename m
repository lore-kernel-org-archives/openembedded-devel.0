Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H3g8h-0006iV-6Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jan 2007 23:05:15 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H3g79-00056D-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2007 09:03:39 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id C75244C220; Mon,  8 Jan 2007 09:03:33 +1100 (EST)
Date: Mon, 8 Jan 2007 09:03:33 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070107220333.GC6625@hezmatt.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1662139633.20070107231632@gmail.com>
User-Agent: Mutt/1.5.11
Subject: Re: A question of workflow
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
X-List-Received-Date: Sun, 07 Jan 2007 22:05:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 07, 2007 at 11:16:32PM +0200, Paul Sokolovsky wrote:
>   Well, why would OE core developers (err, what about non-core
> developers - we also care for contributed patches - after all, to get
> commit access to OE, you first contribute bunch of patches) - well, why
> would they do that? OE is open-source project, there's no position of
> "patch processor", and people do what they find useful, leaving some
> share of their for patch processing. Any complex and artificial rules
> won't work.

The only reason I can think of for the core devs to follow a particular
workflow is to make it ultimately easier for external contributors to
produce and submit patches.  The more external patches that come in, the
less work the core devs have to do (or the more 'other' things they can do). 
For example, a few days ago Marcin asked for a patch to make a build of a
newer version of fakeroot; I'd have whipped that patch up by now except that
I know that it's going to cause a conflict when the change comes back down,
so I'm loathe to make the change until I work out how I can manage the patch
flow, because it's going to cause me pain without any benefit.  I'm just not
that masochistic.

- Matt


