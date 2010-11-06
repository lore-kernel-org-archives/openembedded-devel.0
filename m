Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PEdrh-0006hd-Fu
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 09:11:09 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 287581D36171; Sat,  6 Nov 2010 09:10:15 +0100 (CET)
Date: Sat, 6 Nov 2010 09:10:15 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106081015.GN15069@ibawizard.net>
References: <20101105235600.GA3671@boggieman.bredbandsbolaget.se>
MIME-Version: 1.0
In-Reply-To: <20101105235600.GA3671@boggieman.bredbandsbolaget.se>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ARMv4 not working with latest gcc,eglibc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Sat, 06 Nov 2010 08:11:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Kristoffer Ericson <kristoffer.ericson@gmail.com> [2010-11-06 00:56:00]:

> Khems addition of gcc 4.5 patch effectivly removed the thumb 'bx'
> instruction from the binaries, but Im getting the exact same issue as before
> (kernel panic at init time).

Same issue as before? What does it mean? What machine and distro combination
is that? I can build something and test it on my ts72xx, which is armv4t also.

> Filip zyzniewski had the combination of gcc 4.4.2 + eglibc 2.12 working well
> on his machine, I also know another person with an ARMv4t which used gcc 4.5
> + eglibc 2.12 without any issues (with same distro file).  Therefore I still
> believe its an compiler/thumb issue.  Im currently trying to reproduce
> filips environment to make sure, once I do it should be confirmed.

Sorry, I don't know Filip, nor his machine, can you be please more specific?
:-) Thanks.

-- ynezz


