Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MbPf8-0000xM-V0
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 04:03:31 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 4C5651B10C06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 01:50:20 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 03:46:22 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250114333-22259-1-git-send-email-oe-devel@rolf.leggewie.biz>
In-Reply-To: <1250114333-22259-1-git-send-email-oe-devel@rolf.leggewie.biz>
MIME-Version: 1.0
Message-Id: <200908130346.22163.holger+oe@freyther.de>
Subject: Re: [PATCH] base.bbclass: ftp.matrix.com.br no longer exists
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
X-List-Received-Date: Thu, 13 Aug 2009 02:03:34 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 12 August 2009 23:58:53 Rolf Leggewie wrote:
> ---

Signed-off-by:  Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Acked-By: Holger Freyther <zecke@selfish.org>


>  classes/base.bbclass |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index ef6c0ab..5363e5c 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -1279,7 +1279,6 @@ ${DEBIAN_MIRROR}	ftp://ftp.es.debian.org/debian/pool
>  ${DEBIAN_MIRROR}	ftp://ftp.se.debian.org/debian/pool
>  ${DEBIAN_MIRROR}	ftp://ftp.tr.debian.org/debian/pool
>  ${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu
> -${GNU_MIRROR}	ftp://ftp.matrix.com.br/pub/gnu
>  ${GNU_MIRROR}	ftp://ftp.cs.ubc.ca/mirror2/gnu
>  ${GNU_MIRROR}	ftp://sunsite.ust.hk/pub/gnu
>  ${GNU_MIRROR}	ftp://ftp.ayamura.org/pub/gnu


