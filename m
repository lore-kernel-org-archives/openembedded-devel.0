Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RoDd4-0005lu-LB
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 13:31:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 04:23:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100805589"
Received: from unknown (HELO helios.localnet) ([10.252.122.213])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 04:23:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2012 12:23:55 +0000
Message-ID: <3762267.4sff10kq27@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1326927730-21142-1-git-send-email-andrea.adami@gmail.com>
References: <1326927730-21142-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld] [PATCH 0/3] zaurus-utils: Inhibit toolchain dependencies
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
X-List-Received-Date: Fri, 20 Jan 2012 12:31:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 January 2012 00:02:07 Andrea Adami wrote:
> * inhibit toolchain dependencies as there isn't anything to compile
> 
> Andrea Adami (3):
>   zaurus-updater: Inhibit toolchain dependencies
>   zaurus-legacy-tar.bb: Inhibit toolchain dependencies
>   zaurus-installer: Inhibit toolchain dependencies
> 
>  recipes-bsp/zaurus-utils/zaurus-installer.bb  |    4 +++-
>  recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb |    4 +++-
>  recipes-bsp/zaurus-utils/zaurus-updater.bb    |    5 +++--
>  3 files changed, 9 insertions(+), 4 deletions(-)

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


