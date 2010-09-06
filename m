Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OsiGz-0000kK-JI
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 22:26:40 +0200
Received: by wwi14 with SMTP id 14so4324175wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 13:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=m+g3DOqG4//u+P4OirFJJSc5AFhe3BIaNJJ5wKjv08w=;
	b=AfpeTbIOYL1nVF1zH4L0UU/X0OJKP4whpONdwOuGKX6kdUEBmY0IFJqaonVs9L1WzV
	wH02/xJqkbplrCZ1VHyqYWOD7HzwgeTYrPrpLcbt0TeTOsMkzafI+n0tIyil3bb014aY
	nZXRZ6lMSXBB9g6AF5qYEcnvbCgTi2httIjNA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LJWK15toJMJD755/7+M8vYBuLJdGjKCld0OL5xEVWECZ7HcW8qlgulOB1kvAJ700ru
	NAfMNZcmK0G7C7aBFuVe4fqorlYP3SdW+Cj6PV0c1OgCWXZeMiUrpTr49AkEPda7Y9b3
	Dhef9GFwhLlHhjy04fsudpr/bBTeoDc1+YLeY=
MIME-Version: 1.0
Received: by 10.216.164.199 with SMTP id c49mr334676wel.107.1283804757842;
	Mon, 06 Sep 2010 13:25:57 -0700 (PDT)
Received: by 10.216.58.197 with HTTP; Mon, 6 Sep 2010 13:25:57 -0700 (PDT)
In-Reply-To: <AANLkTi=9YbV7fVNDx44GKfe3_tcLS5pQ_D=MWTDgDv1d@mail.gmail.com>
References: <AANLkTi=9YbV7fVNDx44GKfe3_tcLS5pQ_D=MWTDgDv1d@mail.gmail.com>
Date: Mon, 6 Sep 2010 13:25:57 -0700
Message-ID: <AANLkTin0sV6Rg6OhZ_7B__TbdhkXFzpNq6uRkGi__gV3@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: NOTE: Couldn't find shared library provider
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
X-List-Received-Date: Mon, 06 Sep 2010 20:26:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 6, 2010 at 1:18 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Anyone an idea on what this means and how to fix it:
>
> NOTE: Couldn't find shared library provider for libstdc++.so.6
> NOTE: Couldn't find shared library provider for libgcc_s.so.1
>
> Today I've seen it with asterisk but I have seen it before.
>

Those were some of the errors I posted about last week or so I think
and have yet to figure out how to get rid of them though I noticed
bringing boost down a level lowered the amount I saw total over the
entire build. But not sure if my info is relevant since I am on the
overo branch of the dev tree ..

JL
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


