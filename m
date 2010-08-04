Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OgRoV-00073o-TW
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 02:26:33 +0200
Received: from gandalf.denix.org ([unknown] [71.255.225.53])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6L00DJDQJT0G42@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	03 Aug 2010 19:26:19 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8EEA214AF60; Tue,
	03 Aug 2010 20:26:17 -0400 (EDT)
Date: Tue, 03 Aug 2010 20:26:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100804002617.GG17391@denix.org>
References: <20100803225008.GF4752@home.lan>
MIME-version: 1.0
In-reply-to: <20100803225008.GF4752@home.lan>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Make git more usable
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
X-List-Received-Date: Wed, 04 Aug 2010 00:26:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 04, 2010 at 12:50:08AM +0200, Yann Dirson wrote:
> This series allows to install the essential functionnality of git
> while still consuming as less space as possible.  Space-consuming
> binaries are split to separate ipk's.
> 
> The final patch activates installation of gitk - it is only partially
> working, but does not force build of anything that's not built in the
> default shr image, and can hopefully bring someone into looking at
> what seems to be an issue in tcl/tk packaging.

Any specific reason you want to use dotted notation for PRs? While it's 
legitimate, it maybe confusing with INC_PR or DISTRO_PR...

-- 
Denys


