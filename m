Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 854B17F893
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 15:54:45 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m4so18046374qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 07:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MFLZL+canwr5VP6aP2UJwFhygXlYSHR+CClpWOPVn/w=;
	b=H0Uh9Vhj9FNNUzA8p4Fiiov16EthWKmH7z9+qKuTlrIsHzApYsCnDxkP+SDnsxIFP1
	O1DF13FNbVyWJmJqrNaV5Jsf63zyOlL0vDlniYDz6KwAl6e3wgW+ep5n1bH3qy4AKuI0
	0NC2AywQD4qnW7X/pkcW9+5dcQtSgQzj/lBsxElWgP6drG5xaLbb8pwZTTojMfjltwxc
	q7UOkwuAea2reOJcHeG1cGk9IHnv9hf+nru7etRaqyDUPQRX7LVPsbulvxw9EUZzrXck
	Vr3D16UhuSrxoAOeFvV2C45K4cFQnyPzoGEV8RHpwN5AH2HLaZ1sQS0O8SKq6ZH5r+zz
	MjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MFLZL+canwr5VP6aP2UJwFhygXlYSHR+CClpWOPVn/w=;
	b=hBpBHm1Latg7ao8o89OD4ES0ir4zevI/FYiEexWQllBohAYNIcFVxp+vlczzQsa8ez
	PNE8gBDO87NL72RjkF4MsO6R5Kx0zlT8Y9G5gEb619MKC4s8xuRgprMR8Zc6r+jDzJtv
	wZDqmUNcdBYNIykX5SsGQK0gmhu9H7KD/8JXJ6aDW0gSlxGf9yBV/HHvw6LhAk8SS7bS
	q+QRShOjwYx7jkDHv7M6iji3y3ywfg1aC+YUoaydy7aiM8+6FV3M5o1oM9w0WRa1z75L
	ROVuu8hTn/pqaBJ8coER2U9gNr2s81JGCivZ+tqVMf3NZ5U/6xZ/+jd6R1LdC9TsvTxm
	pj/A==
X-Gm-Message-State: APjAAAV40f2hc6n1zQhziyVRK1JAbUm/NgwPuF8XcpnS3l9xJbvh+/5v
	OejDmFqJbQpMICUcpWNOTvyzQsKpmgFkDgmWbDY=
X-Google-Smtp-Source: APXvYqzPEhfXPDwuuAoDC9dx8ZDSnG82wuMf7Ja9x89OJtulmIiKtX/KULK+4tAvZB6tGkxdrdfjpqRsak+5pAmkG7U=
X-Received: by 2002:a37:84b:: with SMTP id 72mr22977366qki.337.1572882886067; 
	Mon, 04 Nov 2019 07:54:46 -0800 (PST)
MIME-Version: 1.0
References: <1572850027-118636-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572850027-118636-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Nov 2019 07:54:35 -0800
Message-ID: <CAMKF1sq8CKUSuosD7iBEr-apueF-x-ErFh-ucF6rgj0ZWe5cWg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ledmon: Modify the Upstream-Status to Submitted.
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
X-List-Received-Date: Mon, 04 Nov 2019 15:54:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 3, 2019 at 7:07 PM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch      |
> 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
> b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
> index b65f1a7..753957d 100644
> ---
> a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
> +++
> b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] Don't build with -Werror to fix compile
> error.
>  | amd_sgpio.c: In function '_write_amd_register':
>  | amd_sgpio.c:558:18: error: taking address of packed member of 'struct
> amd_register' may result in an unaligned pointer value
> [-Werror=address-of-packed-member]
>
> -Upstream-Status: Pending
> +Upstream-Status: Submitted


Please add link as well to upstream pull request

>
>
>  Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>  ---
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

