Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NO7T0-0006t8-6y
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 11:32:21 +0100
Received: by ywh8 with SMTP id 8so8657043ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2009 02:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/iMDA+1JkrGlz/5PPBHMTnlIA7VA79drwHzoXULXIpM=;
	b=XWcXSMUUvXEV/aWRes1th4wOJmn45z8Ktt7a3ItnmnS5JIHMtj+TYDA/DCZfVx42zi
	zZIuKtb2EwinFlwv0NeyDO6/YGJuXpnGoUBnghHE6BGn7C0e+ucIgQ6ggFMdok4Jk18x
	rUra7QB4QcLaXzRS7zYY2q3ArjcVSjMtx5m04=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=T0Hj9e2pkxEkTGFStiBD1PIxY/1TwptHoe/xKIKayPE0p379WI22AoFnUnzD+Y/kV2
	xaYc4H029yjUcWW9jLChCkOIuvwlgkVyzl1c0AfzwJkIQEH5oqqt9PYgfVP8y+ja8tfa
	ObGV7zMTqwrknticMHm3INBTp+blcexWsAqcY=
MIME-Version: 1.0
Received: by 10.101.5.27 with SMTP id h27mr7792338ani.12.1261737023369; Fri, 
	25 Dec 2009 02:30:23 -0800 (PST)
In-Reply-To: <ac9c93b10912250045s25e7e99di6321cbd02364362c@mail.gmail.com>
References: <mailman.5915.1261661037.5853.openembedded-devel@lists.openembedded.org>
	<555454227.741261683762051.JavaMail.root@aphid.buglabs.net>
	<ac9c93b10912250045s25e7e99di6321cbd02364362c@mail.gmail.com>
Date: Fri, 25 Dec 2009 11:30:23 +0100
Message-ID: <ac9c93b10912250230v6acd28f4g40632a1960352ec6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Eclipse tools (OTE) wiki page complete.
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
X-List-Received-Date: Fri, 25 Dec 2009 10:32:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/12/25 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2009/12/24 Ken Gilmer <ken@buglabs.net>:
>>
>> Hi!
>>
>> =A0I've finally finished the first pass at documenting OpenEmbedded Tool=
s for Eclipse (OTE) on the OE wiki. =A0Please have a look if you're interes=
ted:
>>
>> http://wiki.openembedded.net/index.php/OpenEmbedded_Tools_for_Eclipse_%2=
8OTE%29
>>
>> =A0Any suggestions on categories and other ways of linking this content =
in with the rest of the wiki?
>>
>
> Ken,
>
> Great work, did a quick peek at the page and it looks very nice!
> I'll try it out later and if there are issues I'll definitely get back to=
 you.
>
> Frans
>

Dah. Stuck. Freshly installed eclipse 3.5, added the update site, when
I go to install software nothing appears, but sometimes after fiddling
around a little bit I see bitbake. I can select it, however the
buttons to install it do not become active. Only cancel is there.
I would suggest adding a few lines on how to actually install the
stuff in a fresh eclipse version.

FM


