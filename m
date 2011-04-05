Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q79Mn-0004wZ-1B
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:44:33 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ600852UDWFNG2@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Apr 2011 11:42:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 24F3414AF5B; Tue,
	05 Apr 2011 12:41:56 -0400 (EDT)
Date: Tue, 05 Apr 2011 12:41:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110405164156.GG7168@denix.org>
References: <1302005404-21580-1-git-send-email-heroor@gmail.com>
MIME-version: 1.0
In-reply-to: <1302005404-21580-1-git-send-email-heroor@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Siddharth Heroor <heroor@ti.com>
Subject: Re: [PATCH 1/4] ti-sysbios: Add missing License field.
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
X-List-Received-Date: Tue, 05 Apr 2011 16:44:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 05, 2011 at 05:40:01PM +0530, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>
> 
> * Sys/Bios is released under a BSD license.
> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes/ti/ti-sysbios.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/ti/ti-sysbios.inc b/recipes/ti/ti-sysbios.inc
> index cf45c37..84a76a4 100644
> --- a/recipes/ti/ti-sysbios.inc
> +++ b/recipes/ti/ti-sysbios.inc
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "TI SYS/BIOS v6 Kernel"
>  HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios"
>  SECTION = "devel"
> +LICENSE = "BSD"
>  
>  require ti-paths.inc
>  require ti-staging.inc
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


