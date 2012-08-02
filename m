Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SwqgM-0001hx-AK
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 10:22:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Aug 2012 01:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="174536714"
Received: from unknown (HELO helios.localnet) ([10.252.121.75])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2012 01:11:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 02 Aug 2012 09:11:10 +0100
Message-ID: <671950423.c3foblMkXu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Thu, 02 Aug 2012 08:22:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 01 August 2012 15:56:34 Khem Raj wrote:
> On Aug 1, 2012, at 8:11 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> Along with upgrade use the release tarballs instead of git
> > 
> > For an update we need to pull in some patches from master, so a git recipe
> > is still the preferred way.
> 
> OK, you know more about it then me but do you know how many those will be ?
> in other words does systemd releases mean much for stability yet or still
> its a project moving at so fast pace ?
> 
> I see that releases are rolled out almost every month, that sort of could
> mean either way, we wait until the next release or just take from a commit
> upstream
> 
> I feel like staying with a release+patches could be one way if we are not
> importing pathes too often. but I don't know how often that would be. For
> the testing I did release worked well for those platforms x86, ppc and arm

One might suggest, if stable releases are working and you want to live on the 
bleeding edge in your distro, you can easily do so there...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


