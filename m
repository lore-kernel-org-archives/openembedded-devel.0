Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id A7B59660EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 16:16:03 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7Z00DLDP67A0T1@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	30 Jun 2014 11:15:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EC06C201B1; Mon,
	30 Jun 2014 12:15:42 -0400 (EDT)
Date: Mon, 30 Jun 2014 12:15:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140630161542.GM1580@denix.org>
References: <1403713638-437-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1403713638-437-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "Balasubramanian, Aparna" <aparnab@ti.com>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [daisy][PATCH] rng-tools: Update rng-tools version to 4
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
X-List-Received-Date: Mon, 30 Jun 2014 16:16:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ping?

On Wed, Jun 25, 2014 at 12:27:18PM -0400, Denys Dmytriyenko wrote:
> From: "Balasubramanian, Aparna" <aparnab@ti.com>
> 
> Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> [Backport from meta-oe/master c992b1ba176af7071416c405df03633ef7bf8e20]
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb} (84%)
> 
> diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
> similarity index 84%
> rename from meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> rename to meta-oe/recipes-support/rng-tools/rng-tools_4.bb
> index 7803b28..f620d8a 100644
> --- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> +++ b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
> @@ -7,8 +7,8 @@ SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${P}.tar.gz \
>             file://init \
>             file://default"
>  
> -SRC_URI[md5sum] = "63d503191eabed630324c104cc024475"
> -SRC_URI[sha256sum] = "1126f0ecc8cab3af14a562cddc5d8ffeef47df7eba34a7aadcdee35a25ec2b1e"
> +SRC_URI[md5sum] = "ae89dbfcf08bdfbea19066cfbf599127"
> +SRC_URI[sha256sum] = "b71bdfd4222c05e8316001556be90e1606f2a1bac3efde60153bd84e873cc195"
>  
>  inherit autotools update-rc.d
>  
> -- 
> 2.0.0
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

