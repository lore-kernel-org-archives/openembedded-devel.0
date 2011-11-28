Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RV1Ju-0000ny-Ee
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 14:32:30 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Nov 2011 05:25:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,584,1315206000"; d="scan'208";a="89777648"
Received: from unknown (HELO helios.localnet) ([10.252.121.230])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2011 05:25:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 28 Nov 2011 13:25:49 +0000
Message-ID: <47236173.EeZFgPNp8G@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1322472706-12917-1-git-send-email-koen@dominion.thruhere.net>
References: <1322472706-12917-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld] linux 2.6.39: remove all traces of it
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
X-List-Received-Date: Mon, 28 Nov 2011 13:32:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 November 2011 10:31:46 Koen Kooi wrote:
> The previous commit stated:
> 
> 	From e6a10fdf93658c0ab93e9a9afc924f52589ab4f6 Mon Sep 17 00:00:00 2001
> 	From: Paul Eggleton <paul.eggleton@linux.intel.com>
> 	Date: Sun, 27 Nov 2011 21:33:58 +0000
> 	Subject: linux: move h1940 up to 3.1
> 
> 	* Add new h1940 defconfig from Vasily Koruzhick <anarsoul@gmail.com>
> 	* Remove 2.6.39 as no machine in meta-handheld is using it anymore
> 
> So lets indeed remove 2.6.39 and stop the parse failures from happening

Oops, sorry about that. Fix merged to meta-handheld master.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



