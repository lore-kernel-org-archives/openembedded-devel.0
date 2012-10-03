Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJNLv-0006VJ-BV
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 13:42:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Oct 2012 04:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="201016016"
Received: from unknown (HELO helios.localnet) ([10.252.122.52])
	by orsmga001.jf.intel.com with ESMTP; 03 Oct 2012 04:29:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 12:29:56 +0100
Message-ID: <2386446.3zWsEst4ZG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <8B480455-60FE-418C-9A98-DB281B347CE2@dominion.thruhere.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<1403689.8imU91Pjgi@helios>
	<8B480455-60FE-418C-9A98-DB281B347CE2@dominion.thruhere.net>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Wed, 03 Oct 2012 11:42:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 October 2012 13:27:41 Koen Kooi wrote:
> Op 3 okt. 2012 om 12:43 heeft Paul Eggleton <paul.eggleton@linux.intel.com> 
het volgende geschreven:
> > On Wednesday 03 October 2012 12:24:19 Koen Kooi wrote:
> >> Squash those "import" with the "fix" commits, no sense in having a broken
> >> recipe in there.
> > 
> > I'd rather not - there is sense in being clear about the changes, because
> > there are a large number of them in this case.
> 
> The broken recipes are still available in OE classic if people want to
> compare them. I still don't get why you want to have broken recipes in the
> tree at multiple points in your series.

Because I want to easily see in "git blame" where particular lines came from - 
did I add them, or have they been around for ages?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


