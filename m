Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SD1aM-000628-23
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 00:43:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Mar 2012 15:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="122845466"
Received: from unknown (HELO helios.localnet) ([10.252.123.243])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2012 15:34:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 23:34:15 +0100
Message-ID: <2315605.Gyfx56aPAe@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <cover.1332935553.git.Martin.Jansa@gmail.com>
References: <cover.1332935553.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-handheld][PATCH 0/2] kernel upgrade and PRINC fix
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
X-List-Received-Date: Wed, 28 Mar 2012 22:43:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 March 2012 13:53:07 Martin Jansa wrote:
> The following changes since commit 1a1d50a1bf39136a8c974022d63e0f119f23bbff:
> 
>   keymaps: edit script to reuse 2.6 kernel keymaps (2012-03-25 23:51:03
> +0100)
> 
> are available in the git repository at:
>   git://gitorious.org/shr/meta-handheld jansa/pull
> 
> Martin Jansa (2):
>   linux-3.2: upgrade to 3.2.12
>   formfactor, keymaps, udev: use better form of PRINC
> 
>  recipes-bsp/formfactor/formfactor_0.0.bbappend |    2 +-
>  recipes-bsp/keymaps/keymaps_1.0.bbappend       |    2 +-
>  recipes-core/udev/udev_173.bbappend            |    2 +-
>  recipes-kernel/linux/linux_3.2.bb              |    8 ++++----
>  4 files changed, 7 insertions(+), 7 deletions(-)

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


