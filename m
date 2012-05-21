Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWVOH-0004o2-Ha
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 18:23:25 +0200
Received: by eekd49 with SMTP id d49so1602963eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=mOekoprDYZhbJwYImVh2AuS0+ADAdCvlAkX7aPzA4PE=;
	b=qgjVfg0Abgh1/DUZhqxg+AbFrbv87oJdwOi1/uoY1la+so6eOYvzDYzN67SRMft5l6
	fHTmcN3Klfl+LigNdYlSMeo7ZQWsEBGhj/0UpmpcHzumyXziTwz4//6tBVvqCYDx193e
	3YZ/aGQ1UosYK8x/HsjdWMffql6LVK1Fc/JPhn31OpDngqyxcG2HB95DXpypWg0z/PSB
	9k06kmqDubWGpoKKbi/8xTx/wtbAhyZxVyUYlXT/L5E7ljoYpvuIuTS14qaTAf99c85c
	SHvJ3nLCC8/obl8a7Yq/8HXMV7LzHEypl4t0GNct19Y/KcO+tuHyNCX4hgojc/wOdmVW
	ghIg==
MIME-Version: 1.0
Received: by 10.213.28.195 with SMTP id n3mr1476699ebc.122.1337616798085; Mon,
	21 May 2012 09:13:18 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Mon, 21 May 2012 09:13:18 -0700 (PDT)
In-Reply-To: <4FBA4C26.8070601@nedap.com>
References: <4FBA4C26.8070601@nedap.com>
Date: Mon, 21 May 2012 09:13:18 -0700
Message-ID: <CAMKF1sr2SEBY0_e4nwoUYeZ-vUxZtXz4S3RHy9rgHBes4n-NAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: update from 2010.12 to 2011.03
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
X-List-Received-Date: Mon, 21 May 2012 16:23:25 -0000
Content-Type: text/plain; charset=UTF-8

On Monday, May 21, 2012, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> Hi everybody!
> I have this device in the field with 2010.12 installed (glibc)
> Suppose I'm going to upgrade it to 2011.03 (eglibc).
> Is this possible at all?
> Or should I stay with glibc based packages

Glibc and eglibc are totally compatible so I don't see a reason why it
won't work you will see ant upgrade related
issues as you would see if you were to upgrade from say glibc 2.10 to 2.1

> Thanks,
> Jaap
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

