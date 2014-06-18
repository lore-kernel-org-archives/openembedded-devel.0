Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id D234E6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 11:27:22 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f10so464278yha.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=8VrSzwR3+yucb1x9QpVJl0HkkY7kNUlniVUU+2PdizY=;
	b=1KHHUQ+wvkYrwukK4+gAh3pP3wz9QjZXaOPjnIriuL7FjlR3GerH0JH9eiRN7Nly7k
	Te4k1bo4NdqsxBfrPjd+CLr/BW1e8FkyVbmKckcw0ysgOWH6C86pwvM8usqOEEPUk5gV
	m9ye/FM86/hexLy2uxx0Drw4ffNbf4PkyAK/UC1e/EVEY4vHU0FKIHAQM0HIsTMgHsl+
	m2p/7zpJlovwAks0DqK5nlfDNX68/2G9FUZcI13WZ0zEEB/r3de4v5QxIn7ASd7MqOJY
	OFaluf/m1S9i3dJPMK0ucf+o/geV5x6fv2AlzoxYm83WEweq+Uc9cLDcfajIUx2UTswb
	qW4w==
MIME-Version: 1.0
X-Received: by 10.236.142.13 with SMTP id h13mr3324169yhj.155.1403090843940;
	Wed, 18 Jun 2014 04:27:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Wed, 18 Jun 2014 04:27:23 -0700 (PDT)
In-Reply-To: <CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
	<20140511145337.GE22774@jama> <20140616134850.GP2428@jama>
	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>
	<CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>
Date: Wed, 18 Jun 2014 08:27:23 -0300
X-Google-Sender-Auth: NieLdvfJsbI01-rAhZ45nWTXJok
Message-ID: <CAP9ODKr1QTT++D-iiAwT5LgftiZdmzT34xMM_2dkHF5Ti99KnA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jun 2014 11:27:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 17, 2014 at 10:32 PM, Cliff Brake <cbrake@bec-systems.com> wrote:
> On Tue, Jun 17, 2014 at 4:55 PM, Otavio Salvador <otavio@ossystems.com.br>
>
>> I didn't find any. Or are you preparing a list to send?
>>
>>> Can anyone please volunteer and send README update patch?
>>
>> Is anyone willing to take it? I can help but I don't want to be the only one.
>
> I'm willing to help as well.  I started a branch to merge:
>
> https://github.com/cbrake/meta-openembedded/commits/daisy-to-merge
>
> Let me know if anyone else has ideas for README, etc.  Otavio, perhaps
> you can add your email to the README's as well (assuming this is what
> Martin had in mind).  Thanks.

Are you willing to take meta-qt5 too?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

