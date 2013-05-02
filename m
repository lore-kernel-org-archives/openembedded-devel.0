Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXuVG-00064l-IM
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 16:29:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 May 2013 07:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,597,1363158000"; d="scan'208";a="330315189"
Received: from unknown (HELO helios.localnet) ([10.255.12.165])
	by orsmga002.jf.intel.com with ESMTP; 02 May 2013 07:10:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 02 May 2013 15:10:56 +0100
Message-ID: <1714072.P9NRZQZN5F@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <5182701F.5030605@pseudoterminal.org>
References: <2924564.6VWmlqGvL5@helios> <5182701F.5030605@pseudoterminal.org>
MIME-Version: 1.0
Cc: Cristian Iorga <cristian.iorga@intel.com>
Subject: Re: Please submit your unindexed layers
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
X-List-Received-Date: Thu, 02 May 2013 14:29:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 May 2013 15:54:39 Carlos Rafael Giani wrote:
> While I do have a layer for GStreamer 1.0 , I did not want to add it to
> the index. My guess was that OE core developers might have been
> preparing recipes for GStreamer 1.0 for later OE core versions already,
> so the layer would then eventually be in conflict with OE core.
> 
> So, should I add it now?

I guess it depends on how long it will take to integrate these recipes in OE-
Core. If it's going to take more than a couple of weeks it's probably fine to 
add it to the index with a note saying the layer is temporary until the 
recipes are integrated.

Cristian, Ross - opinions?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


