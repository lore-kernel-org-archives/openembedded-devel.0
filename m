Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QKwt0-0004Dy-Eg
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:14:50 +0200
Received: from p4fc7654c.dip.t-dialin.net ([79.199.101.76]
	helo=excalibur.local) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QKwqG-0003si-Ey by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Fri, 13 May 2011 20:12:02 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>)
	id 1QKwqE-0002DE-Dx; Fri, 13 May 2011 20:11:58 +0200
Date: Fri, 13 May 2011 20:11:58 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID: <20110513181158.GH29302@excalibur.local>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-7-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1305290588-7057-7-git-send-email-GNUtoo@no-log.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH 07/12] linux-bug20-linaro: use newer srcrev
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
X-List-Received-Date: Fri, 13 May 2011 18:14:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-05-13 at 14:43, Denis 'GNUtoo' Carikli wrote:
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Stefan Schmidt <stefan@buglabs.net>

> ---
>  recipes/linux/linux-bug20-linaro_2.6.35.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/linux/linux-bug20-linaro_2.6.35.bb b/recipes/linux/linux-bug20-linaro_2.6.35.bb
> index 6f1bafe..8b8a6ef 100644
> --- a/recipes/linux/linux-bug20-linaro_2.6.35.bb
> +++ b/recipes/linux/linux-bug20-linaro_2.6.35.bb
> @@ -5,9 +5,9 @@ KERNEL_IMAGETYPE = "uImage"
>  
>  COMPATIBLE_MACHINE = "bug20"
>  
> -PR = "r0"
> +PR = "r1"
>  
> -SRCREV = "be4f840306ef858cffc182cde38714f9423bdeb3"
> +SRCREV = "42f43f4bd4a0b612b7bcad3414e42a507282fe8b"
>  
>  
>  SRC_URI = "git://github.com/buglabs/bug20-2.6.35-linaro.git;branch=master;protocol=git"
> -- 
> 1.7.0.4
> 


