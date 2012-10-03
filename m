Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJOBs-0008H1-Hn
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 14:36:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Oct 2012 05:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="229982525"
Received: from unknown (HELO helios.localnet) ([10.252.122.52])
	by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2012 05:23:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 13:23:37 +0100
Message-ID: <3740169.CM3Q3p8ay5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <8836BA14-373E-4530-8F81-9EE8DA000926@dominion.thruhere.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<4258940.BqvSfKhsZ3@helios>
	<8836BA14-373E-4530-8F81-9EE8DA000926@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 2/6] apache2: add from OE-Classic
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
X-List-Received-Date: Wed, 03 Oct 2012 12:36:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 October 2012 13:41:38 Koen Kooi wrote:
> Op 3 okt. 2012, om 13:28 heeft Paul Eggleton <paul.eggleton@linux.intel.com> 
het volgende geschreven:
> >>> + +PR = "r0"
> >> 
> >> that's the default, drop that
> > 
> > I'm sorry, but for reasons I've already stated on several occasions, I
> > won't leave this out in any recipe in meta-webserver, nor anywhere else
> > where I'm the maintainer.
> > 
> > Given that you often complain about people forgetting to bump PR, why do
> > you insist that people should remove PR = "r0" when having it there would
> > be at least slightly helpful in that regard?
> 
> I haven't seen any evidence that having PR = r0 helps people with that. Have
> a look at all the patches that were posted with missing PR bumps, they
> almost all have PR present.

It can't hurt, though. It certainly helps me to remember.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


