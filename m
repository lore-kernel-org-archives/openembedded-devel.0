Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id B5E327DADE
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 19:09:17 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id f25so13263906qtc.8
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BFcLokznfTbeS+5FjGUZf2rUoVPbo+ysi68lPZ1F/a4=;
	b=Ut+Fa2rrzONXh3TPKivnbv/xcB7VXDWtuszgGgd/FNdfINqtRehlT37Z02geCXHSDb
	iHT2Oztk0aakHF5/17ZAC6CGDqK/ch2WbsOh9m1xs2HJ4shvy5SXTkzYfPB+yDY6L1Tt
	AlemR5a8JA6vVW3MlmCDUjAm0WV7yzWUZaPeaEHPMkd0Sbez4Q1ltfg6NCN/jmURQ/W6
	ck4UDkAU2V0pnZIzotK0AS8BSN7OubPGZ7kqyfcMekSJM2/1BDksHISHAGEa3/KaC/lk
	p+D9Yxf4BGRV04FhGIetF80j2QwO0N/K1tT1TKKreWwfWmZUy1RZSQ8dg64yvgKJD5JW
	Kiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BFcLokznfTbeS+5FjGUZf2rUoVPbo+ysi68lPZ1F/a4=;
	b=YFtsB8E8NG/kwshqaAYHRzzgDVFZX49jcPRuEwafneGUVXs+jw5KT4qpxr4usxB97q
	MQsKReVQhdJAMop9odROYYZlay4lT7iNL/lRdpKEHPUnYR4czzsfe32bioerbhwoj3Eg
	joX+59IUm7y34mlsG+rltT+OxUUrrZngxlTQhkidp87AOKu9Gt5+gfqt2mgw2P2XGFXK
	gOfIPX1VedrWu4iqqsI0LEEiyQcZFFrL1qqtoNmb+ClW9SZeAijZeReQmJC4eW3BphSD
	D3nJ0EMNsKeh0sNpMHr8SjZOw3QkrSVDvnCZu9NxFi2BP0o+oDJOSrTVajddcUQImHgH
	nrHQ==
X-Gm-Message-State: APjAAAV8avJHNu5AhQv5vsGAsOHt7c9vmPo5rMitaa+IhEn199lQUkcR
	+79j8vEhqxK2VQplwyLvHrKOl8LFFj3YUZTqeO4=
X-Google-Smtp-Source: APXvYqz8g4wUF/0yZaEN+yN/GI+BLkeCRp/6AeeXig6XhKH7xOnswWbKa4A2WAX8U4RbcMWQ3XIwcdvJLrFNhpZxdbU=
X-Received: by 2002:a0c:b620:: with SMTP id f32mr43840681qve.228.1556564958445;
	Mon, 29 Apr 2019 12:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1srkU7OPqv7YRyGkrDHbmMMYR02hPpW_88cB_7=nYbrnZg@mail.gmail.com>
	<2707a439-ae13-bcbe-adc8-7816ebacbf38@gmail.com>
In-Reply-To: <2707a439-ae13-bcbe-adc8-7816ebacbf38@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Apr 2019 12:09:07 -0700
Message-ID: <CAMKF1soWN4RwSjK3--tbyMvGvh=+5km8a4a_=_CfwLA38PWYYA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded 2.7 (warrior) release maintainer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2019 19:09:17 -0000
Content-Type: text/plain; charset="UTF-8"

Yes please, thanks!

On Mon, Apr 29, 2019 at 12:06 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 4/29/19 11:07 AM, Khem Raj wrote:
> > Hi
> >
> > I have branched out warrior today and seeking a maintainer for warrior
> > release for all layers under meta-openembedded repository. If you have
> > time and interest please sign up to help out, much appreciated.
> Signed up? you want patch to update README's instead?
>
> - armin
> >
> > Thank you
> > -Khem
>
>

