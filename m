Received: from smtpauth21.prod.mesa1.secureserver.net ([64.202.165.38])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1QXwnK-00056Y-SA
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Jun 2011 16:46:43 +0200
Received: (qmail 21850 invoked from network); 18 Jun 2011 14:36:31 -0000
Received: from unknown (209.242.7.165)
	by smtpauth21.prod.mesa1.secureserver.net (64.202.165.38) with ESMTP;
	18 Jun 2011 14:36:31 -0000
Message-ID: <4DFCB7E4.8030002@mwester.net>
Date: Sat, 18 Jun 2011 09:36:20 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <1308338871-31968-1-git-send-email-eric@eukrea.com>
	<1308338871-31968-3-git-send-email-eric@eukrea.com>
In-Reply-To: <1308338871-31968-3-git-send-email-eric@eukrea.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/4] slugos: prefer busybox 1.18.5
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
X-List-Received-Date: Sat, 18 Jun 2011 14:46:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/17/2011 2:27 PM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Cc: Mike Westerhof <mike@mwester.net>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  conf/distro/include/preferred-slugos-versions.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
> index b864dac..2121edb 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -24,7 +24,7 @@ PREFERRED_VERSION_autoconf			?= "2.65"
>  PREFERRED_VERSION_autoconf-native		?= "2.65"
>  PREFERRED_VERSION_automake			?= "1.11.1"
>  PREFERRED_VERSION_automake-native		?= "1.11.1"
> -PREFERRED_VERSION_busybox			?= "1.18.4"
> +PREFERRED_VERSION_busybox			?= "1.18.5"
>  PREFERRED_VERSION_dbus				?= "1.4.1"
>  PREFERRED_VERSION_glib-2.0			?= "2.26.1"
>  PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"



