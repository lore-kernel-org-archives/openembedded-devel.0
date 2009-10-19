Received: from [209.85.220.225] (helo=mail-fx0-f225.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MzpwV-000223-QS
	for openembedded-devel@openembedded.org; Mon, 19 Oct 2009 12:58:26 +0200
Received: by fxm25 with SMTP id 25so5064678fxm.0
	for <openembedded-devel@openembedded.org>;
	Mon, 19 Oct 2009 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type; bh=WY0j4T21g0Z55qciZrdjywHoh+6K1RjaYe+EbFrwIvk=;
	b=EEgRyQg4gholGm/d+sVzpCc7HmaOFd3hvvsEnZYZPOvY4u+jJWTmcTHIIbY9Qgw2vP
	O1mEVCu5/whzfNfvSZo3ysmQPf1jjXPeVNiIkQz4mZtsPH9teRYpIJW16qzA1MG5RYyb
	KdqVI4INy5C3he+JipADcvh3/0EbGqcqIiu8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	b=kWQ4NDMKa0zTjnd1dk2kRd4+NGU2xcT/AxD7GcZBHcJgaxofG76TAvx8zqvN0+sczZ
	sctcBLl61Vl6Ma1wXooNoX43mxCgZEJtKLX2lk5BxvhPS95xxGJAavHMIWA2NFFxEawx
	OHOOHMQg7gDXtXO+8q6CA0XS5SHxr6gLxGb0g=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.181.151 with SMTP id m23mr369380hbg.190.1255949844692; 
	Mon, 19 Oct 2009 03:57:24 -0700 (PDT)
In-Reply-To: <1255884565.28889.39.camel@dax.rpnet.com>
References: <1255874909.28889.20.camel@dax.rpnet.com>
	<200910181616.27482.holger+oe@freyther.de>
	<1255884565.28889.39.camel@dax.rpnet.com>
Date: Mon, 19 Oct 2009 08:57:24 -0200
X-Google-Sender-Auth: bf7164200c0cc70e
Message-ID: <be7a9f3d0910190357g421b65c9s984a2cc0757dd2ce@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev@lists.berlios.de
Subject: Re: [Bitbake-dev] Bitbake Roadmap
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
X-List-Received-Date: Mon, 19 Oct 2009 10:58:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sun, Oct 18, 2009 at 2:49 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Sun, 2009-10-18 at 16:16 +0200, Holger Hans Peter Freyther wrote:
>> On Sunday 18 October 2009 16:08:29 Richard Purdie wrote:
>>
>> > Shout now if you disagree with any of this or have a better plan! :)
>>
>>
>> I like it because this way I can get my parser changes into 1.10.

I also like it; mostly because there're a lot of small improvements
that can be useful for many of us around but most of us aren't
envolved enough with bitbake to use current master in daily basis.

Please release 1.10 :-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


