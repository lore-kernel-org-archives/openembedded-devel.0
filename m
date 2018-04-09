Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 28AA86E672;
	Mon,  9 Apr 2018 08:50:54 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id v64-v6so7728801otb.13;
	Mon, 09 Apr 2018 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y8YjRd1mj4tXsNaPhBMJf21FPEMchOLc+OOsK5l39pA=;
	b=dUBVFrBf2NaHY4Wwh7QGxTATpLDs9FCQdWKWwzefCBJPeHztKA0Sz31+qr2pRq26m8
	tWXmUte5xFc19tTxziBcJ/wwZEpUkx914gfjwEDf+epbEmau1uHxrG0yKK21V2GuWurj
	hmN1MaPGtXWU+N+vut30VMHMQ11bDLzyxb4NTODcpkN9Iec/B+5RjlZ6Uqpi0YgPckvX
	cPulojrMfw4EGiSHCHv+e+I6sTxQnZJrnvNEXoyF9VyHl+jByxYN3DL2yx/OrC1+at7r
	n0oZ9IxobhnE8RYIyViXP1d7AfkdltvBlL0j1N49ed3NKPDlD2nt4TmP7kHOehqCgsxN
	aeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y8YjRd1mj4tXsNaPhBMJf21FPEMchOLc+OOsK5l39pA=;
	b=U2X+XpkQq19XTiJeaWiNRUCUpvWkJiL3YPQy3oLZkLC7m93i3sVrWL/vWGdSCLNJZG
	wLLptKj2KX/l54EYvlrUojQ8JWMZz+HtYmm/8U9MuePnZp/dWjFgF4WFNncn36QYdB5i
	lnjVyz/1fyzrT8ykqFiXx11Oppvd6lxekFP0W4Nmzs3Pa6A0g+MWjlMFWIF5oX9UVRk9
	Aecpht1x0eTxdRf12l+DLCyDhis8bZtUrGRcmSZzmCaRzEdWlksMz3Q2FrhH/6JsLMUc
	8NjGtg9Mh0ClxovrM+0nprnUEg3cSetFfnxmkPwXu/oweKB6kraWbcmHIg0yZL4Wb8k4
	um5A==
X-Gm-Message-State: ALQs6tCtqa+E/1OUHblXTGPjfahYUWEH2K1oRTqGnZYPCZ7/gE64r4Dm
	VaN7lauVCrpmivEQurJ1weCOgw0hf3cwkX4rEug=
X-Google-Smtp-Source: AIpwx48xSrDSH7c+nFGITsMBBffH7AYjEGzM+dBt9caijF+5CZhGc5R0KrVb2+Ld2ZfFtPkG9OVWeSBb81fteAjvnMs=
X-Received: by 2002:a9d:454c:: with SMTP id
	p12-v6mr23532023oti.352.1523263854854; 
	Mon, 09 Apr 2018 01:50:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Mon, 9 Apr 2018 01:50:54 -0700 (PDT)
In-Reply-To: <20180330000021.9214B232BA2@git.openembedded.org>
References: <152236802127.22760.4484042389285225479@git.openembedded.org>
	<20180330000021.9214B232BA2@git.openembedded.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 9 Apr 2018 10:50:54 +0200
Message-ID: <CALbNGRT1-EoonDVYHXgUGc07E=sHn_6ictMJTGcrGB62DsUB5w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 01/90: poppler: update 0.57.0 -> 0.62.0
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
X-List-Received-Date: Mon, 09 Apr 2018 08:50:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2018 at 2:00 AM,  <git@git.openembedded.org> wrote:
> This is an automated email from the git hooks/post-receive script.
>
> armin_kuster pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit 2a8a5b5cd0258657e145f65f54c3145e42116f7c
> Author: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> AuthorDate: Sun Mar 18 20:08:33 2018 +0100
>
>     poppler: update 0.57.0 -> 0.62.0
>
>     * poppler moved from autotools to cmake
>     * qt4 backend was removed
>     * build tested with all and none in packageconfig
>
>     Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
Oops - it failed on autobuilder and I suggested to keep 0.57.0. Think
it is some race when using a high number in PARALLEL_MAKE. Now that it
was applied I have get it reproduced and fixed...

Andreas

