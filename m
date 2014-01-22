Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id E077E6002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:27:37 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id wn1so768661obc.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=pXdGX6vUpXuWmAi86iz8OP9wwksTbtnpL0jTeY3cNgs=;
	b=TLd6w61WhtV8Fb87w7l7egFfoLYVzEiw+ptJ7MVi6obwDyy1yyOrwauXEKSFPj1wTB
	cm4wFvjmvAcDJx4siAgTrwggTKyKhxZF1ZrptIpy/8AtOpPVMl0FupVaBb/GV3hWgQA2
	MyxY5Chm6FlvGRd27g/xs0T+R9Xb429Xz0+w9CwF7oNWwYmUof3k9V6QnBTFEdIeuOg4
	dcl6ZC+IdIPjS7ctx+WnbI7UNeDubyu6dhQaKtw/hqawQrG9C/rk6RMGkrUcVrG3XMnH
	ROQxqI2zT5LqAKeUov86MgksuUX+H2QW6JoK3Hm3fm3Rb/5knRVszpveuLpyo5K2hvMd
	IFuQ==
MIME-Version: 1.0
X-Received: by 10.60.56.70 with SMTP id y6mr2382336oep.32.1390411658731; Wed,
	22 Jan 2014 09:27:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 09:27:38 -0800 (PST)
In-Reply-To: <1390407432-22077-1-git-send-email-david.nystrom@enea.com>
References: <1390407432-22077-1-git-send-email-david.nystrom@enea.com>
Date: Wed, 22 Jan 2014 15:27:38 -0200
X-Google-Sender-Auth: c8-xG6cMiJfi5WJc8xB6mCPU9Kw
Message-ID: <CAP9ODKrw59Zwdr0wn8BmyOMCH86tHt_tcRUykhjeuBP4DW28HQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Subject: Re: [meta-browser][PATCH] nspr: Remove BBCLASSEXTED override since its already set to native in oe-core.
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
X-List-Received-Date: Wed, 22 Jan 2014 17:27:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 2:17 PM, David Nystr=F6m
<david.c.nystrom@gmail.com> wrote:
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

