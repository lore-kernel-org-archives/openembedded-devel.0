Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P532i-0000g2-2e
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 23:02:54 +0200
Received: by iwn7 with SMTP id 7so1901060iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=u+wDsE5leU8x2/ZxeYD5N10NcuOfLiDrwRi38DkupEI=;
	b=HlI2kS3Y1FsRdRbHW3SjufX4yNHCMaTf2M7bC2pDOcc7Iil3hER29rlOxBgUtzQQYH
	E2YE2UwPkRIvxx1BSCpuZdkQ6ra1T1UOJYtZkZM2N2/pbFZXhmWCWeZ1K12M1Yb0kuCe
	N0P+w9XSp0V0ThJNoFI1qYvEz5jXmQmERdR1g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=CMm9i8d8QX+GjehV3F0X5H7eWCDhvQbvE5lqCRhZZpdk6jOzR2CPKwqapS1aNxFihe
	lamw5nFyUjw6V3uN7WtWGj9w5JpIrsSoyioE9MB1K57N2D0LbCzuQZhKLI0Irp6NomD4
	Od6xQrgmdXp6Y4zMnd2dt7PL8k3bsCSsW9t6U=
MIME-Version: 1.0
Received: by 10.231.168.21 with SMTP id s21mr4180628iby.123.1286744548091;
	Sun, 10 Oct 2010 14:02:28 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 10 Oct 2010 14:02:27 -0700 (PDT)
In-Reply-To: <AANLkTimCVhw4B70Be-86aSOMWnan=TOWLjjamgW4=jED@mail.gmail.com>
References: <AANLkTikXgD1ULsL7Fc3jQ45vDEH4ECqsG7s6KHRhJ1op@mail.gmail.com>
	<AANLkTi=Fry0wuBpU6eFztR98rw2KtK76LUdZs6SMuUos@mail.gmail.com>
	<AANLkTinhe7b-u+LMqXjgEZ4+3vuix0akw=6sghpZOfU8@mail.gmail.com>
	<AANLkTinTajKGotqpGp8D20BmnpDmWdfKz+a=7U2b-S--@mail.gmail.com>
	<AANLkTimCVhw4B70Be-86aSOMWnan=TOWLjjamgW4=jED@mail.gmail.com>
Date: Sun, 10 Oct 2010 23:02:27 +0200
Message-ID: <AANLkTinesaYuGL+-UECXc8X4-LcKurgnviSj9xAM4Nu6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question on writing perl lib .bb files
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
X-List-Received-Date: Sun, 10 Oct 2010 21:02:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/10 J. L. <vwyodapink@gmail.com>:

>
> Thanks a million for the time you took to respond to that! Again I am
> sorry for the confusing post I should have stopped for the day way
> before then.
>
> I will go back and do the fixes you stated and get it working better
> with the deps. I will go back and re read what it depends on and not
> put any thing thats listed as a core module. Thanks again and will
> post the working new recipe properly in a few days.
>
> JL

No problem.
We all had to learn this at some point.
Feel free to ask additional questions here or on irc.
and a good way to learn things is from looking at other recipes (and
ofc from reading the wiki and hte manual).

Enjoy, Frans


