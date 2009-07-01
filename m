Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MM5ba-0003jU-AZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 21:36:30 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM4004PRB7YC5WE@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Jul 2009 14:24:03 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DC73214AF5F; Wed,
	01 Jul 2009 15:23:57 -0400 (EDT)
Date: Wed, 01 Jul 2009 15:23:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090701192357.GF20815@denix.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-13-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1246474461-16671-13-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 018/125] Angstrom 2009.X: set	OLDEST_KERNEL to 2.6.16 to avoid problems with ppoll()
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
X-List-Received-Date: Wed, 01 Jul 2009 19:36:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 01, 2009 at 08:54:19PM +0200, Marcin Juszkiewicz wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  conf/distro/angstrom-2008.1.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
> index de69c48..a607d4c 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -20,7 +20,7 @@ DISTRO_VERSION = "2009.X-stable"
>  DISTRO_REVISION = "1"
>  DISTRO_PR = ".1"
>  
> -OLDEST_KERNEL ?= "2.6.18"
> +OLDEST_KERNEL ?= "2.6.16"
>  
>  #build staging from packages
>  INHERIT += "packaged-staging"
> -- 
> 1.6.3.1
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


