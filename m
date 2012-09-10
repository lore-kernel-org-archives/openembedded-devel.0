Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TB2qm-0001CR-Ub
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 14:12:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2012 04:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,396,1344236400"; d="scan'208";a="200729997"
Received: from unknown (HELO helios.localnet) ([10.252.121.193])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2012 04:59:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Date: Mon, 10 Sep 2012 12:59:51 +0100
Message-ID: <9232516.1xch2uBtF4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <20120910113439.GA24943@windriver.com>
References: <1347224217-2829-1-git-send-email-paul.eggleton@linux.intel.com>
	<20120910113439.GA24943@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] zeroconf: add from OE-Core
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
X-List-Received-Date: Mon, 10 Sep 2012 12:12:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 10 September 2012 07:34:39 Joe MacDonald wrote:
> [[meta-networking][PATCH] zeroconf: add from OE-Core] On 12.09.09 (Sun 
21:56) Paul Eggleton wrote:
> > This is about to be removed from OE-Core, so add it here for those that
> > still want it.
> 
> I've wondered about this, considering how long ago my original proposal
> was and we haven't really gotten into the bulk of the migrations I'd
> planned on but if there's no objection to the original recipe directory
> structure I'd originally proposed, I think this would make sense to live
> in recipes-protocols/.

Sounds reasonable; I'll sent a v2.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


