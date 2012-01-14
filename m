Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rm9rb-0007kv-3o
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jan 2012 21:06:07 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jan 2012 11:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112284578"
Received: from unknown (HELO helios.localnet) ([10.252.122.112])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2012 11:58:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 14 Jan 2012 19:58:29 +0000
Message-ID: <7500454.shM9G5aLoq@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1326243269-21197-1-git-send-email-andrea.adami@gmail.com>
References: <1326243269-21197-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld] [PATCH 1/2] various kernels: remove apply=yes from SRC_URI
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
X-List-Received-Date: Sat, 14 Jan 2012 20:06:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 January 2012 01:54:28 Andrea Adami wrote:
> * not necessary anymore, obsolete in oe-core

Unfortunately that is not the case here - because the patches in question do 
not have .patch or .diff extensions then you need to have apply=yes - with your 
change, the patch no longer gets applied.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


