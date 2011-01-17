Received: from smtpauth19.prod.mesa1.secureserver.net ([64.202.165.30])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PeulK-0006C5-Fs
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 20:29:11 +0100
Received: (qmail 10631 invoked from network); 17 Jan 2011 19:21:52 -0000
Received: from unknown (209.242.7.132)
	by smtpauth19.prod.mesa1.secureserver.net (64.202.165.30) with ESMTP;
	17 Jan 2011 19:21:51 -0000
Message-ID: <4D3496CA.7010305@mwester.net>
Date: Mon, 17 Jan 2011 13:21:46 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <1295215324-10460-1-git-send-email-eric@eukrea.com>
	<1295215324-10460-2-git-send-email-eric@eukrea.com>
In-Reply-To: <1295215324-10460-2-git-send-email-eric@eukrea.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/4] slugos: prefer busybox 1.18.2
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
X-List-Received-Date: Mon, 17 Jan 2011 19:29:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/16/2011 4:02 PM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Cc: Mike Westerhof <mike@mwester.net>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  conf/distro/include/preferred-slugos-versions.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
> index 83c09e3..4649c90 100644
> --- a/conf/distro/include/preferred-slugos-versions.inc
> +++ b/conf/distro/include/preferred-slugos-versions.inc
> @@ -26,7 +26,7 @@ PREFERRED_VERSION_autoconf			?= "2.65"
>  PREFERRED_VERSION_autoconf-native		?= "2.65"
>  PREFERRED_VERSION_automake			?= "1.11.1"
>  PREFERRED_VERSION_automake-native		?= "1.11.1"
> -PREFERRED_VERSION_busybox			?= "1.18.1"
> +PREFERRED_VERSION_busybox			?= "1.18.2"
>  PREFERRED_VERSION_dbus				?= "1.4.1"
>  PREFERRED_VERSION_glib-2.0			?= "2.26.1"
>  PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"



