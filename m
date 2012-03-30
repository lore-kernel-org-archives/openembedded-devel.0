Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SDVFd-0004Yt-LJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Mar 2012 08:23:59 +0200
Received: by lagw12 with SMTP id w12so376726lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=pVaY0edq2HUJgMUWQWzQYdmMZGJzvwPbngjdJC/EHr0=;
	b=whFeq6l+7NgU0u1pqw7egiJm9QOlm45vxLcVsnWp+x4SJDWtf1NU845/FYPHmW0L0h
	P/0xyQ3TpIUfl1j3OLRjOsjjDaoiVXUYf7zqE+fdN8DuTsn4aKiR0X8IWS3yuQCHy8g6
	9xoXODfUPUpcxqMTp5NxPNV4PDw/1aiG3V74b5XoK9OPVyYzAqaq9YS8t5uT7WzxUGMz
	1lqY2A8i+l5r1YzCPWCCxjcBy3LCzg5b4v4+UIrE24Lxxl8pXMdZnn0X0WN/aBYIIoob
	pKMFq4wHDIEVwNTusm7T4PviwNVNkFIc6MNJd/kQOEUlKubdw20CBJG0iLrWtVsBBXMY
	75Qw==
Received: by 10.152.146.163 with SMTP id td3mr1175378lab.31.1333088093548;
	Thu, 29 Mar 2012 23:14:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Thu, 29 Mar 2012 23:14:23 -0700 (PDT)
In-Reply-To: <jl35h2$lbg$1@dough.gmane.org>
References: <1332898927-17745-1-git-send-email-raj.khem@gmail.com>
	<20120328022305.GD17470@denix.org> <jl1qhd$fna$1@dough.gmane.org>
	<CAMKF1sqM8T=jEbcy4+=iRCtKH+uQtuACXaRJr9q75-3grFG66A@mail.gmail.com>
	<jl35h2$lbg$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Mar 2012 23:14:23 -0700
Message-ID: <CAMKF1sppQDC6eRUM0zXOKXE+L9fhBkZMEj-7EO6X1Cze3vk0BA@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Mar 2012 06:23:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 29, 2012 at 7:24 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> On Thu, Mar 29, 2012 at 7:11 AM, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>>>
>>> Sadly both of them didn't make it into patchwork :(
>>
>> probably too big in size.
>
> Can either of you provide a git tree, or easier for me, have Khem directly
> push it?

git://git.openembedded.org/meta-openembedded-contrib kraj/eglibc-move


