Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CF60C601DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 21:13:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2013 14:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,891,1363158000"; d="scan'208";a="355662711"
Received: from unknown (HELO helios.localnet) ([10.252.122.67])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2013 14:13:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 18 Jun 2013 22:13 +0100
Message-ID: <1629546.H8QlHiyuGC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH 0/9] add missing SUMMARY and DESCRIPTION
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2013 21:13:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 17 June 2013 22:34:43 Andrea Adami wrote:
> Andrea Adami (9):
>   initramfs-kexecboot(-klibc)-image: provide SUMMARY and DESCRIPTION
>   kexecboot_cfg: add SUMMARY and extend DESCRIPTION
>   kexecboot(-klibc): add SUMMARY, DESCRIPTION, HOMEPAGE
>   ubi-utils-klibc: add SUMMARY and DESCRIPTION
>   kexec-tools-klibc: add custom SUMMARY
>   linux-yocto-tiny-kexecboot: add custom SUMMARY
>   klibc(-static)-utils: add SUMMARY
>   klcc-cross: add SUMMARY
>   klibc: add SUMMARY
> 
>  meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb | 10
> ++++------ .../recipes-bsp/images/initramfs-kexecboot-klibc-image.bb      |
>  6 +++++- meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb      | 
> 4 +++- meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb    |  1
> + meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc             |  3 +++
> meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb      |  1 +
> .../recipes-devtools/klibc/klibc-static-utils_2.0.2.bb         |  1 +
> meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb     |  1 +
> meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb           |  1 +
> meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb   |  3 ++-
> meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb |  1 +
> .../recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb     |  1 + 12
> files changed, 24 insertions(+), 9 deletions(-)

Merged, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

