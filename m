Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1URSqG-0002PX-8E
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 21:44:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Apr 2013 12:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,471,1363158000"; d="scan'208";a="286014830"
Received: from unknown (HELO helios.localnet) ([10.255.13.160])
	by azsmga001.ch.intel.com with ESMTP; 14 Apr 2013 12:26:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2013 20:26:29 +0100
Message-ID: <1742489.jOxEEgbE7k@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <5A70C57D-2410-4CCA-8842-147914F13AFD@gmail.com>
References: <1365867474-10261-1-git-send-email-Martin.Jansa@gmail.com>
	<5A70C57D-2410-4CCA-8842-147914F13AFD@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] llvm: Import from meta-java
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
X-List-Received-Date: Sun, 14 Apr 2013 19:44:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 14 April 2013 09:18:48 Khem Raj wrote:
> also see
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-extras/tree/recipes/llvm

That's ancient though. If there's a working recipe elsewhere I'll delete the 
one in meta-extras. (FYI, most of the stuff in meta-extras is old and broken; 
the layer is there to preserve recipes in case someone decides to pick them up 
and get them working again.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


