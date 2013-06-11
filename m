Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id A9A376A9D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:56:45 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id f4so13628743iea.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 00:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=FJ2bPBLD0QTockNBCUKDwOD5d/IfBihxNFXjU8R8TgU=;
	b=yiwNIcyPNxVDbkCk2VtDu/uCHeX67Kl56F477JQiU1NDOqdAtPD4ouNR0Cth+T45bE
	JjcV3On9yrMawZeWCaBEhKJi+g/eza2pKVln+YeyzkSB3x3BxdAUcY6gBj7r/eIU24yu
	+3L1kSQZ+6cCXGqFR3ek2czf/XVuY5iTkvXvnrLHAgFGrcxprw7mHr2OiL/KmVEDHXET
	tLbwUUccFxMPd3cZNmAsi89rKA60JZnui5tNUU/BG8iNYRbrFXgJG709ZPRD7FbLYVI1
	K6jf26SdZQthjkRZJzHKGbUfJECTRCLs2c3THu7874/cvng88m4rKPPFiTB9muv++dwT
	zPeQ==
X-Received: by 10.42.11.211 with SMTP id v19mr3387275icv.29.1370937406502;
	Tue, 11 Jun 2013 00:56:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 00:56:16 -0700 (PDT)
In-Reply-To: <1370234596-31793-1-git-send-email-net147@gmail.com>
References: <1370234596-31793-1-git-send-email-net147@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 00:56:16 -0700
Message-ID: <CAMKF1srnBig-TwFvpM781cYJrk=V3X9KWnAZC7Pf-SaSHdn2rQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] llvm3.2: new recipe
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
X-List-Received-Date: Tue, 11 Jun 2013 07:56:45 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 2, 2013 at 9:43 PM, Jonathan Liu <net147@gmail.com> wrote:
> arm_fenv_uclibc.patch was copied from llvm2.9 recipe.

did you check if this patch applies cleanly or not

