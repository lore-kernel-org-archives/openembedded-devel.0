Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OHJZC-0004SI-6e
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 18:34:51 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L3100F1RCI6H1W0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	26 May 2010 11:30:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B4E2714AF60; Wed,
	26 May 2010 12:30:05 -0400 (EDT)
Date: Wed, 26 May 2010 12:30:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100526163005.GF23464@denix.org>
References: <1274879375-19626-1-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-2-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-3-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1274879375-19626-3-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: Re: [PATCHv2 3/7] features: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 16:34:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 26, 2010 at 08:09:31AM -0500, Chase Maupin wrote:
> * Fixed up typos and other errors in the documentation.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  docs/usermanual/chapters/features.xml |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/usermanual/chapters/features.xml b/docs/usermanual/chapters/features.xml
> index 3cbf1d8..880b75c 100644
> --- a/docs/usermanual/chapters/features.xml
> +++ b/docs/usermanual/chapters/features.xml
> @@ -22,9 +22,9 @@
>      <para>Run-time Dependencies (<command>RDEPENDS</command>) will be added
>      when packaging the software. They should only contain the minimal
>      dependencies to run the program. OpenEmbedded will analyze each packaged
> -    binary and search for <command>SO_NEEDED</command> libraries. The
> -    libraries are absolutely required by the program then OpenEmbedded is
> -    searching for packages that installs these libraries. these packages are
> +    binary and search for <command>SO_NEEDED</command> libraries. These
> +    libraries are absolutely required by the program so OpenEmbedded will
> +    search for packages that install these libraries. These packages are
>      automatically added to the <command>RDEPENDS</command>. As a packager you
>      don't need to worry about shared libraries anymore they will be added
>      automatically.</para>
> @@ -52,9 +52,9 @@ BBFILE_PRIORITY_local = "10"
>      <title>Task-base <anchor id="task-base" /></title>
>  
>      <para>Task-base is new way of creating basic root filesystems. Instead of
> -    having each machine setting a ton of duplicate variables, this allow a
> +    having each machine setting a ton of duplicate variables, this allows a
>      machine to specify its features and <command>task-base</command> builds it
> -    a customised package based on what the machine needs along with what the
> +    a customized package based on what the machine needs along with what the
>      distro supports.</para>
>  
>      <para>To illustrate, the distro config file can say: <screen>
> -- 
> 1.6.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


