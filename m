Received: from [82.208.44.173] (helo=ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@ibawizard.net>) id 1JZ30W-0005ud-Qa
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 12:51:06 +0100
Received: by ibawizard.net (Postfix, from userid 1009)
	id DB7CF12D03B; Tue, 11 Mar 2008 12:49:38 +0100 (CET)
Date: Tue, 11 Mar 2008 12:49:38 +0100
From: Petr Stetiar <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Message-ID: <20080311114938.GM30267@ibawizard.net>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
Mime-Version: 1.0
In-Reply-To: <fr5ntp$n0v$1@ger.gmane.org>
User-Agent: Mutt/1.5.9i
X-SA-Exim-Connect-IP: 82.208.44.173
X-SA-Exim-Mail-From: ynezz@ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 11:51:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Koen Kooi <koen@dominion.kabel.utwente.nl> [2008-03-11 11:46:09]:

> CVS also has a large user base and lots of OE developers have lots of
> experience with it.

Didn't knew, that CVS is "distributed" SCM :-)

My reason for using Git, is, that I could drop my local overlays maintained in
SVN, and could easily use Git's branches for it. It's then really easy to try
out and build different braches and also easier to send patches back to OE.

-- ynezz


