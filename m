Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTXKL-00067H-2M
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 12:18:49 +0100
Received: by bkbzs2 with SMTP id zs2so2647951bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 03:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=uwrXQTfyIMHV4JoBfje5Fvozi+V23rxyYIDBPVnn7fM=;
	b=fAERuw/jp97hVJGIvDekdgaVKp/2QS37ew5Qz3Sfb8s7H8VWWlwpC1iF7UqoCh2pgQ
	QN99+jdf00Ap7NKggz+JmBwwTcGPeGoLnIqHFYH6Z6Nij1T0yYBW4CIDnBScTqODwyaf
	QJf6fHZ2UP6iFR4mX3PCj9YbBd6yKRv2jITg4=
MIME-Version: 1.0
Received: by 10.205.126.13 with SMTP id gu13mr28716156bkc.114.1322133135971;
	Thu, 24 Nov 2011 03:12:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Thu, 24 Nov 2011 03:12:15 -0800 (PST)
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
Date: Thu, 24 Nov 2011 09:12:15 -0200
X-Google-Sender-Auth: yf_YMAjM91EaNesLSW-fjoWkswM
Message-ID: <CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Thu, 24 Nov 2011 11:18:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 24, 2011 at 08:23, Hauser, Wolfgang (external) <
Wolfgang.Hauser.external@cassidian.com> wrote:

> I would vote for an open classic master for bugfixing too, our project
> based on 2011.03-maintenance goes into the final phase and to switch to
> oe-core, the budged is not available jet.
>

I also believe oe-classic master ought to be read-only as soon as possible;
I understand that people are using it but the soonner we make it read-only,
sooner people will move to oe-core otherwise people will keep starting new
project on it and it will never die.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

