Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q79KT-0004k3-IW
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:42:10 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ6000GBU9YSW63@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Apr 2011 11:39:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5E0E714AF5B; Tue,
	05 Apr 2011 12:39:34 -0400 (EDT)
Date: Tue, 05 Apr 2011 12:39:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110405163934.GE7168@denix.org>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
	<1302018111-20799-4-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1302018111-20799-4-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 4/5] alsa-state: Add support for am45x-evm machine	type
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
X-List-Received-Date: Tue, 05 Apr 2011 16:42:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 05, 2011 at 10:41:50AM -0500, Chase Maupin wrote:
> * Added asound.conf file for am45x-evm machine type based on
>   the omap4430-panda asound.conf file.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  .../{omap4430-panda => am45x-evm}/asound.conf      |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  copy recipes/alsa/alsa-state/{omap4430-panda => am45x-evm}/asound.conf (100%)
> 
> diff --git a/recipes/alsa/alsa-state/omap4430-panda/asound.conf b/recipes/alsa/alsa-state/am45x-evm/asound.conf
> similarity index 100%
> copy from recipes/alsa/alsa-state/omap4430-panda/asound.conf
> copy to recipes/alsa/alsa-state/am45x-evm/asound.conf
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


