Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYzh4-00088r-Nf
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 13:36:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Dec 2011 04:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="85378700"
Received: from unknown (HELO helios.localnet) ([10.252.122.20])
	by orsmga002.jf.intel.com with ESMTP; 09 Dec 2011 04:29:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Antonio Ospite <ospite@studenti.unina.it>
Date: Fri, 09 Dec 2011 12:29:57 +0000
Message-ID: <2692184.c0BLhdi50S@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1323390570-3088-1-git-send-email-ospite@studenti.unina.it>
References: <1323390570-3088-1-git-send-email-ospite@studenti.unina.it>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 0/2] Little EzX fixes
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
X-List-Received-Date: Fri, 09 Dec 2011 12:36:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 09 December 2011 01:29:28 Antonio Ospite wrote:
> Hi,
> 
> these are little touches for motorola-ezx in meta-handheld.
> 
> The first one is an actual fix, without it we can't build anything using EzX
> MACHINEs. After this at least meta-toolchain builds fine.
> 
> The second one is taken from zaurus.inc, it makes settings less scattered
> around motorola-ezx-base.inc.
> 
> Thanks,
>    Antonio
> 
> Antonio Ospite (2):
>   motorola-ezx-base.inc: do not define TARGET_ARCH
>   motorola-ezx-base.inc: enable "iwmmxt" as extra arch only when needed
> 
>  conf/machine/include/motorola-ezx-base.inc |    5 +----
>  1 files changed, 1 insertions(+), 4 deletions(-)

Merged to meta-handheld (with a very minor whitespace fix for 2/2), thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


