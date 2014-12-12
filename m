Return-Path: <net147@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 155857232C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 12:08:39 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id v10so7051984pde.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 04:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=JO+uRX6qrJhpGs0lPovjxGaKTqLPaqCcAc3eM079zc8=;
	b=b5zlKpjDf5YKuKqbxps+FgCXz2iK8Wn6LLdtj/yfnvgaEhnYKgL9uZMGBNAF0xcL6Z
	4Ul7TBQSKy7494zxM8qNgisjdA9ItmD1eCpC9wpZj5UXugAq7RYtoVbGcY2DEh6jvUzJ
	w1h2vT2wTNSrxySAO9fnEH6P0Ot7xhQGu8s8lkd7FlxDbBgYldLLsJ5lAqlpk4yfyPSY
	RY1bfNYmWDk16AMpOkW98iiawZxz3O24Q2X0VugU5Is78jafzW2+yoNkWENnbMfAsXRA
	N0N++Fn6WFK3EoWzM+XVd+vGtWWek+qHCLcklcLlFbtPYQxPGzzfJVvaFogzu3H9k3L7
	OJmg==
X-Received: by 10.70.124.200 with SMTP id mk8mr323164pdb.147.1418386120181;
	Fri, 12 Dec 2014 04:08:40 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id nh4sm1435341pdb.37.2014.12.12.04.08.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Dec 2014 04:08:39 -0800 (PST)
Message-ID: <548ADAC1.1080407@gmail.com>
Date: Fri, 12 Dec 2014 23:08:33 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <1418378316-26412-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1418378316-26412-1-git-send-email-schnitzeltony@googlemail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-qt5] qttools-native 5.4.0: align source checksums
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
X-List-Received-Date: Fri, 12 Dec 2014 12:08:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/2014 8:58 PM, Andreas Müller wrote:
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   recipes-qt/qt5/qttools-native_5.4.0.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-qt/qt5/qttools-native_5.4.0.bb b/recipes-qt/qt5/qttools-native_5.4.0.bb
> index 3efed85..f9384e9 100644
> --- a/recipes-qt/qt5/qttools-native_5.4.0.bb
> +++ b/recipes-qt/qt5/qttools-native_5.4.0.bb
> @@ -1,5 +1,5 @@
>   require qt5-${PV}.inc
>   require ${PN}.inc
>   
> -SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
> -SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
> +SRC_URI[md5sum] = "3de5923257b365526856094d7da0ad85"
> +SRC_URI[sha256sum] = "5a85a096ffd30463781dc3871ad9640a510eba0086188c7943d23adc3660741a"
Signed-off-by: Jonathan Liu <net147@gmail.com>

Looks like I forgot to update checksums for that recipe.
Thanks.

