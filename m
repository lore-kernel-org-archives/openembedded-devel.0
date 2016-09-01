Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8EA7325A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 14:09:33 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id e198so27951562lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2016 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=yH3n0hrtGgxcB74daFCi5Qsx3KZXbiA1UbXHdd5P82A=;
	b=1GkJ+RsUUSgTEJPG9Kabj/58GLB+sDMC/JIzOtMuLlOgf4uiK+Tvg/0e3JDSY4To40
	vd8QQY0LbKic7jBIvpdrScp/tmZ4zeNw1038ZJQC6U5FE0h9LL7I0bYiqtEZfiBQSXyo
	XVLyEblOGyo6ErlM2jxGZG3p5Qy5tOyNkkILucETK//d6XjbSa9zsQ8UmMQTrhAxztzq
	G79nuFX5N8TpkkjPgwpkNfAFy9UX2h8CX42Vpd4A8ehEEiXxgg9XtjNtYzpIC7dQpMkb
	JZ61PTklGpADsg2ZfPFLp40eHVJKAJQF6g6zMEKuboOhP+XoLGIX6qVQadYmiMkzA2/+
	ly8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=yH3n0hrtGgxcB74daFCi5Qsx3KZXbiA1UbXHdd5P82A=;
	b=KGQazTdrTgeLh2/OU9XbGmrdOhTV62XHl2DX/ypzbL6GsXhDknfWA0H9uCwm9Zt+0/
	Tj1XGLUgkcwz2xfx691y5ho5a1pG+XLnzGn6fnYAY6/yQTAvYtWs/d770jn8/5Fqrdsq
	ZPwyRvmyXX0JF/iPVw5XBKvLL26mWG4A2aCvbszxmFOEOEX4+QWzJanRuS2kKtcEI2v5
	SE9ahc+aEt4i17n/Y3DJcYD4vnd+iez5BzQEGwDskO8cnRW4nO7vFYQponUox9QdyPHs
	DBPv/PFHIje2rkC/EQvvT64Prt3nEdO6MohQUXpMprKdcL3tDtvswfhH2xX4vrlCNaIv
	dR9A==
X-Gm-Message-State: AE9vXwPElM5u9LFRA5+JpElnoehmiVN5KuQxqCBUGgFSNIz80vixIkqTV3OVNi4DVHjxH1+eV2eytrIN2ABZaw==
X-Received: by 10.25.213.20 with SMTP id m20mr5562001lfg.61.1472738973663;
	Thu, 01 Sep 2016 07:09:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 1 Sep 2016 07:09:32 -0700 (PDT)
In-Reply-To: <20160901135416.GA6471@openSUSE-i7.site>
References: <20160901134240.5272-1-twoerner@gmail.com>
	<20160901135416.GA6471@openSUSE-i7.site>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 1 Sep 2016 16:09:32 +0200
Message-ID: <CA+chaQc0FpUxG_cGRtDkiN5VJwPm-FP4NaSLNeT+k6kCyri0mg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade patchset
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
X-List-Received-Date: Thu, 01 Sep 2016 14:09:35 -0000
Content-Type: text/plain; charset=UTF-8

Don't worry, your version is the best so far :).

On Thu, Sep 1, 2016 at 3:54 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> Oops, I should have checked the mailing list before posting. I only checked
> master and master-next :-)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

