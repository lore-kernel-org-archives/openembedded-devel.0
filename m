Received: from [209.225.8.186] (helo=mtao01.charter.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <erik@hovland.org>) id 1H0nKQ-0004vh-8P
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Dec 2006 00:09:26 +0100
Received: from aa06.charter.net ([10.20.200.158]) by mtao01.charter.net
	(InterMail vM.6.01.06.01 201-2131-130-101-20060113) with ESMTP
	id <20061230230837.JSUU1329.mtao01.charter.net@aa06.charter.net>
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Dec 2006 18:08:37 -0500
Received: from charter.net ([71.92.202.52]) by aa06.charter.net with SMTP
	id <20061230230837.JMID22316.aa06.charter.net@charter.net>
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Dec 2006 18:08:37 -0500
Received: by charter.net (nbSMTP-1.00) for uid 1000
	erik@hovland.org; Sat, 30 Dec 2006 15:08:37 -0800 (PST)
Date: Sat, 30 Dec 2006 15:08:34 -0800
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061230230834.GG30598@hovland.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <4596E33D.306@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.13 (2006-08-11)
X-Chzlrs: 0
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
X-List-Received-Date: Sat, 30 Dec 2006 23:09:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 30, 2006 at 11:07:57PM +0100, Koen Kooi wrote:
> > On Sat, Dec 30, 2006 at 07:19:29PM +0000, Richard Purdie wrote:
> 
> >> It does mean you shouldn't be committing changes locally via monotone.
> >> If you do this you will have to pull and then merge every time. That
> >> isn't a problem in itself but if you do get direct commit access, we
> >> will not be happy adding hundreds of extra merges to the main
> >> repository.
> > 
> > WTF?  Why are you using a distributed revision control system, if I'm not
> > supposed to be committing locally?  If everything I do is supposed to be
> > bundled up into a patch and sent to the bugzilla, how am I meant to maintain
> > my own tree of fixes while I wait for them all to be applied to dev?  Quilt? 
> > That might make sense if I'm stuck interacting with SVN, but with a DRCS in
> > the mix I expect *it* to be able to take on that role.
> 
> Do what virtually every DSCM does to support that: make a branch

Strange. Git nor mercucial require you to branch.

E

-- 
Erik Hovland
mail: erik@hovland.org
web: http://hovland.org/
PGP/GPG public key available on request



