Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RW7p0-0000s9-W8
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 15:41:11 +0100
Received: by qadc10 with SMTP id c10so1625516qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 06:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=U+B+iNOwINeOzsNRGsJ3H4mJnL+N/yrPYFPAM8rh3wQ=;
	b=GQH6rLQuEtSAoYldt1jc2j03Je7yYKdyUNumNimAk0NZDhgHgIneBIlz8T0+x2y/NX
	bbR4etmCiyRhjh554Mi96H3z5YmK0lvCCq3FPxVX3lE/7BI5N1/5Yh2yDrPBaeueUGQr
	ipL51E+HKE4ny5ei+xactFk0r5eH6ksVGrV2Q=
Received: by 10.229.46.8 with SMTP id h8mr1358393qcf.86.1322750069233; Thu, 01
	Dec 2011 06:34:29 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Thu, 1 Dec 2011 06:34:08 -0800 (PST)
In-Reply-To: <jb7h6j$ek$1@dough.gmane.org>
References: <jb5vpp$c8o$1@dough.gmane.org>
	<20111201080837.GB17111@novatech.datenfreihafen.org>
	<jb7h6j$ek$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 1 Dec 2011 07:34:08 -0700
X-Google-Sender-Auth: Ssy-uGYz7GiuJKI0l77JsXfvvsY
Message-ID: <CABcZANmB1QQ13OnmE=6YHE=JFDU2ni21=XZkgN7_hdPUjab4_Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE-core based java layer?
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
X-List-Received-Date: Thu, 01 Dec 2011 14:41:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 1, 2011 at 2:25 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 01-12-11 09:08, Stefan Schmidt schreef:
>> Hello.
>>
>> On Wed, 2011-11-30 at 20:22, Koen Kooi wrote:
>>>
>>> Beagleboard.org has moved to the OE-core metaverse to build the
>>> factory images and we need java support to stay feature compatible with
>>> OE classic.
>>>
>>> Are there already people working on such a thing or should I just go
>>> ahead and add a meta-java to the meta-oe repo and start importing
>>> recipes one-by-one?
>>
>> Henning already did it. https://github.com/woglinde/meta-java/
>>
>> I was able to build openjdk-6 from it.
>
> I've found a common theme for this week: It works if you follow the README,
> but noone actually reads a README :)

That's one of the nice things about github -- if they go to the web
page, it's right there in their face :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


