Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8YoJ-0006HY-H1
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 13:30:02 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 080F11B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 12:39:34 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 13:28:19 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200911120457.39018.holger+oe@freyther.de>
	<200911120611.24699.holger+oe@freyther.de>
	<1258027760.7382.36.camel@dax.rpnet.com>
In-Reply-To: <1258027760.7382.36.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200911121328.19183.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: meta-toolchain continues to woe
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
X-List-Received-Date: Thu, 12 Nov 2009 12:30:02 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 12 November 2009 13:09:20 Richard Purdie wrote:

> 
> I think regardless of how we did this there would be some bumps. It was
> on a branch for a week and it was obvious nobody was testing it expect
> me. Getting on and doing it and dealing with problems quickly seemed
> like the best approach and was what we agreed at OEDEM.

You are right, I was simply not aware that you have posted a branch for 
review. So thank you for the changes and thank you for being stand bye
to address these. Who ever is going to be in the TSC I would greatly 
appreciate if we can formalize our process for updating the core 
infrastructure.

E.g.

1.) Do the changes in a branch
2.) Mail that the branch will be merged (top level posting, [MERGE] in the 
subject)
2.1) Get feedback from testers
3.) Merge core changes on a "core-merge" day...





> 
> For this specific issue, I've pushed some fixes for meta-toolchain, let
> me know if there are any further problems. My test build completed
> locally (bitbake meta-toolchain).

Thanks a lot! It is greatly appreciated.


