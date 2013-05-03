Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UYHZG-0007Or-EE
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 17:06:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2013 07:46:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,605,1363158000"; d="scan'208";a="307542164"
Received: from unknown (HELO helios.localnet) ([10.255.12.224])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2013 07:48:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 03 May 2013 15:48:22 +0100
Message-ID: <2129589.jKF1vi4yO8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <0EBE068C-2C2D-468C-BEB1-85FB799B94D6@dominion.thruhere.net>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<12323341.7tMrSLVFbj@helios>
	<0EBE068C-2C2D-468C-BEB1-85FB799B94D6@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Fri, 03 May 2013 15:06:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 03 May 2013 16:40:13 Koen Kooi wrote:
> Op 3 mei 2013, om 16:35 heeft Paul Eggleton <paul.eggleton@linux.intel.com>
> het volgende geschreven:
> > IMO, let's keep the separate inc file, but drop PR and INC_PR.
> 
> I still haven't heard a compelling case why smartmontools needs a .inc and
> all the other recipes in meta-oe don't. So drop the inc and be consistent
> with other recipes.

All the other recipes? You mean all of them except for the significant number 
you can find if you run "git grep require.*inc" in meta-oe?

On Friday 03 May 2013 16:39:13 Koen Kooi wrote:
> It's unnecessary clutter and in the smartmontools case unneeded as well.

How is it any less necessary for smartmontools than any other recipe?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


