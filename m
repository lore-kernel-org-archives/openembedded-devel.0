Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MIhUk-0008FF-Pb
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 13:15:26 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MIhK7-0001ii-Rp
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 11:04:27 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:04:27 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:04:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Jun 2009 13:04:15 +0200
Message-ID: <h1noff$af4$1@ger.gmane.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-12-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245664435-30183-12-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 035/125] atd: fix spelling of LICENSE
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
X-List-Received-Date: Mon, 22 Jun 2009 11:15:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-06-09 11:53, Marcin Juszkiewicz wrote:
> From: Rolf Leggewie<oe-devel@rolf.leggewie.biz>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/atd/atd_0.70.bb |    4 ++--
>   recipes/atd/atd_0.80.bb |    4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/atd/atd_0.70.bb b/recipes/atd/atd_0.70.bb
> index 9862fac..7f2193d 100644
> --- a/recipes/atd/atd_0.70.bb
> +++ b/recipes/atd/atd_0.70.bb
> @@ -1,10 +1,10 @@
>   DESCRIPTION = "Lightweight At Daemon"
>   SECTION = "base"
> -LICENSE = "GPLV2"
> +LICENSE = "GPLv2"
>   RCONFLICTS = "at"
>   RREPLACES = "at"
>
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI = "${HANDHELDS_CVS};module=apps/atd;tag=ATD-0_70 \
>   			file://atd-startup.patch;patch=1;pnum=0"
> diff --git a/recipes/atd/atd_0.80.bb b/recipes/atd/atd_0.80.bb
> index f3adbd7..23cf7c4 100644
> --- a/recipes/atd/atd_0.80.bb
> +++ b/recipes/atd/atd_0.80.bb
> @@ -1,10 +1,10 @@
>   DESCRIPTION = "Lightweight At Daemon"
>   SECTION = "base"
> -LICENSE = "GPLV2"
> +LICENSE = "GPLv2"
>   RCONFLICTS = "at"
>   RREPLACES = "at"
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://projects.linuxtogo.org/frs/download.php/222/${P}.tar.gz"
>




