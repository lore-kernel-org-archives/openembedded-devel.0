Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPf5I-0003e9-Lm
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 22:24:09 +0200
Received: by mail-oa0-f52.google.com with SMTP id k14so7977805oag.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 13:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=+xtEFP2BCCAeX3FJ+ec2KicWLVGBf71tlYdL5NlXoSE=;
	b=ylec1az9Yc5Amlg2EMFmkxPycUFGHhKBYolUpGJ8Pw2d+qMFQPsMEo24M31JyDmFW0
	LmlWN8RBv1oCw8AoGaLwQLDSMaaPhRxjBOy1thSRxEdApR4KjaPBmCuHUfKhNn7zpfow
	9Dls2gtwySdDAxcAQYK8F8B7SN9+pyExhz2ZdwBKOCmc/m++33on9+VSVQQdoM5ukXip
	ujKGoHHshpC2P36zxjM7aRw4uikoVbww/53AMlUCCBE6m6roCHMndkHlZLt4NFF4+g5i
	vyM4NSy0RMAUQyCckDvxJIUowen0YuKim9HbCJyWwN0mNPai/2sRgS1cPtgf6mkZXgI8
	IHtw==
MIME-Version: 1.0
X-Received: by 10.60.132.36 with SMTP id or4mr17352507oeb.112.1365538003598;
	Tue, 09 Apr 2013 13:06:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 9 Apr 2013 13:06:43 -0700 (PDT)
In-Reply-To: <20130409200127.GF2474@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
Date: Tue, 9 Apr 2013 17:06:43 -0300
X-Google-Sender-Auth: cqJW_-0heSNe8jKk7Oz-HG6_Lw8
Message-ID: <CAP9ODKrrCy96RDtkYC+SjR88n01qkLxqvoVQ68QdFyn_RCWH7g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: meta-systemd future vote Was: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Tue, 09 Apr 2013 20:24:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 5:01 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Mar 05, 2013 at 11:59:07PM +0100, Martin Jansa wrote:
> My vote: 3) + A) later in 1.5
> I guess we're all too busy to implement 1), upgrade path would be nice,
> but is all-or-nothing, doesn't make much sense to spend a lot of time
> fixing every issue from PN-systemd when there are issues from other
> recipes we're not going to fix by .bbappends in meta-oe.

+1

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


