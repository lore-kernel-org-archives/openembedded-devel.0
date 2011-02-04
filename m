Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PlM4i-0000Vo-9F
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 14:51:48 +0100
Received: by iwn8 with SMTP id 8so2194111iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=enot8RUHuB6vmGNMBRvyc0Qy0GXJkUb2icx1vnbEmMs=;
	b=RJfmVuSrTK9vGwqAm7uLnyAU6H6ZAHf8Z5cIOsvELy/zKNxwvcA86bQ/BVRwCu3m9p
	gwZDyddLqGImXVLP24ljWzSpHO4JS5HWITV9UDlgZ0rZZwmIS0KDkgL0fBE3XlnmC20M
	C86DtsMT2WffY0u5RKq/G/yWetOSMbwDQok4M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jT/hu5obKe4cD9emmQX1ofxgXIfkQoXai6BBtAUwo1wMHKzuTxuwRn0iE1w9rIH87Y
	2vf+xkQ911azZFdyUBruHhlLXeFIfNqj0MSZGDLyIqhHfBF9F/FOeApO6Nz02VKYYG0/
	Ikg//3vemAQ3ILFgxgf/fihJZTpUg6GbqwO28=
MIME-Version: 1.0
Received: by 10.231.172.75 with SMTP id k11mr9874946ibz.133.1296827449883;
	Fri, 04 Feb 2011 05:50:49 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Fri, 4 Feb 2011 05:50:49 -0800 (PST)
In-Reply-To: <AANLkTi==esXejD-tuPpKQxk6dR2UmVGBSiHwtYV_5QtC@mail.gmail.com>
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
	<AANLkTi==esXejD-tuPpKQxk6dR2UmVGBSiHwtYV_5QtC@mail.gmail.com>
Date: Fri, 4 Feb 2011 14:50:49 +0100
Message-ID: <AANLkTinZgDRh9D6LRs4KSNufmBTqy5qjyQbgr6BfcO4R@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Fri, 04 Feb 2011 13:51:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/4 Anders T=F6rnqvist <a.tqvist@gmail.com>:
> These nice testing results, what are they?
> Results from the oestats server of all the successful builds?

My (eFfeM) test results are from a run on our autobuilder (using Hudson).
I manually go through the result log and update the wiki table accordingly.

http://wiki.openembedded.org/index.php/Testing#Overview

Frans.
>
> /Anders
>
>
> 2011/2/4 Cliff Brake <cliff.brake@gmail.com>
>
>> master has been merged to testing-next and is ready for clean builds.
>>
>> I realize I've been tardy in getting the testing-next going, so I'm
>> going to create a cron job now that does that weekly.
>>
>> Last week's testing results:
>>
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_2011=
-01-28
>>
>> For more information on OE testing, see:
>>
>> http://www.openembedded.org/index.php/Testing
>>
>> Thanks,
>> Cliff
>>
>> --
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> http://bec-systems.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


