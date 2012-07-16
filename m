Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Squgn-0004XQ-8W
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 01:26:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Jul 2012 16:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="167145827"
Received: from unknown (HELO helios.localnet) ([10.252.121.26])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2012 16:15:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Date: Tue, 17 Jul 2012 00:15:32 +0100
Message-ID: <67126769.ZK6yL1tO9B@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <38351001.3KzA0t96MO@helios>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<20120712195752.GN3293@windriver.com> <38351001.3KzA0t96MO@helios>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Mon, 16 Jul 2012 23:26:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 13 July 2012 16:58:00 Paul Eggleton wrote:
> On Thursday 12 July 2012 15:57:52 Joe MacDonald wrote:
> >    - systemd
> 
> Despite what I said yesterday Andreas has come through with v2 of the patch
> series this morning, so assuming that's in good shape, it looks like we
> should be on track to do the meta-systemd split and then meta-networking
> after that, which will save a whole lot of hassle. It probably will be
> necessary to patch meta-systemd at the same time to move the
> meta-networking parts into a subdirectory so they can be masked out if
> desired, but that's a trivial exercise.

Following up, the meta-systemd split-out has now been merged, so this should 
no longer be a blocker.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


