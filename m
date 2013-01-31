Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0uPF-000107-Bf
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 14:42:38 +0100
Received: from mail-ve0-f199.google.com ([209.85.128.199])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 31 Jan 2013 05:25:25 -0800
Received: by mail-ve0-f199.google.com with SMTP id m1so3632929ves.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 05:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=lsSwxDr2r+1eEPAqqAtoOzXgN/WBZyMIk+4RoE9PCCw=;
	b=G/THYfqAoLpx6nbTzdgBCj5vmdR15P7tRAMmRN/omkV/J7UWD0+Fx4iCwI2tbqOuCW
	zeXUzCaBQcM1/V9wGfcWTwmJHQtujyj2eIau9tJlC0QNtXApvSonWww6bBwifLj17v03
	fqa4MoT7sN9MfLZkcXJllkfg2NluzhhEYCYopM3LqEYGCOFZC68BMj0oF6UeMwD5ni8P
	pSLP+aXPTbgUT3eT7qS+eSqhL7kQkNhMngYPwRViT6aiBfAwekIeLchCmK52+zhGY4CU
	Tc/GUYdIiRPTcrol27jwgB8qqI5TKK7aqtSE5ovX1Racs1hykWeJsg9BZ0aBxqNI03d+
	eEug==
X-Received: by 10.58.106.161 with SMTP id gv1mr3772868veb.35.1359638796616;
	Thu, 31 Jan 2013 05:26:36 -0800 (PST)
X-Received: by 10.58.106.161 with SMTP id gv1mr3772865veb.35.1359638796509;
	Thu, 31 Jan 2013 05:26:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Thu, 31 Jan 2013 05:26:16 -0800 (PST)
In-Reply-To: <1359638269-28437-2-git-send-email-Martin.Jansa@gmail.com>
References: <1359638269-28437-1-git-send-email-Martin.Jansa@gmail.com>
	<1359638269-28437-2-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 31 Jan 2013 13:26:16 +0000
Message-ID: <CAJTo0LYDHb37PyT0VJLuKcUsO3HN6GfMjjdvvBu=gL_doKqSQA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnoNioEX5quh4DCH5bCOeYQT62V//kM4K4hzajXWguyvopW3Akag7nuxV4LH55RT5JgfjF6+HSydK/MvumYsi+EcSu35Q1SQSQ7IzfTAXyrHnFphFHf5IUHPEr3jujwXQEDIZhUAMzw/+q/lehd8ESWWJk/CuCxATX7usmJzFQXKZMiVEvWrUiUe1hQi2KEmQ73duHm
Subject: Re: [PATCH][meta-oe][meta-gnome 2/2] midori: add libunique to DEPENDS
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
X-List-Received-Date: Thu, 31 Jan 2013 13:42:47 -0000
Content-Type: text/plain; charset=UTF-8

On 31 January 2013 13:17, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Shouldn't midori be in meta-browsers?

Ross


