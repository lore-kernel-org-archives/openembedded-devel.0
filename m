Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1JdYXy-0004wV-Kw
	for openembedded-devel@openembedded.org; Sun, 23 Mar 2008 23:20:11 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080323222007.MTAN13697.fed1rmmtao102.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 23 Mar 2008 18:20:07 -0400
Received: from opus ([68.230.58.230]) by fed1rmimpo02.cox.net with bizsmtp
	id 4mL71Z0024y2VvG04mL72Y; Sun, 23 Mar 2008 18:20:07 -0400
Date: Sun, 23 Mar 2008 15:20:06 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080323222006.GE11817@smtp.west.cox.net>
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
	<200803180849.21108.geoffrey@pager.net>
	<frojpb$m6j$1@ger.gmane.org>
	<1205858910.7500.39.camel@dax.rpnet.com>
	<frosov$c0b$1@ger.gmane.org> <47E5A67B.5030809@dls.net>
	<47E5E7DD.4030304@dls.net> <fs5dbl$n1g$1@ger.gmane.org>
	<20080323181847.GD11817@smtp.west.cox.net>
	<fs6930$cg0$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <fs6930$cg0$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Sun, 23 Mar 2008 22:20:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 23, 2008 at 07:55:28PM +0100, Koen Kooi wrote:
> Tom Rini schreef:
> | On Sun, Mar 23, 2008 at 12:02:13PM +0100, Koen Kooi wrote:
> |
> |> Or use the stable branch? The stable branch seems to fit your needs:
> |> It's available, it's maintained and changes can only go in through a
> |> public and open review process.
> |
> | So you're saying that opkg will move to the stable branch once someone
> | documents how to update distros for it?
> 
> No, it can go into the stable branch once the steps in
> http://linuxtogo.org/gowiki/Angstrom/Backport_from_dev_to_stable have
> been satisfied.

Well, presumably there will be another stable branch declared at some
point and my main point holds.  Lets use this as a chance to document
how to move a distro up to opkg from ipkg, and maybe sort out the kinks
(such as say making it easy at the distro level to turn off GPG if size
is more important than signing).

-- 
Tom Rini


