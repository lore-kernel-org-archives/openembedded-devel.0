Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id C564971B30
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 20:09:37 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id d5so33630469uag.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 12:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=X6DOWBgjVLsT0OAOpxOYaKhln13CId3A5O0jEB61yyA=;
	b=rWnxWvZy02Vwa+fQt8X33CUrlg+2tsFy6GpNgY6RjRcXwPLqWQLNt6cvKCHQox1Io9
	q9G/ueRfBGWLdBO3JWi12OP/j5sZSMRo/koIMagWs+fN8bCStP5cmnXOsudiettRhG7Q
	yMrvqwn/YZcASQzcRo51SFDMciw9DNl6VzB3LZdDZptAex0ZiFuNHv78SoKfIC1cE0G+
	decNYSm3tA8hxCazvgvAP4MqfmyTgZsww95qnNwXd7qU2I8gQkEqoNA69SUquKNO50mJ
	SuQoqSJkCqsDmC8yaA8bFoNfxRJTGp/6g9y6wMp//j2UeM6rF7iaxVd3dL1meVniUase
	8jYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=X6DOWBgjVLsT0OAOpxOYaKhln13CId3A5O0jEB61yyA=;
	b=em8Xp33ZPqJMqWAzmMMW90DW0h0+Qj9XIdadx6yLNLD+WuoRL/AwLk/cRP2noUTFAJ
	mTlqximkdJYYtosofXwTm7/SRF2CYDH5ITAjihcHmStlNoMGdZDLqNTYrvqifeaIBptx
	dMwPtNDa6vKVWqkTd6Cnuf9NrsoVlCIEd7bBxKkRcKMkngbrQieBHAT2R70+lH68bDA1
	mn1/BJ4gmwC642YXWsTHbqq1VXYBsdg3tUhAbOp/cz8oM5bkgpY2i0Smpi4PsthPGu0U
	Gw4NgTC0MHCFGKSGHnGaX3PIwBIpa3P+hSVU4H/yybv/grASTqU19IROGFzEzrmlEzmn
	wBxw==
X-Gm-Message-State: AIkVDXKuaJE8ZWdAsfCphfbQW7s9mRfIpkPr2Vs3yj3tRbRfvP8AtjoFPJ66A4zelHIoXaYinxv/wtXXFkkkDg==
X-Received: by 10.176.81.97 with SMTP id f30mr56077916uaa.55.1483646977281;
	Thu, 05 Jan 2017 12:09:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.14.2 with HTTP; Thu, 5 Jan 2017 12:09:36 -0800 (PST)
In-Reply-To: <CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
References: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
	<CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
	<CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
Date: Thu, 5 Jan 2017 22:09:36 +0200
Message-ID: <CADnUhn06UBk_+gUUtHiWojjjbthEDS+BQZ=CBy3nZ33EOmbfmQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: apache2_2.4.23.bb fetcher crashes
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
X-List-Received-Date: Thu, 05 Jan 2017 20:09:41 -0000
Content-Type: text/plain; charset=UTF-8

2017-01-02 16:20 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:

> Actually it was regarding that jquery library that I patched today.



No, very big mistake. I just found message below arrived three days ago to
my "advertisements and marketing" folder:


This mailinglist requires people to subscribe before posting.

Your posting was automatically rejected, please subscribe at
http://lists.openembedded.org/mailman/listinfo/openembedded-core

Date: Mon, 2 Jan 2017 14:34:19 +0200
Subject: [meta-oe][PATCH] Recipe refers to jquery library folder with
JQUERYDIR variable except once, where literal string is used, instead. This
patch fixes that deviation.
Signed-off-by: Matti Kaasinen <matti.kaasinen@gmail.com>
---
 meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
index ec8f360..a047a20 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
@@ -21,4 +21,4 @@ do_install() {
     install -m 0644 ${S}${JQUERYDOCDIR}/copyright ${D}${JQUERYDOCDIR}/
 }

I don't know my OE registration details or I made some mistake in setting
up git-mail.
But please find my patch above if you wish.

Cheer,
Matti

