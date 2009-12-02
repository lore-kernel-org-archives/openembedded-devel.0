Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NFx4J-00021U-L5
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 22:49:06 +0100
Received: from gandalf.denix.org ([71.255.235.232]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KU10027HLQ42LDD@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	02 Dec 2009 14:46:58 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 05E7514AF60; Wed,
	02 Dec 2009 15:46:52 -0500 (EST)
Date: Wed, 02 Dec 2009 15:46:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091202204652.GD21762@denix.org>
References: <1259691294-1131-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1259691294-1131-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: Re: [STABLE][PATCH 1/3] bug: ship SDIO firmware for WiFi
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
X-List-Received-Date: Wed, 02 Dec 2009 21:49:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Dec 01, 2009 at 07:14:52PM +0100, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  conf/machine/bug.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/machine/bug.conf b/conf/machine/bug.conf
> index cec3d5b..3e0389a 100644
> --- a/conf/machine/bug.conf
> +++ b/conf/machine/bug.conf
> @@ -3,7 +3,7 @@
>  #@DESCRIPTION: Machine configuration for the BUG base unit.
>  TARGET_ARCH = "arm"
>  
> -MACHINE_EXTRA_RRECOMMENDS = "marvell-gspi-fw"
> +MACHINE_EXTRA_RRECOMMENDS = "marvell-gspi-fw marvell-sdio-fw"
>  PREFERRED_PROVIDER_virtual/kernel = "linux-bug"
>  
>  MACHINE_FEATURES = "kernel26 screen touchscreen hotplug alsa wifi usbhost usbgadget"
> -- 
> 1.6.5.2
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


