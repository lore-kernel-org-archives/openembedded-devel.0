Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADFC73D9B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 16:53:28 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so66389869igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=pCy/EavlHlKXCPAHDzM3ll9BojMeqnEwIkjS9QpR5X4=;
	b=oWf61UuiDqsc03dhoU6DP1HypFM/wX4y86w0s9FLXqxIAAN+C4Bhz1pA4BNlq1zt7V
	00cmsTOucjbPIDzT5RXbsv2RqGRO0D+PBHFgYmW9uaswrXIEE6wrZM40tJmaDRgiyZJX
	Pczf5QII0GHFrefU3qvKpRdCcCvcY08DvZUIYJuCibrhVJIBHRL3g3NKD4uymat3aFiF
	Tx0M+8gRuqxG3X8DmiJW6bh2Pw08pikHiSO8s8F+u0aTETEGEwhj/gFveTPzbSxjx6GN
	mxzOLS75RlXLBIvBgpbK+iKa7Ei40ZAXmgRhB+hXZ0kmXCy++P8li1UGw4RWTwZNus7l
	JAzQ==
MIME-Version: 1.0
X-Received: by 10.107.134.206 with SMTP id q75mr14810257ioi.27.1430153609255; 
	Mon, 27 Apr 2015 09:53:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 09:53:29 -0700 (PDT)
In-Reply-To: <1430153054-1252-2-git-send-email-raj.khem@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<1430153054-1252-2-git-send-email-raj.khem@gmail.com>
Date: Mon, 27 Apr 2015 13:53:29 -0300
X-Google-Sender-Auth: Jiuigfz489A77EZZOWOjxey9Rqk
Message-ID: <CAP9ODKpOaUqG+jFvraPe+aru=yPdDLZ_U6mqqxN7JnnmS4vSAw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 2/2] chromium: Remove use of deprecated udev logging API
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
X-List-Received-Date: Mon, 27 Apr 2015 16:53:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 1:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> in systemd >= 218 libudev deprecated support for udev_set_log_fn
> see
> https://github.com/systemd/systemd/commit/25e773eeb4f853804e1bf0dbd9a184f23e9b2a97
>
> Change-Id: If6e3742bd2a70685f2521f134d5965bf2d1f8f72
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Agreed. Please add proper patch header and prepare a v2 please.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

