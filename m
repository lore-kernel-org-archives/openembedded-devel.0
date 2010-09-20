Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxcAW-0007EA-UM
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 10:56:13 +0200
Received: by gya6 with SMTP id 6so1386233gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=FGsbgiEJaIcVFL/tLiDHkjvPqCHsF6rgtn0U8Hbecmw=;
	b=h73md+0IlOd0CUbvEZTB356JhhT535KdSI4t5OnLFBJhS6TIzO8r8OYBtQeuWJAihU
	PYMrsaQHp5MHNSKPRtZh79ImFZqE6yZAa356ui8rURVLypgTZ++NAfPXn/qvaYLq4CeD
	sxURWoNPZNsrJ7iP6UX3nI6Fla10kz21apSIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vozpvOECx4pO5nPr6m7oR9buN+sB7DqKhC+zUYosUjUpTQCMCS9Ze2NApy7PLZ7M8s
	8ndVRGmKB6+KtzVClK+5HtKDiofPAUw3zlK6hgRjpyINAhL0/Z/MQ6x+1yJnHAxyv0fl
	87txt8hOt5DY2kC1WkZ1bX8EgtP1WC2JEuktY=
MIME-Version: 1.0
Received: by 10.100.31.13 with SMTP id e13mr9042617ane.13.1284972918027; Mon,
	20 Sep 2010 01:55:18 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 20 Sep 2010 01:55:17 -0700 (PDT)
In-Reply-To: <201009201042.49657.schnitzeltony@gmx.de>
References: <201009191753.42404.schnitzeltony@gmx.de>
	<201009191818.10882.schnitzeltony@gmx.de>
	<i772rs$2tp$1@dough.gmane.org>
	<201009201042.49657.schnitzeltony@gmx.de>
Date: Mon, 20 Sep 2010 10:55:17 +0200
Message-ID: <AANLkTindG1S3Z=WY2CVsqd0hco4qjfo-6XviHAb8N5r3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] clutter: remove COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 20 Sep 2010 08:56:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/20 Andreas Mueller <schnitzeltony@gmx.de>:
> On Monday 20 September 2010 09:35:24 am Koen Kooi wrote:
>> On 19-09-10 18:18, Andreas Mueller wrote:
>> > On Sunday 19 September 2010 06:11:39 pm Koen Kooi wrote:
>> >> That needs slightly, more, namely falling back to mesa for unknown
>> >> machines. I can have a look at that tomorrow if you wish.
>> > Yes please because I thought the fallback is already available with
>> >
>> > DEPENDS = ".. virtual/libgl"
>>
>> The last time I tried it it didn't work, time to try it again :)
>
> Meanwhile I am trying to setup something which does not create patches with line breaks ( makes me sick & yes I saw
> http://wiki.openembedded.net/index.php/How_to_submit_a_patch_for_dummies but my provider wants autentication & I have
> not yet managed to get this working for git-send-email - maybe my git is too old... )
>
> Let me know mesa fallback result..

use alpine or set up a gmail account (note that you can still use your
real email for Submitted-by)

Frans


