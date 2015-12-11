Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 537AA6612D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:28:11 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id n186so20279048wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 01:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=By0WoYO3Qvimq46TuS6OTHrVm07vdsQSAH+gt6brapk=;
	b=F3BJd53Dkj5FkeoZ54JGGx9rt/cK7ohe4RAe9JH/E6D1KSGrbHTp6QvHsvYIFFupVK
	TTlzpgced7zepneuIzjvbB6v7Pn13JTgEKsuZsCwCtwWYB0hFMRllrNHjsy5aLB8IgDA
	4Erwm5FJPDjDnXF7NgR52Cq9/+HV43j0YHywMIKtzMagetwXsQChMbLWt0GLJy/kEW7Z
	E3i/QOikt810VXgCqXVHduu05PHnzsR1tWx1IDn7FaCsNqOALHSeQmb0bxFHmHILLOP5
	+AMfksKA2iH3sChUxtQEoAYYJmne4G+t0jGMaqLvk2fGuomcgX3XoPU2HDu6w+df7i8P
	ELJA==
MIME-Version: 1.0
X-Received: by 10.194.223.39 with SMTP id qr7mr17750753wjc.63.1449826091844;
	Fri, 11 Dec 2015 01:28:11 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Fri, 11 Dec 2015 01:28:11 -0800 (PST)
In-Reply-To: <1449815135-28537-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1449815135-28537-1-git-send-email-fan.xin@jp.fujitsu.com>
Date: Fri, 11 Dec 2015 10:28:11 +0100
Message-ID: <CA+chaQcS0qKyyieAs+LunvTCgeLRr++u+jxeypQrv_WVXsBVjA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH] curl: upgrade to 7.45
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Dec 2015 09:28:15 -0000
Content-Type: text/plain; charset=UTF-8

wrong ML

On Fri, Dec 11, 2015 at 7:25 AM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  meta/recipes-support/curl/{curl_7.44.0.bb => curl_7.45.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.44.0.bb => curl_7.45.0.bb} (93%)
>
> diff --git a/meta/recipes-support/curl/curl_7.44.0.bb
> b/meta/recipes-support/curl/curl_7.45.0.bb
> similarity index 93%
> rename from meta/recipes-support/curl/curl_7.44.0.bb
> rename to meta/recipes-support/curl/curl_7.45.0.bb
> index f6d350e..a7ed778 100644
> --- a/meta/recipes-support/curl/curl_7.44.0.bb
> +++ b/meta/recipes-support/curl/curl_7.45.0.bb
> @@ -14,8 +14,8 @@ SRC_URI = "
> http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>  #
>  SRC_URI += " file://configure_ac.patch"
>
> -SRC_URI[md5sum] = "6b952ca00e5473b16a11f05f06aa8dae"
> -SRC_URI[sha256sum] =
> "1e2541bae6582bb697c0fbae49e1d3e6fad5d05d5aa80dbd6f072e0a44341814"
> +SRC_URI[md5sum] = "62c1a352b28558f25ba6209214beadc8"
> +SRC_URI[sha256sum] =
> "65154e66b9f8a442b57c436904639507b4ac37ec13d6f8a48248f1b4012b98ea"
>
>  inherit autotools pkgconfig binconfig multilib_header
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

