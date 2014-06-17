Return-Path: <eduardo@monkey.io>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id DB6126B70A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 22:23:45 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id cc10so160125wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 15:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=X/lkCljxVV5XHhGPmBGRwhPnrnA600dKJwSXrPog9vw=;
	b=OrWXRcjeOpDUeUEk+4dlWhbr2BNXjijv5k1G4h3LsTJ0jWiEkitmsxagixsrB/CA+M
	9L2OFESOkgYUruxW1swztaTtUoIFfm63BITZhrf1HoFThDErKADzSozcpRyzlU8RgItB
	thH2yvQezhlPJI8XQGqvbpwY/nnIHQzlj8zquUdZRXLXvf84S572bIzBzNZ6kYAEF/zI
	iG31fl9bQgo7OK6QnLaac5Ii/dHcP2u332Km+zb0eMvsxkB1KHBDaJ2iLm4Q8jtPJoj3
	n5DrWobysaeKItiJ6Wrf77QNjCPtYBr9Ja1ZqeLcqaeZM+Cj31dKgoSG2XuGo28GoXhL
	vrlQ==
X-Gm-Message-State: ALoCoQlJdpUOjkOGq9PDAkWguzrQ+vfCx5lBHnu5F+TIG4fGUzjvZYqq5qzkr1r3KzzZt7E0iN7Y
MIME-Version: 1.0
X-Received: by 10.194.110.10 with SMTP id hw10mr17597706wjb.81.1403043825715; 
	Tue, 17 Jun 2014 15:23:45 -0700 (PDT)
Received: by 10.194.88.135 with HTTP; Tue, 17 Jun 2014 15:23:45 -0700 (PDT)
X-Originating-IP: [186.32.221.184]
In-Reply-To: <6983375.pDRiSKljRX@peggleto-mobl5.ger.corp.intel.com>
References: <1402756840-30533-1-git-send-email-eduardo@monkey.io>
	<6983375.pDRiSKljRX@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 17 Jun 2014 16:23:45 -0600
Message-ID: <CAEaCVQheZd3EedT5qOaZJ5TjQpfjW8Tvkk0vpqAsiiXc75ggOA@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] monkey: new v1.5.1 release.
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
X-List-Received-Date: Tue, 17 Jun 2014 22:23:54 -0000
Content-Type: text/plain; charset=UTF-8

>
> >
> > monkey/yocto: 7a702d00c5e48d1e03d8bbd2c7bd93a0d26f701e
> >
> > Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> > ---
> >  .../recipes-httpd/monkey/monkey_1.5.1.bb           | 36
> > ++++++++++++++++++++++ 1 file changed, 36 insertions(+)
>
> Typically we try to keep only one version of each recipe unless there is a
> good reason to do otherwise. Could you send a v2 of your patch which also
> removes the previous version recipe?
>
>
thanks for the feedback, already done (new patch sent).

best

