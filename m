Received: from p3plsmtpa01-07.prod.phx3.secureserver.net ([72.167.82.87])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NudlI-0007bd-R0
	for openembedded-devel@openembedded.org; Thu, 25 Mar 2010 04:29:37 +0100
Received: (qmail 32106 invoked from network); 25 Mar 2010 03:19:45 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-07.prod.phx3.secureserver.net (72.167.82.87) with ESMTP;
	25 Mar 2010 03:19:44 -0000
Message-ID: <4BAAD653.2050404@mwester.net>
Date: Wed, 24 Mar 2010 22:19:47 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.167.82.87
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: What happened to e2fsprogs-libs?
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
X-List-Received-Date: Thu, 25 Mar 2010 03:29:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Builds failing (see below).  I think I found the commit (pretty obvious
with git log) but I presume that reverting it is not my best course of
action :-)
So, now that e2fsprogs-libs is gone, what am I to depend upon instead?
-Mike (mwester)

NOTE: Resolving any missing task queue dependencies
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime
entity 'e2fsprogs-libs' but it wasn't found in any PACKAGE or RPROVIDES
variables
NOTE: Runtime target 'e2fsprogs-libs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs-libs']



