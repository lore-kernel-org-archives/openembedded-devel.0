Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2570B6CBAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 20:58:46 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUD00CHSBLGIGA0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	08 Oct 2013 15:58:30 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D7B482009B; Tue,
	08 Oct 2013 16:58:27 -0400 (EDT)
Date: Tue, 08 Oct 2013 16:58:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20131008205827.GA26051@denix.org>
References: <1381256940-772-1-git-send-email-ml@communistcode.co.uk>
MIME-version: 1.0
In-reply-to: <1381256940-772-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: Re: [meta-oe][PATCH] libsoc: update to 0.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2013 20:58:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 08, 2013 at 07:29:00PM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack@embed.me.uk>
> 
> Signed-off-by: Jack Mitchell <jack@embed.me.uk>

Good stuff!

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta-oe/recipes-support/libsoc/{libsoc_0.3.bb => libsoc_0.4.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libsoc/{libsoc_0.3.bb => libsoc_0.4.bb} (87%)
> 
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb b/meta-oe/recipes-support/libsoc/libsoc_0.4.bb
> similarity index 87%
> rename from meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> rename to meta-oe/recipes-support/libsoc/libsoc_0.4.bb
> index 1bf2782..da3c442 100644
> --- a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.4.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
>  
>  inherit autotools
>  
> -SRCREV = "0764ee52b590d5ccb4bd4698f0011496b536ed70"
> +SRCREV = "f6827b7b5c581b586d3bcc4813d418101ae1e85b"
>  SRC_URI = "git://github.com/jackmitch/libsoc.git"
>  
>  S = "${WORKDIR}/git"
> -- 
> 1.8.4
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

