Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id EADFB7804A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 17:28:01 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id v142so790148wmv.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aYj42WBKsTIgv0hXvUeyZXaW/RYK+fYOD8qdbyFi06U=;
	b=JtUtbYbV1jeTZwBOBFD9k7seys+CiY+lLKjVEHkcFAYwhBufHHvo9WlzLlIpQdWLN6
	67G3dIUDRs9MCxuSU/qy59nS2yGp4JPG2RR0UNrYPgxUskwqJ6forudsXMjvbnsn+o58
	k2Txra5jlHN+yNvENuZ2KxJyaQtU6izGMAPB9NWiYJ98z3HVB6NskXwFdHKLR3ys5sD2
	TWqTZrm7nseg9NoyYJPWudKW7GSKLhoPVvL8sRIHKwITTmsLBsTYqid0NyzkKmvX6I7A
	zjkFCL6HGmO0n3RvUZA0p1YO2FFcz+daTfebox8hlBcAOy0uz7QUyIuSXIyjnYH85930
	2P4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aYj42WBKsTIgv0hXvUeyZXaW/RYK+fYOD8qdbyFi06U=;
	b=OvxpsWvnYx9UYpnTRbYcuTSlkrncEM3Ty9gWFbxibB5ZHUFvFZeYx9Ak8uA7fuTezW
	FuhzydVgF8Skxqt3c0QBexKVq4/pOUjFW8LnqtGBg80KsoljtcC3hU8HyyHRxSaclLCR
	E1qymZVfMOprBrOmxbwfB8NRvCln1yo3aRoZIh0gmzawm5L7OLR2EcXwUiSTDoC586T4
	2riXuKg0pOk3jwp6xTQZkiYnT0u1l5KuAGlXtNfpd5GGDiJJGxkQLKQ4by4FKoluGgWK
	c5aNtZDb0xQvBpm+7+VqokQgoHxMRp/C/Qfis8xLkcg99hKo4wnV40LBwj1kQprckr02
	Lx6A==
X-Gm-Message-State: AHPjjUhfAbAiN3v8PcuLSoUojnRUG9uWFEVWXmYIJ2sON7YediFKlFWH
	uUSks1JdrHTVAHz1j0SKM6nen9OfVixT/YID9DY=
X-Google-Smtp-Source: AOwi7QDazRMJy3JpJhPrRdQHkWdTDx2E1QXbgq8+aCzxqC5kn5z5aeyhQUB8sM230iNFCjOkdm7OhWmF3zwLKaAGlQ4=
X-Received: by 10.28.138.148 with SMTP id m142mr1642147wmd.59.1505842082673;
	Tue, 19 Sep 2017 10:28:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Tue, 19 Sep 2017 10:28:01 -0700 (PDT)
In-Reply-To: <1505841334-2527-1-git-send-email-derek@asterius.io>
References: <1505841334-2527-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Sep 2017 19:28:01 +0200
Message-ID: <CA+chaQfnk1t0P+omcSxwBGYgVawF=gf5my3+t8ouebHsYy9LTw@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] po4a: update to version 0.52
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
X-List-Received-Date: Tue, 19 Sep 2017 17:28:02 -0000
Content-Type: text/plain; charset="UTF-8"

Not even SRCREV update? I think this rename doesn't do anything.

On Tue, Sep 19, 2017 at 7:15 PM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.52.bb} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-perl/recipes-perl/po4a/{po4a_0.49.bb => po4a_0.52.bb} (100%)
>
> diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
> b/meta-perl/recipes-perl/po4a/po4a_0.52.bb
> similarity index 100%
> rename from meta-perl/recipes-perl/po4a/po4a_0.49.bb
> rename to meta-perl/recipes-perl/po4a/po4a_0.52.bb
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

