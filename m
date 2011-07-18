Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qii56-0003ry-Ft
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 09:17:32 +0200
Received: by eye4 with SMTP id 4so1216257eye.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 00:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yxX5748ve4FlXuzjinkYnHMMRAL6H9ED4seNKWN45rA=;
	b=UeGPfyMbeveFAHjfaYm8ys/tW9beZRpsQDCrgmbrsDFiovJA0wOkkuG/3ndinjDTkZ
	4TlaVpdqaqGtUwh+aRoRzM5VyRGmMnt0/RE3F9dwi/fd1iDUKtc7lvz06nfK9BcZQVKI
	JOd0li4tMZlLB3K9epCmlLTUyNwyzQR0wJuXk=
MIME-Version: 1.0
Received: by 10.213.13.220 with SMTP id d28mr1045694eba.60.1310973208783; Mon,
	18 Jul 2011 00:13:28 -0700 (PDT)
Received: by 10.213.105.210 with HTTP; Mon, 18 Jul 2011 00:13:28 -0700 (PDT)
In-Reply-To: <670B4FBB-C6E9-46CD-81DA-FDD94A88A3FB@dominion.thruhere.net>
References: <CAD=GYpbJaYh9iViHjocf24z98LKnsH0Mq7cBy_9p_hULf1gYnQ@mail.gmail.com>
	<670B4FBB-C6E9-46CD-81DA-FDD94A88A3FB@dominion.thruhere.net>
Date: Mon, 18 Jul 2011 02:13:28 -0500
Message-ID: <CAD=GYpboKqsD2A1D2CX5eDC_vhrz4ctgxicE8JORdY3sVEAC5w@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Cc: beagleboard@googlegroups.com, openembedded-devel@lists.openembedded.org,
	"Kridner, Jason" <jdk@ti.com>
Subject: Re: [Angstrom-devel] Bitbake build failure of Angstrom
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
X-List-Received-Date: Mon, 18 Jul 2011 07:17:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Koen,

Nice to hear from you.

On Mon, Jul 18, 2011 at 2:00 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 18 jul 2011, om 07:16 heeft Joel A Fernandes het volgende geschreven:
>
>> Hi,
>>
>> I am attempting to manually rebuild the BeagleBoard validation image
>> using bitbake.
>>
>> For this, I used the revision found in /etc/angstrom-version of an
>> image I built with Narcissus. The OE revision I used referring to the
>> above version file is: a1f31c757d2514e946737d60789c6f9f05ce38eb (Which
>> happens to be my fix for GPIO)
>>
>> Now, when I run a "bitbake beagleboard-validation-gnome-image -k "
>
> Why are you using -k ?

Not sure if it matters? Even if I don't pass -k, the errors still show up.

Thanks,
Joel


