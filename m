Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 492B660017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:11:44 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id va2so449531obc.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=beXk+QmpeVPVragcmnKvQ7yzw/ifLoMTNlF6BCCTsho=;
	b=e3L7ip19Djws8ayfhWjymw95u2aGjWYqoSNVIhgeVfA+x8EhE22KCBEQqmnyjyY33j
	voNFn2C15od+eI7BsUpg2pd6nCKOii1obliRwXmUy+n24XJYpHxoccCi/P8OS0a459Ch
	bHeUZe08iVeKdG+mNSavMIEcH0dqQobKON3lM4VYKIDahyoQBBk6Y47L6ETdw+9kvxs6
	vBYQnnDY05EoxNKbathy3XWbW4NSZcdgW52LLtklhOwMZqX2SaS6kR+pnd+osYCM60zX
	TR21Ew5BzyeSRg7JRtdkW9vdeK32/4K3SiVMW/HAT4kQlFsz830kVsI4YmtQaLGesDIx
	+C+w==
MIME-Version: 1.0
X-Received: by 10.60.56.70 with SMTP id y6mr1480960oep.32.1390399905233; Wed,
	22 Jan 2014 06:11:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:11:45 -0800 (PST)
In-Reply-To: <CAP9ODKo77V1CUCyr8p5tVJv9dR0LBmB20BOBBVF+jQXZGVXhqA@mail.gmail.com>
References: <1389943552-8083-1-git-send-email-kai.kang@windriver.com>
	<CAP9ODKo77V1CUCyr8p5tVJv9dR0LBmB20BOBBVF+jQXZGVXhqA@mail.gmail.com>
Date: Wed, 22 Jan 2014 12:11:45 -0200
X-Google-Sender-Auth: XJFG-l6A32WVrXjqlJnQukI5uX4
Message-ID: <CAP9ODKo2g+HMY6OoZ25r1vcMd9ydqt_8pOyw7BGzyH_zXwY8Ww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] radvd: update to 1.9.8
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
X-List-Received-Date: Wed, 22 Jan 2014 14:11:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 22, 2014 at 12:10 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Jan 17, 2014 at 5:25 AM, Kai Kang <kai.kang@windriver.com> wrote:
>> Update radvd to version 1.9.8
>>
>> * remove change-scanner-dependency.patch which is merged
>> * add 'status' subcommand for radvd.init
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
>
> For a subsequent patch, couldn't it be moved to meta-networking?

Ignore it; the missing of meta-networking in the patch subject
confused me. It is there already.

Thanks...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

