Return-Path: <max.oss.09@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id DB4C6608B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 10:52:35 +0000 (UTC)
Received: by qcbhb1 with SMTP id hb1so2017521qcb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Cw3GcdA89Iu3eJQGQYhiJHrvOPb4Pz0TJK2b16R7gPE=;
	b=TKmP+47MQdh04LoxLWos8YxwFsipGbS/wmySwfYk08YW6yTH3QPmq8+HO0XxCDS04P
	yLqKKDfkFGXZOtMgf3BrnxmTUIuuhhd048wfShvuxKVlZWNS14YvJC4+8KZ5p6ulG3Wr
	+1+thjAxLt4JuT6bbV1E8oCqQtJsXGs90cc13z3gIlSjpCTngw/5rlUs87DF5pPPxapU
	ddWXjLlRe3Rp3jarzIPwBAcjL9M4EAmhSbsr2CvuxPSnhBC24k/vFLO+GnineIgExLXK
	D+uLUtnTgyvPJoa5fc6aadr5qwYkFfDEaUF8M+kjDNt4zSK7TqBglxs3b04ZOUq2IuOp
	84rw==
MIME-Version: 1.0
X-Received: by 10.55.25.150 with SMTP id 22mr65839774qkz.105.1432723956239;
	Wed, 27 May 2015 03:52:36 -0700 (PDT)
Received: by 10.140.22.213 with HTTP; Wed, 27 May 2015 03:52:36 -0700 (PDT)
In-Reply-To: <20150527103349.GA3683@jama>
References: <1431771255-20841-1-git-send-email-max.oss.09@gmail.com>
	<1432661286.2291.4.camel@Saturn.local.all>
	<20150527103349.GA3683@jama>
Date: Wed, 27 May 2015 12:52:36 +0200
Message-ID: <CAEHkU3X1_D3USa=sgxL9U7-BUpF1bggscsKp1-LmD4T_OHv=0w@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] florence: use ${SOURCEFORGE_MIRROR} in SRC_URI
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
X-List-Received-Date: Wed, 27 May 2015 10:52:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Martin

> Sorry, wasn't noticed, because patchwork didn't pick it:
> http://patchwork.openembedded.org/project/oe/list/?state=*&q=florence&archive=both
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7657
>

Thank you for picking it up.
To you need me to do anything with the patch like resending or so?

Regards
Max

