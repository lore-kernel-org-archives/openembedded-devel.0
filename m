Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PDTkv-0006SG-Ob
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 04:11:22 +0100
Received: by wwi18 with SMTP id 18so165656wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 20:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=yTvWwGKkWlmBDluDglqn2HyIYzt/qfgmeHxCGBdaZwM=;
	b=ZWemtbSAH0P/anqpenJM9ZSu7pSCguBpYZuHZI3nPUQHEf9H9ZlEG3T1ugilmTXOxB
	eLYWQib3pAJwdUMdACOg/ryujlDKIV6gIF7gGnyrgr3cJogFQHzm5SYmYZSw+ejRhaje
	ArWsJf8ZkJfVGaxlxY3CSPQ1QlJpyC9KtdakQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=GPWLKsGBj65Xns7XXDJnbZ3czgmoqLqKc9aOo0+o3pVVWJQnMI7RqEoGXqDx3M4WVG
	9EVvYBcOpVSg5k7w569P71m7EjLDOtPZqM5o5/PpGUAk59COQEm7MRZxoNn4ZLZN3EVx
	WXsGmFiXvtH2X9qO/hgG74xiLY1ajH/lPBQVU=
MIME-Version: 1.0
Received: by 10.216.144.228 with SMTP id n78mr130026wej.51.1288753830749; Tue,
	02 Nov 2010 20:10:30 -0700 (PDT)
Sender: zach.frey@gmail.com
Received: by 10.216.37.5 with HTTP; Tue, 2 Nov 2010 20:10:30 -0700 (PDT)
In-Reply-To: <AANLkTi=LRGff3rc0++-+2PAKMWLitWZWOC3TGTUO4kYQ@mail.gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
	<20101101194703.GA12018@gmail.com>
	<AANLkTi=TyPX5L5oUHYehsuvqr9FGSCaD_nj1Z8+P=8F_@mail.gmail.com>
	<20101101195748.GB12018@gmail.com>
	<AANLkTikr3k3+5fJhX9MfKF2DhSbEXn8Pa9SF0QZ6nCZ7@mail.gmail.com>
	<AANLkTimOLodSjV8+saSi1td==O7TgX1iqzJeQ=NT5mgB@mail.gmail.com>
	<AANLkTi=LRGff3rc0++-+2PAKMWLitWZWOC3TGTUO4kYQ@mail.gmail.com>
Date: Tue, 2 Nov 2010 23:10:30 -0400
X-Google-Sender-Auth: 95UDeJYYp3qhewkcWFYaIiwruRM
Message-ID: <AANLkTi=a3=QB-NGyLi5samZ2epFYGgw3_HKctN32L=vd@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Trouble compiling system-tools-backends
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
X-List-Received-Date: Wed, 03 Nov 2010 03:11:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 2, 2010 at 10:56 PM, Khem Raj <raj.khem@gmail.com> wrote:

> > A question -- is the build supposed to be using the build host's
> automake,
> > or is it supposed to be using one from its downloaded toolchain?
>
> well automake is used from the contained versions. We use the version
> from native staging which
> is the version we build. The automake installed on your host is not
> used unless you do some stuff
> with assume provided.
>
>
From
$OEBASE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r0/temp/run.do_compile.12625

                        AUTOV=`automake --version |head -n 1 |sed "s/.*
//;s/\.[0-9]\+$//"`
                        automake --version
                        echo "AUTOV is $AUTOV"

As far as I can tell, this will pick up the host, not the contained version.

Tried to understand where this is spelled out in the recipe, but not seeing
it (afraid I'm new to this).


Thanks,
Zach

