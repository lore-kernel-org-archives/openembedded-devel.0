Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MIhtS-0006Fq-S4
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 13:40:58 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MIhis-0002iG-FN
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 11:30:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:30:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Jun 2009 13:04:32 +0200
Message-ID: <h1nog0$af4$3@ger.gmane.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-10-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245664435-30183-10-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 033/125] m4: 1.4.11 and 1.4.12 are GPLv3
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
X-List-Received-Date: Mon, 22 Jun 2009 11:40:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-06-09 11:53, Marcin Juszkiewicz wrote:
> From: Tom Rini<trini@embeddedalley.com>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/m4/m4_1.4.11.bb |    2 +-
>   recipes/m4/m4_1.4.12.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/m4/m4_1.4.11.bb b/recipes/m4/m4_1.4.11.bb
> index 77d8e82..e267626 100644
> --- a/recipes/m4/m4_1.4.11.bb
> +++ b/recipes/m4/m4_1.4.11.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro \
>   processor."
> -LICENSE = "GPL"
> +LICENSE = "GPLv3"
>   SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
>   S = "${WORKDIR}/m4-${PV}"
>
> diff --git a/recipes/m4/m4_1.4.12.bb b/recipes/m4/m4_1.4.12.bb
> index 77d8e82..e267626 100644
> --- a/recipes/m4/m4_1.4.12.bb
> +++ b/recipes/m4/m4_1.4.12.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro \
>   processor."
> -LICENSE = "GPL"
> +LICENSE = "GPLv3"
>   SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
>   S = "${WORKDIR}/m4-${PV}"
>




