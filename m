Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MshFV-0006eI-Tn
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 20:16:33 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQQ006FSW1IM1T1@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	29 Sep 2009 13:15:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 238CF14AF60; Tue,
	29 Sep 2009 14:15:18 -0400 (EDT)
Date: Tue, 29 Sep 2009 14:15:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090929181518.GB12138@denix.org>
References: <5f2b60909290445h117f28f0s807430bcec2176e1@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <5f2b60909290445h117f28f0s807430bcec2176e1@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dm6446-evm kernel broken
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
X-List-Received-Date: Tue, 29 Sep 2009 18:16:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 29, 2009 at 01:45:58PM +0200, Bj??rn Forsman wrote:
> Hi all,
> 
> It seems like commit "linux-davinci: add DA850/OMAPL138, update other
> DaVinci machines",
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=a96730454f6f8d86519317ad0798b2f96dfcdd45,
> broke the kernel for the dm6446-evm.
> 
> After this commit, my kernel will not boot. This is what I get:
> 
> [console printout begin]
> ## Booting image at 80700000 ...
>    Image Name:   Angstrom/2.6.30-r10+gitr5212151f
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

From the commit you referred above, none of the SRCREVs use 5212151f commit 
number/hash. Please check what kernel you are building/booting.

-- 
Denys


