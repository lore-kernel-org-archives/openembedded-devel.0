Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UQJ2r-0005He-3N
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 17:04:32 +0200
Received: by mail-vb0-f41.google.com with SMTP id f13so1350088vbg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 07:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=yXUowsDTopXF+hluKrQQU4sXjCaYEPElbFS3sRtrXCs=;
	b=a9avj7cLiYovvYVJmlGUjJaRHvBKr0oG34cdiwj/ASPfarIJMVD56IjH0ZP8NxNr91
	eg6w/5Hlk9yRHOpnxfGS8QDkYUJweITY6ezZlLZhXiQCf382lO1ZHMgw7S+QdkkX8JOA
	SvlewZtliW7MNgfyX/+WXiUJ/wAGAl/O5tRAuBgpn9rGOUVRCW5j8x87VnY0FLPc4WxJ
	vEOAN21FKl/aHpWjm1J8abFUo8mjoF+44/qH8vSUmxEQaLYHCmViNewWcCOUviwIV4cU
	daxDUwN2cK9kWRa4RZ4Y7egpDPUbcXGQ2TtQw4XN2/n6efumh4DHH6TOoxbVt0Lade36
	I6rA==
MIME-Version: 1.0
X-Received: by 10.58.56.161 with SMTP id b1mr5267373veq.42.1365691609608; Thu,
	11 Apr 2013 07:46:49 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Thu, 11 Apr 2013 07:46:49 -0700 (PDT)
In-Reply-To: <20130411141136.GG2477@jama>
References: <1365019873-30178-1-git-send-email-paul@paulbarker.me.uk>
	<CANyK_8dvYJsKsOACNCMvXG79VyNWeb2h-AGMFrAgtJ6StQ0Luw@mail.gmail.com>
	<20130411141136.GG2477@jama>
Date: Thu, 11 Apr 2013 15:46:49 +0100
X-Google-Sender-Auth: WeCIg_9dA6Q_26dzlh5Z_CJFNog
Message-ID: <CANyK_8fbNhtBY-jxAKmcu42NB3Q76hNGSm8pxHj5Ym8xe5DYCQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] fbset: Replace deprecated update-alternatives syntax
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
X-List-Received-Date: Thu, 11 Apr 2013 15:04:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 11 April 2013 15:11, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Apr 11, 2013 at 03:02:44PM +0100, Paul Barker wrote:
>> Is this patch useful?
>
> Yes and already applied, thanks!
>
> http://git.openembedded.org/meta-openembedded/commit/?id=b0fb477a11d24cc64a40f29dfd934b5e78f6cc7d
>

Apologies, I must have missed that.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


