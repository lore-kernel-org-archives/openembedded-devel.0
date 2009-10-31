Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48kF-000448-07
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:51:34 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD00A6HCFXPABJ@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:50:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 57A3914AF60; Sat,
	31 Oct 2009 03:50:21 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:50:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031075021.GF16188@denix.org>
References: <1256813632.31481.14.camel@nvc0624>
	<20091029144448.GB3619@excalibur.local>
MIME-version: 1.0
In-reply-to: <20091029144448.GB3619@excalibur.local>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: recipe for xilinx jtag tool
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
X-List-Received-Date: Sat, 31 Oct 2009 07:51:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 29, 2009 at 03:44:48PM +0100, Stefan Schmidt wrote:
> Hello.
> 
> On Thu, 2009-10-29 at 11:53, Jaap de Jong wrote:
> > 
> > I've build my first openembedded recipe (please don't shoot!)
> > What would be the way to publish it?
> 
> Commit it in your local git repo and then do a git format-patch -1 and then send
> it to the list.

...preferably with git send-email to avoid MUA mangling...

-- 
Denys


