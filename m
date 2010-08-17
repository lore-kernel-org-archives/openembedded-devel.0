Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OlHiO-0006Rx-RV
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 10:40:15 +0200
Received: from [192.168.1.25] (business-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 5C495584116
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 10:43:27 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <AANLkTi=XK3Le8ERWqmMt2DEVX3K4n=ua0Zdyu6qEOUcw@mail.gmail.com>
Date: Tue, 17 Aug 2010 10:39:56 +0200
Message-Id: <47A90E34-ABBD-4D37-9F47-B1EF6BEFE198@vanille-media.de>
References: <AANLkTi=XK3Le8ERWqmMt2DEVX3K4n=ua0Zdyu6qEOUcw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: rename files dirs
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
X-List-Received-Date: Tue, 17 Aug 2010 08:40:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> Currently lots of our patches reside in a directory called files.
> Somewhere in the past koen explained me that that is not really proper
> (and I agree with them).

I disagree with that. In fact I'd rather suggest the other way, which
is: Put them all into files/ unless you have a compelling reason not to,
i.e. the moment one patch does not apply any longer to all versions of
the recipes; then it should be moved to PN-PV directory.

Cheers,

:M:



