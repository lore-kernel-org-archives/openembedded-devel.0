Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 300 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Jun 2018 13:51:56 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7031171C9B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 13:51:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1530193917; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=Cdw47r4lbqvmzhUGEPXPVYIexvPkktt5cotFflPsP58=;
	b=XtCkUflrIrkhoJtHDTlS/V4b1QQ6uT1Lfbgp5WrpIZbqHICGaiLpDiogB4bwdmjM+9mXbW0j
	IQE1fmUhNwJ1siemYlMLrAophY06KfAYgwiCOKW/Jy9ygzPrDnx4fVWubd0xHeAu+zxKXn/V
	a8p1ZiePRnPoNcu+vNrtE+swHLQ=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mxa.mailgun.org with ESMTP id 5b34e6d0.7fe7b16f0e70-smtp-out-n03;
	Thu, 28 Jun 2018 13:46:56 -0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id 76-v6so12826753itx.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 06:46:56 -0700 (PDT)
X-Gm-Message-State: APt69E1kavr6R8GjBYvGsyxW2FLWyMkoXE/7AqSGB1ncLsHqNVzvihte
	pnNBm1TF2cRD5wy5kApUinif6xmeok8jR4oclgE=
X-Google-Smtp-Source: AAOMgpedHOYc20yIJk5HM/BXTRsulgBNhsvOIhFidB1pyQqpgAJJGQQRgJ3f0i3c9yYfUQMDxImFYKiOesgHBu3srjY=
X-Received: by 2002:a24:6ccb:: with SMTP id
	w194-v6mr1577613itb.10.1530193615472; 
	Thu, 28 Jun 2018 06:46:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:8c4e:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 06:46:54
	-0700 (PDT)
In-Reply-To: <1530193274-16477-1-git-send-email-derek@asterius.io>
References: <1530193274-16477-1-git-send-email-derek@asterius.io>
From: Derek Straka <derek@asterius.io>
Date: Thu, 28 Jun 2018 09:46:54 -0400
X-Gmail-Original-Message-ID: <CADNbA1oRJDSAG1P_f+eTPigN7XkizNjHYF59PXm7uvA05emiRQ@mail.gmail.com>
Message-ID: <CADNbA1oRJDSAG1P_f+eTPigN7XkizNjHYF59PXm7uvA05emiRQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-urllib3: update to version 1.23
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
X-List-Received-Date: Thu, 28 Jun 2018 13:51:56 -0000
Content-Type: text/plain; charset="UTF-8"

This one can be dropped.  Looks like it was already submitted

On Thu, Jun 28, 2018 at 9:41 AM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-urllib3.inc                |
> 4 ++--
>  .../python/{python-urllib3_1.22.bb => python-urllib3_1.23.bb}         | 0
>  .../python/{python3-urllib3_1.22.bb => python3-urllib3_1.23.bb}       | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-urllib3_1.22.bb =>
> python-urllib3_1.23.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-urllib3_1.22.bb =>
> python3-urllib3_1.23.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc
> b/meta-python/recipes-devtools/python/python-urllib3.inc
> index cf79926..288ed8b 100644
> --- a/meta-python/recipes-devtools/python/python-urllib3.inc
> +++ b/meta-python/recipes-devtools/python/python-urllib3.inc
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a0
> 67"
>
> -SRC_URI[md5sum] = "0da7bed3fe94bf7dc59ae37885cc72f7"
> -SRC_URI[sha256sum] = "cc44da8e1145637334317feebd728b
> d869a35285b93cbb4cca2577da7e62db4f"
> +SRC_URI[md5sum] = "1ad43e4b5ab7a0794c89dc057e1d7179"
> +SRC_URI[sha256sum] = "a68ac5e15e76e7e5dd2b8f94007233
> e01effe3e50e8daddf69acfd81cb686baf"
>
>  RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-certifi \
> diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.22.bb
> b/meta-python/recipes-devtools/python/python-urllib3_1.23.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-urllib3_1.22.bb
> rename to meta-python/recipes-devtools/python/python-urllib3_1.23.bb
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.22.bb
> b/meta-python/recipes-devtools/python/python3-urllib3_1.23.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-urllib3_1.22.bb
> rename to meta-python/recipes-devtools/python/python3-urllib3_1.23.bb
> --
> 2.7.4
>
>

