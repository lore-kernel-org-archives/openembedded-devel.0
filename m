Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MIhVJ-0008GH-RE
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 13:16:01 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MIhKh-0001lb-38
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 11:05:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:05:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Jun 2009 11:05:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Jun 2009 13:04:50 +0200
Message-ID: <h1nogi$af4$6@ger.gmane.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-7-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245664435-30183-7-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 030/125] libiconv: 1.12 has GPLv3 binaries LGPLv2.1 libraries
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
X-List-Received-Date: Mon, 22 Jun 2009 11:16:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-06-09 11:53, Marcin Juszkiewicz wrote:
> From: Tom Rini<trini@embeddedalley.com>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/libiconv/libiconv.inc     |    1 -
>   recipes/libiconv/libiconv_1.12.bb |    1 +
>   2 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/libiconv/libiconv.inc b/recipes/libiconv/libiconv.inc
> index c815210..c8bc290 100644
> --- a/recipes/libiconv/libiconv.inc
> +++ b/recipes/libiconv/libiconv.inc
> @@ -4,7 +4,6 @@ HOMEPAGE = "http://www.gnu.org/software/libiconv"
>   SECTION = "libs"
>   PRIORITY = "optional"
>   NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
> -LICENSE = "LGPL"
>
>   SRC_URI = "ftp://ftp.gnu.org/pub/gnu/libiconv/libiconv-${PV}.tar.gz \
>   	   file://autotools.patch;patch=1 \
> diff --git a/recipes/libiconv/libiconv_1.12.bb b/recipes/libiconv/libiconv_1.12.bb
> index 129eb13..db53178 100644
> --- a/recipes/libiconv/libiconv_1.12.bb
> +++ b/recipes/libiconv/libiconv_1.12.bb
> @@ -1,4 +1,5 @@
>   require libiconv.inc
> +LICENSE = "GPLv3 LGPLv2"
>
>   PROVIDES = "virtual/libiconv"
>   PR = "r1"




