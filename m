Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QipTo-0004FM-B0
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 17:11:32 +0200
Received: by eye4 with SMTP id 4so1630660eye.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HKqWUKsGUjNcx0u7BZ1k17KffbrP46Hh4QaWB/ybfZs=;
	b=ZUb9hsMkF6fciwLmdEm2BKtRvnSzkg4I5q82d1qN8oC5ip/UpCWRPmEMwYQVKhrmh8
	HDOqfNc345Ox58dYDbNH9+9teQNlVKwtY/VNL6/YqYUBo2sdk03sAXTMTnVAjbbFdSt8
	SQk2dz+hderA7bu6yTI3hVAGkKKWqdy4YeA9E=
MIME-Version: 1.0
Received: by 10.213.108.80 with SMTP id e16mr843172ebp.22.1311001257753; Mon,
	18 Jul 2011 08:00:57 -0700 (PDT)
Received: by 10.213.105.210 with HTTP; Mon, 18 Jul 2011 08:00:57 -0700 (PDT)
In-Reply-To: <BEB18489-3664-4E3B-AF0F-2F2C6D6B61B0@beagleboard.org>
References: <CAD=GYpbJaYh9iViHjocf24z98LKnsH0Mq7cBy_9p_hULf1gYnQ@mail.gmail.com>
	<670B4FBB-C6E9-46CD-81DA-FDD94A88A3FB@dominion.thruhere.net>
	<CAD=GYpboKqsD2A1D2CX5eDC_vhrz4ctgxicE8JORdY3sVEAC5w@mail.gmail.com>
	<BEB18489-3664-4E3B-AF0F-2F2C6D6B61B0@beagleboard.org>
Date: Mon, 18 Jul 2011 10:00:57 -0500
Message-ID: <CAD=GYpYcu7d+XGx2yX2adErPg-HDxgDG7JNdnsWXO+EuFny5qg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: beagleboard@googlegroups.com
Cc: openembedded-devel@lists.openembedded.org,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, "Kridner, Jason" <jdk@ti.com>
Subject: Re: [beagleboard] Re: [Angstrom-devel] Bitbake build failure of Angstrom
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
X-List-Received-Date: Mon, 18 Jul 2011 15:11:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Koen,

On Mon, Jul 18, 2011 at 2:27 AM, Koen Kooi <koen@beagleboard.org> wrote:
>
> Op 18 jul 2011, om 09:13 heeft Joel A Fernandes het volgende geschreven:
>
>> Hi Koen,
>>
>> Nice to hear from you.
>>
>> On Mon, Jul 18, 2011 at 2:00 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>
>>> Op 18 jul 2011, om 07:16 heeft Joel A Fernandes het volgende geschreven:
>>>
>>>> Hi,
>>>>
>>>> I am attempting to manually rebuild the BeagleBoard validation image
>>>> using bitbake.
>>>>
>>>> For this, I used the revision found in /etc/angstrom-version of an
>>>> image I built with Narcissus. The OE revision I used referring to the
>>>> above version file is: a1f31c757d2514e946737d60789c6f9f05ce38eb (Which
>>>> happens to be my fix for GPIO)
>>>>
>>>> Now, when I run a "bitbake beagleboard-validation-gnome-image -k "
>>>
>>> Why are you using -k ?
>>
>> Not sure if it matters? Even if I don't pass -k, the errors still show up.
>
> You're still not answering my question :)
>

I thought I'd let the build continue as much as it could to save time later.

Thanks,
Joel


