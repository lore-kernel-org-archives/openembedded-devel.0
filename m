Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SDKex-00077x-UM
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 21:05:24 +0200
Received: by lagw12 with SMTP id w12so2939508lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 11:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=hEaFr42bMaKTavE5N1EBZhlIOAsZZC7PE456z+MzIJ0=;
	b=Iea/cYJddFjn/kPDkSXJ9IgBpjltiYoRPakr3eZQ98lGIdzor6Wh0KsSNJXuIp8ef/
	BOjP042YWBlQNzhBZoL5UeX2bVFiaqW0RHe3lH2JsG6yTWWxEBfiMwwirjSUDliNp7mz
	TZpdprQIT+Vm1KvZOitOhhAFlPLgfacDrw0sJiqnFjjTJTmTRbXgJSLgA8iuWpY5R/yd
	o6FhY1mCR2jAX+Sbcr0VkwR8aYuHu3Jrlxt4g/9o6PIvY5vvIGPXr4DmalFjtmd2IrGb
	Lr2FMySPirocWNYAcEofY+OPg6w+oAF4ufwrNPCrAZaDleNeGetdNkYGIzSHT6KHDwQQ
	Gssw==
Received: by 10.152.102.173 with SMTP id fp13mr28708384lab.38.1333047380213;
	Thu, 29 Mar 2012 11:56:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Thu, 29 Mar 2012 11:55:49 -0700 (PDT)
In-Reply-To: <jl1qhd$fna$1@dough.gmane.org>
References: <1332898927-17745-1-git-send-email-raj.khem@gmail.com>
	<20120328022305.GD17470@denix.org> <jl1qhd$fna$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Mar 2012 11:55:49 -0700
Message-ID: <CAMKF1sqM8T=jEbcy4+=iRCtKH+uQtuACXaRJr9q75-3grFG66A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [toolchain-layer][PATCH 1/2] eglibc-2.12: Move to toolchain-layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 19:05:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 29, 2012 at 7:11 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Sadly both of them didn't make it into patchwork :(

probably too big in size.


