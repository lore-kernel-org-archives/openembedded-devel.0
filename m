Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id A73FE6D298
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 16:36:04 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id e14so5403961iej.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 09:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0pZWbpiBbre/hQCeeyBdcKbjpJX7SMWm5q2APCBvKgc=;
	b=0+SyqXNWBK2jMl34p89Lr2OieB8evzCviQNLQNyyUw8K2CTeFEtaMhBjElJ2sQoioX
	9cjExWsyag6y92LqsQQT1EbZhUWeBYks8C1HlMhsYQAu1hDT0KGetTkKKaFwIeM8O8x9
	V3appr5XpF0SZfY0h1g77OA5zkqSU0/PkQMDhG0CaJpSZz8Prc9WJNy/Qk8+svMuTEEH
	qu9Pcs5m0G5fLijG4STdrlEHBKTFVKprYKRxHsvH/zC2H06QYI7B5Z2n6k9RijCTRt2o
	B9ABBl2fqqyyeRynePHqJESW76NsbKsLfLMvvtppaAuEQLmMt7Rsg+OEHdoC4TxriThe
	IDGQ==
X-Received: by 10.50.57.44 with SMTP id f12mr137960igq.39.1383237366425; Thu,
	31 Oct 2013 09:36:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Thu, 31 Oct 2013 09:35:36 -0700 (PDT)
In-Reply-To: <1383205247-8487-1-git-send-email-b40527@freescale.com>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Oct 2013 09:35:36 -0700
Message-ID: <CAMKF1sqTBq-J_trvVcmVcCT7uuJEaXuECaczSEbjDRNQDWRz3A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>, b44149@freescale.com
Subject: Re: [meta-oe][PATCH v2] tcpreplay:add recipe
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
X-List-Received-Date: Thu, 31 Oct 2013 16:36:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 31, 2013 at 12:40 AM,  <b40527@freescale.com> wrote:
> +PR = "r0"

get rid of that, and why are the configure patches not ok for upstreaming ?

