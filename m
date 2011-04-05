Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q79Jm-0004Yf-8q
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:41:26 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ600FN6U9HSHU1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Apr 2011 11:39:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 08C6514AF5B; Tue,
	05 Apr 2011 12:39:17 -0400 (EDT)
Date: Tue, 05 Apr 2011 12:39:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110405163917.GD7168@denix.org>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
	<1302018111-20799-3-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1302018111-20799-3-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 3/5] sort: Add support for am45x-evm machine type
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
X-List-Received-Date: Tue, 05 Apr 2011 16:41:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 05, 2011 at 10:41:49AM -0500, Chase Maupin wrote:
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  contrib/angstrom/sort.sh |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
> index b38be99..ca13ce2 100755
> --- a/contrib/angstrom/sort.sh
> +++ b/contrib/angstrom/sort.sh
> @@ -79,7 +79,7 @@ case "$arch" in
>  	"armv6-novfp")
>  			machines="htcblackstone htcdiamond htcdream htckaiser htcnike htcpolaris htcraphael htctitan htcvogue" ;;
>  	"armv7a")
> -			machines="am3517-evm am3517-crane archos5 archos5it beagleboard bug20 cm-t35 dm37x-evm am37x-evm am387x-evm am389x-evm babbage c6a814x-evm c6a816x-evm dm814x-evm efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda usrp-embedded usrp-e1xx" ;;
> +			machines="am3517-evm am3517-crane am45x-evm archos5 archos5it beagleboard bug20 cm-t35 dm37x-evm am37x-evm am387x-evm am389x-evm babbage c6a814x-evm c6a816x-evm dm814x-evm efikamx htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda usrp-embedded usrp-e1xx" ;;
>  	"armv7a-vfp")
>  			machines="ac100" ;;
>  	"avr32")
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


