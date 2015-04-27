Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1670D727E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:49:15 +0000 (UTC)
Received: by iejt8 with SMTP id t8so1232738iej.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=kHLQDd3fHjhzZL4WJJF6WVnJ1uFM2YLp/g1epHy6464=;
	b=tILszC6/08svZVWaIdToqJfvrw9+mSQVVfeSrapyjnU83WwxiwLqMd4XdKel8GmP5Q
	H/Z1KLc11IfXEf23l8uqMaHVQURON7UcqzIVmBvItYgjA5sulWCz58d/7j0tiyVN8lpB
	68tDhlGD5TlulcbsCbQRmoNd8xwRxZ+rqONGnbK/FnXUIKSm/jrMSApBjjnbaUt496Wy
	/2u5v5Z2rUJi1+FJJORcqILMKkDVoPbMdF3d5zpLsWghvxd2sywafJMyWp7e3PzsvHkM
	7gAHPakoTvqOmucExIL51xCWzMZG8GKbnPSkTMVpjgWKprXsIjpvzOOutBiMkv5b2Byz
	Ag2Q==
MIME-Version: 1.0
X-Received: by 10.43.55.12 with SMTP id vw12mr13774382icb.30.1430160556403;
	Mon, 27 Apr 2015 11:49:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 11:49:16 -0700 (PDT)
In-Reply-To: <1430160369-3099-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430160369-3099-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 15:49:16 -0300
X-Google-Sender-Auth: 2lng5seTCe_HK0UqV_O0vnCrsQ8
Message-ID: <CAP9ODKqunr-dYDCOmfXC7x6dYdPNLRCASfHQ4TGX_cX0u3GmUw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][dizzy][PATCH 1/4] enca: drop unrecognized --with-libiconv-prefix option
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
X-List-Received-Date: Mon, 27 Apr 2015 18:49:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 3:46 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * fixes:
>   WARNING: QA Issue: enca: configure was passed unrecognised options: --with-libiconv-prefix [unknown-configure-option]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

