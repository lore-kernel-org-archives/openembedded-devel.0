Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD03719C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 16:33:33 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id x7so16098139wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 08:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DvPBRpPEzZokFZnIZlKsGGqqzvAacHAe4EADwUrmBSA=;
	b=R/GiJBzmvgNcCSSqzgH8ACgzGlIACwvZRq+9k37kj/iEyJmIlRjhF8mUJu/cSwBAqD
	6u4zFSTDFyRfI9B1z+Iheu4e8FI5JmZ05pAPcER5Dv1FbfOVAL+IIcxSdiZsWAaklSCD
	RiW+YX2HEo4fkf3A//pmz8uA/lQ+sPPtOfQUPZm4VMtDPbmb5RleYEZmmoCskDmNYlhy
	ZZsOE0/y4FsRRZ8b9QmORxHEYg9/6kpTTXdpMoWXV35mEQ5bocDTB+Z1QIQXg/TqRqsa
	iczp9VtCb/apRmd2eldV36lnOPo0z/wcSeFEhNFDBtvRQ23T/RpzrFz/euQvKA4G1gHh
	GHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DvPBRpPEzZokFZnIZlKsGGqqzvAacHAe4EADwUrmBSA=;
	b=iVi9sQNTFolFBYlLcU/SLDNLi7VkJjtUMl4GDyUvy9qjUQEAEOKB37s3vzTA20Ixp/
	Q+dNTEpz0979RW4EDGRlbTqn1L71rJT9N2qCvZnRRk4RMSQFhQ56CB8LfRV722f7JneB
	qd6dTLhyXOn7R6pE2m3/5hdPXc027MRmp/MB4n2YBGIgqb44RGqj3fk37nA6oO9evvqF
	YHMA19E2EKrrxYgZCiR2g7mqGjqFntCswGRgIdFNI/Meqzlf0ht1vatG/QwcGAGElDxp
	8pFbxer0KYW+ulEQ70KD/hefG8uGtMvB4EQTMYwnXbsvHBCctFTbrKHG4drnDE5sH+6w
	ef4g==
X-Gm-Message-State: APf1xPC6KgoS/97mKE0wgrIQD+X/uB4pZ/q/zbRexUOJbi5ZD3Nlzjpk
	l8rycWo5l01XD1YvRrjpMB4DKmGE/VvYUTGW4zY=
X-Google-Smtp-Source: AG47ELsLR7G6EKz/k/7JnnSgRIPmLCvLvyWCXl/GSgnORXU//U67ra8lpJu4EODEvU0XyfyTQD2FNN4Qc564LjuYcG4=
X-Received: by 10.28.196.200 with SMTP id u191mr9028868wmf.17.1519662814374;
	Mon, 26 Feb 2018 08:33:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Mon, 26 Feb 2018 08:33:33 -0800 (PST)
In-Reply-To: <1519637845-8644-1-git-send-email-timo.jyrinki@gmail.com>
References: <1519637845-8644-1-git-send-email-timo.jyrinki@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Feb 2018 17:33:33 +0100
Message-ID: <CA+chaQcr-xj-Ob24Npf8diTQ-F+zbywBzzBW9fhb-TG_1gomAQ@mail.gmail.com>
To: Timo Jyrinki <timo.jyrinki@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtlocation: Add licenses used under mapboxgl.
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
X-List-Received-Date: Mon, 26 Feb 2018 16:33:33 -0000
Content-Type: text/plain; charset="UTF-8"

Update LIC_FILES_CHKSUM to cover license files from mapboxgl.

On Mon, Feb 26, 2018 at 10:37 AM, Timo Jyrinki <timo.jyrinki@gmail.com>
wrote:

> These licenses are in use in the fetched mapboxgl submodule but not
> currently listed in the recipe: Apache-2.0, MIT, openssl and BSL-1.0.
>
> Signed-off-by: Timo Jyrinki <timo.jyrinki@gmail.com>
> ---
>  recipes-qt/qt5/qtlocation_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_
> git.bb
> index fce37b8..f6d3e09 100644
> --- a/recipes-qt/qt5/qtlocation_git.bb
> +++ b/recipes-qt/qt5/qtlocation_git.bb
> @@ -1,7 +1,7 @@
>  require qt5.inc
>  require qt5-git.inc
>
> -LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1
> | LGPL-3.0) | GPL-2.0 | The-Qt-Company-Commercial"
> +LICENSE = "Apache-2.0 & MIT & openssl & BSL-1.0 & GFDL-1.3 & BSD &
> (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 |
> The-Qt-Company-Commercial"
>  LIC_FILES_CHKSUM = " \
>      file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
>      file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

