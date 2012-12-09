Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ThqxZ-0000rR-Cd
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2012 01:11:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Dec 2012 15:56:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,248,1355126400"; d="scan'208";a="254894604"
Received: from unknown (HELO helios.localnet) ([10.252.122.220])
	by orsmga002.jf.intel.com with ESMTP; 09 Dec 2012 15:56:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 09 Dec 2012 23:56:28 +0000
Message-ID: <1534902.KtHz8MRep8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1354752430-14139-1-git-send-email-andrea.adami@gmail.com>
References: <1354752430-14139-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 1/3] linux-yocto_3.4: move MTD common options to zaurus-hardware.cfg
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
X-List-Received-Date: Mon, 10 Dec 2012 00:11:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 December 2012 01:07:08 Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../linux/linux-yocto-3.4/akita/akita.cfg          |    6 ------
>  recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg |    6 ------
>  .../linux/linux-yocto-3.4/collie/collie.cfg        |    6 ------
>  .../linux/linux-yocto-3.4/poodle/poodle.cfg        |    6 ------
>  .../linux/linux-yocto-3.4/spitz/spitz.cfg          |    6 ------
>  recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg |    6 ------
>  .../linux/linux-yocto-3.4/zaurus-hardware.cfg      |    6 ++++++
>  7 files changed, 6 insertions(+), 36 deletions(-)

Merged these three to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


