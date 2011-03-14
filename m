Received: from p3plsmtpa01-05.prod.phx3.secureserver.net ([72.167.82.85])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PyxkD-0005Ut-II
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 03:43:19 +0100
Received: (qmail 23032 invoked from network); 14 Mar 2011 02:41:08 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-05.prod.phx3.secureserver.net (72.167.82.85) with ESMTP;
	14 Mar 2011 02:41:07 -0000
Message-ID: <4D7D803B.4020201@mwester.net>
Date: Sun, 13 Mar 2011 21:40:59 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300035425-15984-1-git-send-email-eric@eukrea.com>
	<1300035425-15984-3-git-send-email-eric@eukrea.com>
In-Reply-To: <1300035425-15984-3-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 3/4] slugos: prefer busybox 1.18.4
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
X-List-Received-Date: Mon, 14 Mar 2011 02:43:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/13/2011 11:57 AM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Cc: Mike Westerhof <mike@mwester.net>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  conf/distro/include/preferred-slugos-versions.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
> index b1b3255..b864dac 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -24,7 +24,7 @@ PREFERRED_VERSION_autoconf			?= "2.65"
>  PREFERRED_VERSION_autoconf-native		?= "2.65"
>  PREFERRED_VERSION_automake			?= "1.11.1"
>  PREFERRED_VERSION_automake-native		?= "1.11.1"
> -PREFERRED_VERSION_busybox			?= "1.18.3"
> +PREFERRED_VERSION_busybox			?= "1.18.4"
>  PREFERRED_VERSION_dbus				?= "1.4.1"
>  PREFERRED_VERSION_glib-2.0			?= "2.26.1"
>  PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"



