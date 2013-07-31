Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id C377161619
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2013 14:30:09 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id d10so840003vea.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2013 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=YujcWg3AeBuxtWaB/zs4VZZ6AgIaqFnMxdm3cs8fOs4=;
	b=YEwrMbRBoeM+zeIQV5D02AQ9+o3haJ1OOoCFQ9KVgUakGoEGmmRecEH90L9s5DUqMj
	S3MafHsnRqL7XDI9eCIDO4bsPwKdbia/AADYwx83JihkcbQ4xS4O31QlfWvvpK2pyGBy
	ppad7ibbgtapjbICPHiNoN0rErBbn7aj4UDyIbrf4zy1PqexxSQ4FQrAE1+l2X1SulLH
	q/PwVsQ8CYcz/v11pBdsC3XSsfCXaZSiJ9SgvPrpkxrIpkULMP7UqoB/KXFbxaRZ09s9
	jyG5mkG5bAwfCggQxv2Srx7fJff54DnvHO5uwvdSCgsb1VGtOtUt3daCrYZmeblSxtLj
	6AMg==
X-Received: by 10.220.101.81 with SMTP id b17mr11598711vco.79.1375281009734;
	Wed, 31 Jul 2013 07:30:09 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Wed, 31 Jul 2013 07:29:29 -0700 (PDT)
In-Reply-To: <1375237016-32362-1-git-send-email-b40290@freescale.com>
References: <1375237016-32362-1-git-send-email-b40290@freescale.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 31 Jul 2013 15:29:29 +0100
X-Google-Sender-Auth: p365n91ktqugfC2r5N0rzBz3n1c
Message-ID: <CANyK_8e61+0VN+odPV0YDX=xEhzxfk60hLszJzMXmN5n=1OMvA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe,v2][PATCH] iperf: Fix license
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
X-List-Received-Date: Wed, 31 Jul 2013 14:30:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 31 July 2013 03:16,  <b40290@freescale.com> wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
>      *the current version of Iperf has a false LICENSE set,
>          so fix license with the generic BSD license
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

Acked-by: Paul Barker <paul@paulbarker.me.uk>

> ---
>  meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
> index 8107701..4261c95 100644
> --- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
> +++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
>  HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
>  SECTION = "console/network"
> -LICENSE = "NewBSD"
> +LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
>
>  SRC_URI = " \
> --
> 1.7.5.4
>

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

