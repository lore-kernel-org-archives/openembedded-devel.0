Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NYLGc-0002rx-6V
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 16:17:49 +0100
Received: by yxe5 with SMTP id 5so1028610yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 07:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=AOdjS7h5jg7LXSOkb85xRAFNblFU9H2Iwt6zq1KIFcQ=;
	b=GIU33RQQTsftviUf21g0xQnMXGXDN+YwVthniM0ZFxrwJVlZxEa5BB0hSnRNx//f9n
	f4yTUkQ3OZC4IM+zxSrR0wfK7MRCYhaJ7TxPYn/0AbhnBYFLwKTvghjjNbrTakKlHmBf
	t2SGq6OYEy5dwrE2iQ1jjC4AWZF5dCpLrkq4M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=x3x67t9lRIX93OwrPa9r+Md/iE4DzpAKIRimltP1FjVAqe5MdARASxIS2QVBkHqTiW
	WY/KYEEeBPVb328HH5/311RKR0/oMN27PBEhWmP6c+RaK4CZt+i4Vtso13jYFFkDSstj
	zVUL+ie/360SqY353sXP2mrUnQ7pyn5FPOJWQ=
MIME-Version: 1.0
Received: by 10.100.235.26 with SMTP id i26mr4040949anh.126.1264173327776; 
	Fri, 22 Jan 2010 07:15:27 -0800 (PST)
In-Reply-To: <ac9c93b11001220708tc984a38v8f9312c0bab5decf@mail.gmail.com>
References: <201001221539.21722.christopher.lang@acurana.de>
	<ac9c93b11001220708tc984a38v8f9312c0bab5decf@mail.gmail.com>
Date: Fri, 22 Jan 2010 16:15:27 +0100
Message-ID: <ac9c93b11001220715l2724a221n6bc5cb46480ecb67@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New Recipe: xmlto-native
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
X-List-Received-Date: Fri, 22 Jan 2010 15:17:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/22 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/1/22 Christopher Lang <christopher.lang@acurana.de>:
>>
>> Hi,
>>
>> please find enclosed a new recipe: xmlto.
>> Checksums attached too.
>>
>> Tested with OE from Jan 11 on Opensuse 11 building for machine "x86",
>> distro "minimal".
>>
>> Checked with oe-stylize.py.
>>
>> Chris
>>
>> http://www.acurana.de/
>
> Please provide the recipe as an inline patch, much easier to review.
> And why are you giving recipes for two versions???
>
> Frans (who does not even know what xmlto is supposed to do)

Forgot one thing: why is this native-only. Who uses this?


