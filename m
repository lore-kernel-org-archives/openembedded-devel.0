Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ntn52-0007mC-HE
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 20:14:33 +0100
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KZP0030K6M78T00@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Mar 2010 14:11:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1159B14AF60; Mon,
	22 Mar 2010 15:10:55 -0400 (EDT)
Date: Mon, 22 Mar 2010 15:10:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100322191054.GA28005@denix.org>
References: <201003222055.23408.murat@bilkon-kontrol.com.tr>
MIME-version: 1.0
In-reply-to: <201003222055.23408.murat@bilkon-kontrol.com.tr>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: u-boot_git recipe
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
X-List-Received-Date: Mon, 22 Mar 2010 19:14:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 22, 2010 at 08:55:23PM +0200, Murat Karadeniz wrote:
> i m the newbie on using oe. i m getting this message from shell. i dont know 
> why it is. bitbake version is 1.19, Machine is dm6446-evm and DISTRO is 
> angstrom-2008.1
> 
> Thanks for taking your time
> 
> 
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'u-
> boot_git' but it wasn't found in any PACKAGE or RPROVIDES variables
> Unknown Event: <bb.event.NoProvider instance at 0xf3241ac>
> NOTE: Resolving any missing task queue dependencies
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'u-
> boot_git' but it wasn't found in any PACKAGE or RPROVIDES variables
> Unknown Event: <bb.event.NoProvider instance at 0x1159792c>
> NOTE: Runtime target 'u-boot_git' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['u-boot_git']

Which branch you are using and what are you trying to build in the above 
command?

-- 
Denys


