Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PaSeY-0003nt-9M
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 13:39:46 +0100
Received: by qyk36 with SMTP id 36so15241482qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 04:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=S65EGpwstbs6Dp5pEgYvn4AwKtmkhUWsK55KdPRHYNo=;
	b=WAd/i0MbkMBXw6Y4vmhvkkL1GSH890dQUGS/sdrzyWC2SFtrKPubmq89lsl2KYZNcQ
	0Z5naovpczLgfFGdfO7eGNEzjU5/+pxolPPBW1kg856BZd8Iw+RLfHBVS6SRj//bzScV
	VeOCcwC6EQsGaDbBvp2OXdmgdxhCzVeHT65mI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=naCoLvutRy5wChEkUwfJ8szFdKf9Tu0/yoMJKk/4UjP7jdVJ7xc7FPEAYpqHiAQJBG
	IOC9yTf3aFAoK7LtrSA4OHA4RF6jyvm5Zt3xM4STJg9pshlJ3a3peVLlqNV6wCoWoGO0
	EB6jPp0dc+pBbvOjGhSAqzq0JLenbxPp1cwmc=
MIME-Version: 1.0
Received: by 10.229.238.17 with SMTP id kq17mr19939519qcb.79.1294231158921;
	Wed, 05 Jan 2011 04:39:18 -0800 (PST)
Received: by 10.229.227.16 with HTTP; Wed, 5 Jan 2011 04:39:18 -0800 (PST)
In-Reply-To: <1292951999-18969-2-git-send-email-rep.dot.nop@gmail.com>
References: <1292951999-18969-1-git-send-email-rep.dot.nop@gmail.com>
	<1292951999-18969-2-git-send-email-rep.dot.nop@gmail.com>
Date: Wed, 5 Jan 2011 13:39:18 +0100
Message-ID: <AANLkTintu-ji9jq0pEWD38QagqQWgNoKpeZEYdZ2Qnf8@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] patch.bbclass: conditional patch-tool dependency
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
X-List-Received-Date: Wed, 05 Jan 2011 12:39:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Dec 21, 2010 at 6:19 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> only depend do_patch on patch-tool if recipe references any patch
>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---

Untested but I like it.

Acked-by: Leon Woestenberg <leon@sidebranch.com>

-- 
Leon


