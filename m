Received: from smtpauth13.prod.mesa1.secureserver.net ([64.202.165.37])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Prgyb-0002lQ-B1
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 02:23:41 +0100
Received: (qmail 10236 invoked from network); 22 Feb 2011 01:22:22 -0000
Received: from unknown (209.242.7.132)
	by smtpauth13.prod.mesa1.secureserver.net (64.202.165.37) with ESMTP;
	22 Feb 2011 01:22:22 -0000
Message-ID: <4D630FD1.10205@mwester.net>
Date: Mon, 21 Feb 2011 19:22:25 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
	<1298214559-9650-4-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1298214559-9650-4-git-send-email-tom_rini@mentor.com>
Subject: Re: [PATCH 3/4] slugos: Pin gvfs to 1.6.6
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
X-List-Received-Date: Tue, 22 Feb 2011 01:23:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2/20/2011 9:09 AM, Tom Rini wrote:
> We're doing this since glib-2.0 is pinned.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  conf/distro/include/preferred-slugos-versions.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
> index cde3eb0..4f1033c 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -32,6 +32,7 @@ PREFERRED_VERSION_glib-2.0			?= "2.26.1"
>  PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"
>  PREFERRED_VERSION_gtk+				?= "2.18.6"
>  PREFERRED_VERSION_gtk+-native			?= "2.18.6"
> +PREFERRED_VERSION_gvfs				?= "1.6.6"
>  PREFERRED_VERSION_ipkg				?= "0.99.163"
>  PREFERRED_VERSION_ipkg-native			?= "0.99.163"
>  PREFERRED_VERSION_linux-libc-headers		?= "2.6.31"



