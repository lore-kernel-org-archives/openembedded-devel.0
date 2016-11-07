Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CF1E862132
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Nov 2016 11:01:23 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id a197so174352221wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2016 03:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YuuQzzf2Fh4zFaO1A7yhu5X5aO69nFcwNM4F2wwkD0s=;
	b=K/GLFR/oOfeDll8t5Mnovf9S1BJnpdSDwn4goWnnir1ls6bxuSHUBK33oRBaqnu01+
	tc33ea3lSesu7RaDQdKdc+bYK9eVx79dOAHRTTBBQOnTSJ7OEXrqTnuaQzUaONn/L0pe
	3N87c7Q3gMCEk5/qR6122owfEB+8L37AKcyNbnfI/sEovLuy7WXCNFYJeUiWyn+wo3DM
	MJn04Q7d217ba7tbxnkS5mBaFfN6xFa6nQYPL4jm+ZAlrY+ykTR+pN280KhHqZSmTmQj
	gEE464d/B1kJbAtg9nUnSSQzbf6c+NW0PnFncpmxccegcXrlrgO6mjhVLIDbDAdAmSQ1
	zsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YuuQzzf2Fh4zFaO1A7yhu5X5aO69nFcwNM4F2wwkD0s=;
	b=e/nIEjOf2kRF2NaR7LCMDxsJgX6wubmpnNkKoP/HHjNqNuVcBxaEj/DFzLnUFHLyQr
	waHZBllRWTxk9eYl3qXu952fU1o1jslOhA90lzcU/X5bvQMOyG0d+HvFqez6Sfbdl/9W
	C/qtwB/ih608gurKhtwhAMoA80OR8xo2cRoB7PYjeCflh8EpsrZCYnKYytqD6Bd5jm3w
	j5itkLHtM5meb/YDfcXSNUpr7Atx/5bqiTjwAzrcZ1ma8mHnRy3Mg0Sy3Ae8eNuubTzK
	mVBPyb0ENHisNgbittA90LBKUefMIZf5AUvU7bSbtlsxlGKVUy5+wORK7aeYMzPBEj+/
	22zw==
X-Gm-Message-State: ABUngvf1OsKi+bM/h86Kb4rhD7EAqHa7I+0ujAyKvIsz7Uv4eF+/v4y5c5CbppTM/cn1BNjpfFBAYPRlPAQYSw==
X-Received: by 10.28.168.136 with SMTP id r130mr6777966wme.19.1478516484718;
	Mon, 07 Nov 2016 03:01:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.141.135 with HTTP; Mon, 7 Nov 2016 03:01:24 -0800 (PST)
In-Reply-To: <1478516350-31751-1-git-send-email-gizero@gmail.com>
References: <1478516350-31751-1-git-send-email-gizero@gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Mon, 7 Nov 2016 12:01:24 +0100
Message-ID: <CAC+thW08kDTEVhkOU=UuMcVik2k+Me0nGVHzoARaqSNbP5Ws6Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] ref-manual: fix typo
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
X-List-Received-Date: Mon, 07 Nov 2016 11:01:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 7, 2016 at 11:59 AM, Andrea Galbusera <gizero@gmail.com> wrote:

> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
>  documentation/kernel-dev/kernel-dev-advanced.xml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/kernel-dev/kernel-dev-advanced.xml
> b/documentation/kernel-dev/kernel-dev-advanced.xml
> index 9e15f17..ed982fb 100644
> --- a/documentation/kernel-dev/kernel-dev-advanced.xml
> +++ b/documentation/kernel-dev/kernel-dev-advanced.xml
> @@ -256,7 +256,7 @@
>              When stored outside of the recipe-space, the kernel Metadata
>              files reside in a separate repository.
>              The OpenEmbedded build system adds the Metadata to the build
> as
> -            a "ktype=meta" repository through the
> +            a "type=kmeta" repository through the
>              <ulink url='&YOCTO_DOCS_REF_URL;#var-
> SRC_URI'><filename>SRC_URI</filename></ulink>
>              variable.
>              As an example, consider the following
> <filename>SRC_URI</filename>
> --
> 1.9.1
>
>
Sorry, please ignore: sent out to the wrong list!

