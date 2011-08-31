Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QyjxW-00089P-W1
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:31:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Aug 2011 05:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,307,1312182000"; d="scan'208";a="12818221"
Received: from unknown (HELO helios.localnet) ([10.255.18.173])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Aug 2011 05:27:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 31 Aug 2011 13:27:01 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
In-Reply-To: <j3l8ni$kr3$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201108311327.01907.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 12:31:59 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 31 August 2011 13:16:50 Koen Kooi wrote:
> Op 31-08-11 13:55, Anders Darander schreef:
> > To sad. It's a lot easier to remember to bump the PR, when PR actually is
> > in the recipe. Thus, including PR=0 will often remove one issue with
> > patches.
> 
> That's what review is for, no?

Surely you'd rather people have a better chance of getting it right the first 
time rather than you having to remind them for every patch? The almost 
insignificant burden of a PR = "r0" in each recipe seems worthwhile to me if it 
even helps a single person remember.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


