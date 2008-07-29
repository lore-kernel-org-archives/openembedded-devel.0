Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KNq1h-0003Mr-Ub
	for openembedded-devel@openembedded.org; Tue, 29 Jul 2008 16:18:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6TEGWYN004597
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 15:16:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04537-02 for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 15:16:25 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6TEGOUX004586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 15:16:24 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Tue, 29 Jul 2008 15:16:25 +0100
Message-Id: <1217340985.5482.9.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: OE Commit Policy and other procedures
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 29 Jul 2008 14:18:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

We've been conscious that the OE project has lacked direction and in
some senses management. In an attempt to clear all this up the "core
team" have put together some policies to try and give structure to the
way we do things. These have been put onto the wiki and are linked off
the http://wiki.openembedded.net/index.php/Category:Policy page.

The newly added pages are:

http://wiki.openembedded.net/index.php/Branching_Policy
http://wiki.openembedded.net/index.php/Bug_days
http://wiki.openembedded.net/index.php/Commit_Policy
http://wiki.openembedded.net/index.php/Community_Servers
http://wiki.openembedded.net/index.php/Documentation_Team
http://wiki.openembedded.net/index.php/New_commit_rights
http://wiki.openembedded.net/index.php/OE_core_team
http://wiki.openembedded.net/index.php/User_contributions

Of these, the ones of particular importance are the commit policy and
the core and documentation teams. These formalise
arrangements/agreements that have partially existed for a while.

These policies pretty much reflect the way things have happened up until
now so its hoped they're not too controversial and not too much
discussion should be needed but obviously if anyone has any questions or
issues please do raise them. Its hoped this clarifys the situation for
everyone concerned.

Of key importance is the commit policy which should now give us a clear
run on the changeover to git. I'll follow up this email with another
about that.

Also listed here but slightly out of place is a proposal/RFC: 

http://wiki.openembedded.net/index.php/Structure_of_.dev_branch

I've proposed this in various ways before and I think this is needed,
not least to help with the commit policy and what is defined as a "core"
component needing more careful review. Please consider this as a RFC and
follow up on the list with any questions/issues/counter proposals etc.

Regards,

Richard (on behalf of a unanimous core team decision)




