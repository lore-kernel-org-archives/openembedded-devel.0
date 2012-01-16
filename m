Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rma8l-0001WS-Vb
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 01:09:36 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Jan 2012 16:01:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="56721524"
Received: from unknown (HELO helios.localnet) ([10.252.122.151])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jan 2012 16:01:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jan 2012 00:01:55 +0000
Message-ID: <1546615.ScWcVgRR0D@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1326585786-22118-1-git-send-email-andrea.adami@gmail.com>
References: <1326585786-22118-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld] [PATCH 0/2] [Zaurus] Minor changes
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
X-List-Received-Date: Mon, 16 Jan 2012 00:09:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 15 January 2012 01:03:04 Andrea Adami wrote:
> * Standardize the initramfs-kexecboot images and adapt
> * mimicking core-image-minimal-initramfs.
> *
> * Remove legacy device table for Zaurus, now using devtmpfs in kernel.
> 
> Andrea Adami (2):
>   initramfs-kexecboot-* images: adapt to oe-core
>   zaurus.inc: remove IMAGE_DEVICETABLE settings, now using devtmpfs
> 
>  conf/machine/include/zaurus.inc                    |    5 -----
>  recipes-bsp/images/initramfs-kexecboot-image.bb    |    5 +++++
>  .../images/initramfs-kexecboot-klibc-image.bb      |    2 ++
>  3 files changed, 7 insertions(+), 5 deletions(-)

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


