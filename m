Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RFORt-0007HM-8X
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Oct 2011 13:00:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Oct 2011 03:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,353,1315206000"; d="scan'208";a="74276359"
Received: from unknown (HELO helios.localnet) ([10.252.120.244])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 03:54:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 16 Oct 2011 11:54:17 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-11-generic-pae; KDE/4.6.5; i686; ; )
References: <cover.1318411412.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318411412.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Message-Id: <201110161154.17976.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld 0/2] xserver-xf86-config and newer linux-git
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
X-List-Received-Date: Sun, 16 Oct 2011 11:00:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 12 October 2011 10:23:53 Martin Jansa wrote:
> The following changes since commit
> b4c1268763f3d4f0f9b4326d6fa27ba9c03aeaae:
> 
>   Ensure FILESEXTRAPATHS_prepend has a trailing colon (2011-09-19 16:27:42
> +0100)
> 
> are available in the git repository at:
>   git://gitorious.org/shr/meta-handheld jansa/pull
> 
> Martin Jansa (2):
>   xserver-xf86-config: add bbappend and spitz xorg.conf
>   linux: bump SRCREV for 3.1.0-rc9 and use repo on kernel.org again
> 
>  .../xserver-xf86-config/spitz/xorg.conf            |   49
> ++++++++++++++++++++ .../xorg-xserver/xserver-xf86-config_0.1.bbappend  | 
>   1 +
>  recipes-kernel/linux/linux-git.inc                 |    7 +--
>  3 files changed, 53 insertions(+), 4 deletions(-)
>  create mode 100644
> recipes-graphics/xorg-xserver/xserver-xf86-config/spitz/xorg.conf create
> mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend

Merged to meta-handheld, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


