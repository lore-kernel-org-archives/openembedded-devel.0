Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 56E8D78BE0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 12:10:27 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id d189-v6so34085448oib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2018 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=74AlRxEJ+0ms/x4K9H4hUg6SHeNeaMllyLdrQ/TWAEY=;
	b=NS542NCDK+FKGwX4e+zG33jf5ZjBP7WRxvWvewlWZ/7tcMX5el7dbV2SGaLuIvr/yj
	nfN5UBuk6XhPSvLseB064jhqP37kd3XKAGsKjdtZXvXdca717Pxs57VUkKbm63s13LBF
	VTrG1AY+7LgqbpPf9QkBuFxF0ndtVtVJtyIYbwMrEu7nEtXJR6kH8ei9ge2bbWw5pe08
	7nZm3yO1bJlNU+x/R0LF0ZWN3qVrMggIDj/BC7qgAj9lgwbkXNqTFJULaD8KAvK60maY
	6l2BhFCzf9z0ARCykHCLj/ycoFK0XnVdlKzzguR9dZ+D45PxyKYlticXy8QOW1zjAHXq
	j4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=74AlRxEJ+0ms/x4K9H4hUg6SHeNeaMllyLdrQ/TWAEY=;
	b=tT/1Uva8yNH1FueZedXHxEwgcm2f8tQgjXJZdjSQQTFBhVAhelf+KEvEaG2BSxhj78
	IfgesyzIJczYHnUzypMjAp1PKdF8Omd5UlsxX6+dpOzXzPw+nfeB8a6saeRGXpekZ9Kl
	7smAa2ImthH/Tv7gRafiAEpbGCiX4Rh+7jA0eYTI4DgmeKJ9IL6pK5O2TGr/fHjHAuEw
	DbwdlQ6/zEGa+H7pDVBgCZ825kg9uIXaPBOK9UUmgE+vePcE4TpNpMzElaIeYP4vG/nh
	Bh1e0mYZzADbVCSqMtM8Xlt/JZNuuOm+pmYhvq9EutV1KO1aLeNhhEU6vmMsh/wVcA2T
	R3GQ==
X-Gm-Message-State: AOUpUlHzorN1CWRt+Ufw+Wi4SzrRBOs/hAAeyjI+Crs600sYR2NW47Eo
	yjVucKKCt3Ge9S8SntRJvrC7m7XbXcmwBdVkhRo=
X-Google-Smtp-Source: AAOMgpfjqNajpj4zK44t80iXNqVALxjrGw2z1SO49/lCrxnwfRUfzx9czhVPjlhOAICB+s95J+tOoCF+SP3CZifuy0M=
X-Received: by 2002:aca:dbc2:: with SMTP id
	s185-v6mr2975053oig.251.1533125428256; 
	Wed, 01 Aug 2018 05:10:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:1115:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 05:10:27 -0700 (PDT)
In-Reply-To: <5c982c67471b18dbdcd788f2b727a71583668f50.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
	<5c982c67471b18dbdcd788f2b727a71583668f50.1533107855.git.hongxu.jia@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 1 Aug 2018 14:10:27 +0200
Message-ID: <CALbNGRSYD4kzn8w-WDa-h7uuO5nSVUTV0Du-PAZE9ZBC0pSu+g@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 04/16] network-manager-applet: 1.8.10 -> 1.8.14
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
X-List-Received-Date: Wed, 01 Aug 2018 12:10:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 1, 2018 at 9:21 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...ork-manager-applet_1.8.10.bb => network-manager-applet_1.8.14.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.8.10.bb => network-manager-applet_1.8.14.bb} (86%)
>
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
> similarity index 86%
> rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
> rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
> index 91ae8b7..c9cbcc6 100644
> --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
> @@ -11,8 +11,8 @@ inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introsp
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> -SRC_URI[archive.md5sum] = "eae3be75e77ff1a7ea3174be25e62d03"
> -SRC_URI[archive.sha256sum] = "0adc4bfae8b49f7a1d929c22ef20933bd41fb4a8b458280f44c65f9e45b4c9c3"
> +SRC_URI[archive.md5sum] = "bcdd92645d36fc5778f27aeb2773509b"
> +SRC_URI[archive.sha256sum] = "ca9b1233721f700a7190b98eea69ce6d0ccf74fbfde173ac868a4ec7a78840cb"
>
>  PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
>  PACKAGECONFIG ??= ""
> @@ -42,6 +42,7 @@ FILES_${PN} += " \
>      ${datadir}/nm-applet/ \
>      ${datadir}/libnm-gtk/wifi.ui \
>      ${datadir}/libnma/wifi.ui \
> +    ${datadir}/metainfo \
${datadir}/appdata was replaced by ${datadir}/metainfo - so
${datadir}/appdata can be removed

Andreas

