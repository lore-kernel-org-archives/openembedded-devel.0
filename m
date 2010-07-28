Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oe65C-0000dG-R8
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 14:50:03 +0200
Received: by bwz10 with SMTP id 10so4138014bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=uFWBZEGPiiuzQ41KqLCfJBQs1fQY4D5voeHaRPCE4Dc=;
	b=Y5VIcamd4fIlVm3Cay0XU539ewiRhbHXxf++IZw4JUKo0zkrWUF6m6dO28hXydy4pf
	O+Ibc2cEpzsVdFc4xfQlS9HW85E8M16mO8EuwtFXpRPGUtY3jufNHZ2NlYCW3+dpL6e4
	fgS60VmR1w5Kl+ScH3CjBoNL4Z47WBFWJvmao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=L0o5MQ46V0hX+NgdPpgz8gjgJEcBJcl7xS7unphACOl47NL1/ayDO0XsiCig4kCmpc
	W4eVlMVLc+6XwtbP3qm8o53uMi563J2/qF/froEtSwpeKBV0pI/b0i04lZXtkXbviTiV
	iga8fcgFleXX+H/ISyi1U6xWIn1396mXVRwJg=
MIME-Version: 1.0
Received: by 10.204.60.130 with SMTP id p2mr7805261bkh.166.1280321386469; Wed, 
	28 Jul 2010 05:49:46 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Wed, 28 Jul 2010 05:49:46 -0700 (PDT)
In-Reply-To: <4C5014FC.9040009@balister.org>
References: <4C5014FC.9040009@balister.org>
Date: Wed, 28 Jul 2010 14:49:46 +0200
Message-ID: <AANLkTinHJT+1tSSgtfLb4-g76XXgJiWryHu-pMALYT+A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Server issues
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
X-List-Received-Date: Wed, 28 Jul 2010 12:50:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/28 Philip Balister <philip@balister.org>

> As people have noticed the server at OSUOSL that hosts many of the OE
> services has been flaky for the past week or so.
>
> Basically, the primary server seems to have some form of hardware issue.
> The admins are moving the vm's to another server in a few hours so they can
> take down the server and try to figure out what is going on. Things may get
> slow, and non-essential services, such as tinderbox, may get turned off.
>
> Please bear with us will we sort things out. The lack of emails is largely
> due to the people working on the server working on the server instead of
> sending emails and sleeping.
>
> Philip
>
> Philip, Thanks for the info.

Can you please relay to the OSUOSL people that we really appreciate their
commitment and support.

Best regards, Frans.

