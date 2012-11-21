Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbAY5-0008Fb-Sr
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 14:41:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Nov 2012 05:26:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,293,1352102400"; d="scan'208";a="245328050"
Received: from unknown (HELO helios.localnet) ([10.252.122.187])
	by orsmga002.jf.intel.com with ESMTP; 21 Nov 2012 05:26:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Nov 2012 13:26:58 +0000
Message-ID: <2005939.1ecdEfVasM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <1353503878-26344-1-git-send-email-koen@dominion.thruhere.net>
References: <1353503878-26344-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] Revert "ntp: Clean up recipes"
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
X-List-Received-Date: Wed, 21 Nov 2012 13:41:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 November 2012 14:17:58 Koen Kooi wrote:
> This breaks the upgrade path since 'ntpdate' has been renamed to 'ntp-date'.
> I don't know why this patch was applied when it was shot down on review.

I'm working on a patch to fix various issues with this recipe including this 
one, so if this is your only concern I'd rather we either wait until I submit 
that (soon) or just change the name back alone rather than reverting the 
entire patch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


