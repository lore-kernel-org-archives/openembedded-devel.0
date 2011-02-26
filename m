Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PtSCu-0004EJ-S3
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 23:01:44 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id E881C1D360AA; Sat, 26 Feb 2011 23:00:18 +0100 (CET)
Date: Sat, 26 Feb 2011 23:00:18 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110226220018.GE10042@ibawizard.net>
References: <4D6818C6.4010100@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D6818C6.4010100@mentor.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Release-2011.03: Let the testing re-continue again!
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
X-List-Received-Date: Sat, 26 Feb 2011 22:01:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tom Rini <tom_rini@mentor.com> [2011-02-25 14:01:58]:

> I plan to otherwise follow what I said in the previous email about final  
> branching plans, as I'm running out of ways to modify the Subject :)

FYI more build errors, build host is Ubuntu 10.04.2 64-bit. It seems, that the
console-image on uclibc needs some more love...

micro-uclibc   http://pastebin.com/mKvgZJnC
minimal-uclibc http://pastebin.com/2cWCZx37

-- ynezz


