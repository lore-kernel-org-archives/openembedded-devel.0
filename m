Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q79Lx-0004pC-Jh
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:43:41 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ600HWXUD905T1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Apr 2011 11:41:33 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 55FE314AF5B; Tue,
	05 Apr 2011 12:41:33 -0400 (EDT)
Date: Tue, 05 Apr 2011 12:41:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110405164133.GF7168@denix.org>
References: <1302005404-21580-1-git-send-email-heroor@gmail.com>
	<1302005404-21580-4-git-send-email-heroor@gmail.com>
MIME-version: 1.0
In-reply-to: <1302005404-21580-4-git-send-email-heroor@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Siddharth Heroor <heroor@ti.com>
Subject: Re: [PATCH 4/4] ti-sysbios: Add version 6.31.04.27.
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
X-List-Received-Date: Tue, 05 Apr 2011 16:43:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 05, 2011 at 05:40:04PM +0530, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>

Sid,

Do you need to set a COMPATIBLE_MACHINE in the recipe, by any chance?

> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  recipes/ti/ti-sysbios_6.31.04.27.bb |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ti/ti-sysbios_6.31.04.27.bb
> 
> diff --git a/recipes/ti/ti-sysbios_6.31.04.27.bb b/recipes/ti/ti-sysbios_6.31.04.27.bb
> new file mode 100644
> index 0000000..619d6ff
> --- /dev/null
> +++ b/recipes/ti/ti-sysbios_6.31.04.27.bb
> @@ -0,0 +1,6 @@
> +require ti-sysbios.inc
> +
> +PV = "6_31_04_27"
> +
> +SRC_URI[sysbiosbin.md5sum] = "c82e1d3afc9e2d3e88b0e4137f152ed6"
> +SRC_URI[sysbiosbin.sha256sum] = "92337cf3197d2b7ffe2316f311cd163be7b470acbb032273894d7d39182f4227"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


