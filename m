Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SJfny-0001fM-4V
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 08:52:54 +0200
Received: by wibhj13 with SMTP id hj13so7221109wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2012 23:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=DyWYVMPk2UkRCdo/H8B8LFxWFcT99pVa+gVrQTCpfRQ=;
	b=ssNwfejtTbQm/ZWpnnNW1CQ8yYyWE12sDHY2pvIZ48hXZzOPHAnVU/Kkt5BxD/A6WN
	/RIe2EokBNsOk53snR+3UyhE+GLFPaQlD1wcGKCtEGBfjbB1RINlXtWQraSXI8FOu+6X
	mOaNiQVPxsYD1hid0wgS/VzJ6YEmkfw6oXOYyCSOkwWUWZCnf33cnSlsXUq4E6aGHjp8
	Huvl0Jr1VNBLesFoGK6ZrVzlA2dQwefUZpFtARgx83M9hYJ7aiknfm1Oo3vBfnaMV7EV
	Z3alf6myKdE/gpmSAh7444tqowZ4zT0UEmmVewieand9wWvm3Xnt0VSq4wBt1rdS+ebM
	4Umw==
MIME-Version: 1.0
Received: by 10.180.95.129 with SMTP id dk1mr18165927wib.3.1334558609705; Sun,
	15 Apr 2012 23:43:29 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Sun, 15 Apr 2012 23:43:29 -0700 (PDT)
In-Reply-To: <4F8BA38A.9080905@windriver.com>
References: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
	<4F8BA38A.9080905@windriver.com>
Date: Mon, 16 Apr 2012 08:43:29 +0200
Message-ID: <CAGiJk9eYRp1JF4=yQ3Caj3fDtE6entd2d4_vNoYDdWncsLnwVA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-kde] enable kdelib4-native to build makekdewidgets.
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
X-List-Received-Date: Mon, 16 Apr 2012 06:52:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/16 Kang Kai <Kai.Kang@windriver.com>:
> On 2012=E5=B9=B404=E6=9C=8816=E6=97=A5 10:20, Kang Kai wrote:
>>
>> Hi All,
>>
>> The original kdelibs4-native recipe is from Samuel Stirtzel, and I updat=
e
>> qt4
>> to enable kdelib4-native to build makekdewidgets.
>>
>> Regards,
>> Kai
>>
> Hi Samuel,
>
> I had put you email as a argument for 'git send-email', but I don't know =
why
> it didn't effect.
> Cc to you.
>
> Thanks,
> Kai

Hi Kai,

thank you for your patches.
I will test them and adjust the settings of the layer accordingly.

With these patches it will be easier to build KDE, great work.


--=20
Regards
Samuel


