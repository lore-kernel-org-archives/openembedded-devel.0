Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2D83673D9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 16:57:09 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so148180802ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=SY0O+kN5HHxDW5ZSqXp2nZrMTkDwGS3hw0bJiSv6J3Q=;
	b=zLwdRI5++2z1hoTwWX84kU13+K6wmh45yoODvNEWDTgJWkMnfgEaKoqwCE9kV5l4Ct
	++qj8NDGf38WmAnC6vKw/uvRhA1P9GefAlRoNXY7dUwbO6eHEejMBXb7ZPBJqbnejDlN
	UN8Ec8yUSq5Dwc6juNI56VyQVHLy9hmQq+1LiYOhdIU2a+YDtQGy9BjtQGTFzN8ijHUL
	nuinv+gOLochN21xMRAjoaSC6J4vqKT5yuh7/yEnPQywIqvssMZCjfsLsMfY28DXdYnl
	QMIjVblIu0R4rfcHHbLwmacALdrdy2fZaIK3uQUYySU61GCGfzNT2Kf/jrjP/5+Q9cxf
	A20w==
MIME-Version: 1.0
X-Received: by 10.107.130.165 with SMTP id m37mr14646576ioi.62.1430153831192; 
	Mon, 27 Apr 2015 09:57:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 09:57:11 -0700 (PDT)
In-Reply-To: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 27 Apr 2015 13:57:11 -0300
X-Google-Sender-Auth: -Z4Qa44zA6k2a9PaKE_oMLIrXWA
Message-ID: <CAP9ODKrO9G9nNyADvRpXG3hhQQDC-=B4okpsL93VLMx7M0i06g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: [meta-browser][PATCH 1/2 V4] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Mon, 27 Apr 2015 16:57:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 1:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> CEF is a framework to embed chromium based browsers into other
> applications
>
> Change-Id: Ieabae43042101331f67cf6e673391f6fe320561f
> Signed-off-by: pnandyala <Pavan.Nandyala@LntTechservices.com>
> Signed-off-by: knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This patch is way closer to what I consider ready for merging. For
merging I would like:

 - Carlos feedback - he is the one who did most of this work and so
should be consulted about his thoughts on this
 - proper patch headers

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

