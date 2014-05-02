Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id D166360144
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 20:46:20 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 131so4232174ykp.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=SOMG2XHz95Fo/lJacnrrXGH65LWC+BWPCvl6RReGsas=;
	b=PbgZET1kDonNfqUcGqD1ZTyBwIWN7p+H9KUuZAqON4vL1O7uXEXK8T5yclo6MbWiKU
	+CN0rpw2mBab3sikg9su8+DmO6Jvxn6lINPQULmEyUFQfyGwrYfgIsfKXoENVszlW904
	YhuW/FqVV0N3F9EGEzBsw08Rt9XMsUHdn6JfoEvGmYrbDSvoZOismMPYl2BaMbEs20CK
	EIvPSwWkkGAYmz4eywWtkwM9pWKCpgWvTvsfweaXF0Z2SbNNAgBd8cAApYNhuAYHXG5S
	m7iy6VLRJYu7y9nG+ZbN+hByFJlpS4IM5MNU+jluavVd/bbETaV6MiSctaHzugD4Yn6P
	ByDQ==
MIME-Version: 1.0
X-Received: by 10.236.129.227 with SMTP id h63mr26777894yhi.148.1399063580860; 
	Fri, 02 May 2014 13:46:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.132 with HTTP; Fri, 2 May 2014 13:46:20 -0700 (PDT)
In-Reply-To: <CF89516F.2F68%donald.poole@swri.org>
References: <1398974461-3044-1-git-send-email-donald.poole@swri.org>
	<20140501210300.GU2486@jama> <CF89516F.2F68%donald.poole@swri.org>
Date: Fri, 2 May 2014 17:46:20 -0300
X-Google-Sender-Auth: dprxw34R796KHLE4h2y1_YGyY5I
Message-ID: <CAP9ODKoGRW+jKyYAgiALURUpbwArhEEX7813fuHwuXkbkxOf7w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Add install support for native builds
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
X-List-Received-Date: Fri, 02 May 2014 20:46:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2014 at 3:44 PM, Poole Jr, Donald R.
<donald.poole@swri.org> wrote:
> Martin, et. al,
>
> What is the processes for patch submission review? Does the review team
> review and test the patch and then report it=C2=B9s acceptance?

We all can review; we test it and try to discuss if we find anything
which might be problematic.

Usually people has a knowledge in a specific area and those people
usually are awaited for their feedback before merging anything.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

