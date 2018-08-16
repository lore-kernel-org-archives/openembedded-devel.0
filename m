Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 617226E688
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 15:04:57 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id b66-v6so3957310qkj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CHXh/yu32K558Sz5WZ/CaGLzpKjcgqvJFiFTX5uq1vE=;
	b=SvwgQkazTvN+RC7dgjlT5uYpgdcO3cCDIUFQozVXVN7ANPRx6Q5qoLDEsy2HLKSjhL
	9+pqzfAN3PH5csE0pKBiho1gwDE1Yofl8rCcLBfRl+Y1cRlvcn5b9kY0rrSftSwMQm/b
	MFx/EouYPqisPZ2bNk5rox1dQxe8oZnJmXr7V8qPvnY8bdkDPq5VvLlNarfbWQRHKwgP
	ufxU5ZIXc9SI5/XQY5qteeoRHDB+t8IkNviD9cWkOAYWIWO6YyTgwiR/jMkHJn3YRRLM
	DBZLB/HtWIecs6+1iaUB3lrh/r6RvoiLEO4SaMqPQ/kfx/Z9MsB5GnwF7tz4rN0BM9NV
	hoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CHXh/yu32K558Sz5WZ/CaGLzpKjcgqvJFiFTX5uq1vE=;
	b=gwZiNuKTYC3PWLoLk2KzDZpqE94yJwJza/oCg+GNPeHPZasNX0nL/NvjaCPVtkdozT
	chrx191XpWNmky8/xV6uZaUD9Tc31plF3Oil3ZfU/clQFN45Jg4AgjAfn66gAA3JjD9m
	O/8ZZVULRjTtHqENZo4hjd18hagiZYUB+VhUaDP5emofApaQUVuNcv6TvrEJ5RaaWXof
	7segBP3FaW8hGQ/TUzReIgKhh25Cxrp2kT2M/vUm6gira6qNf9vmGBfbQQBoppbtu0iC
	j3PA0hznwy5mRXh7ryXSZjKXILPPDrgspvmXHZ07d5BzU4urLhsx4DdL9WASvtZjMEBA
	w/ig==
X-Gm-Message-State: AOUpUlHftV6FtKvH7do4FSG6CeEPtIKZ/EGPAM5INOaaABIrzrY2q1CC
	UDZTBIdXCK95IN+UUb9WoBABXiuk8bHfyWZK05s=
X-Google-Smtp-Source: AA+uWPx4hv633zfhk2idO8QsmsBNjch7UBPfKWYVaZkQ6LXvdrpWl3S0SLv4gF3f1UYPrUvzpKBE0+l7wWhpCw5ESO4=
X-Received: by 2002:a37:4a94:: with SMTP id
	x142-v6mr27523534qka.110.1534431897963; 
	Thu, 16 Aug 2018 08:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNRr7118-2whFfsWw-KbaT23bCKmp4J-HmyBZMFWw750Bw@mail.gmail.com>
	<CAMKF1sr2se=QBu8UjieWGXUPT=Jyj3PesogniqK-F6BnzsrWZA@mail.gmail.com>
	<CAGCTLNTSwV=ozB7gCX+G4QqTyiR8aVC=kPHvLL0J2VZGPDwJuQ@mail.gmail.com>
In-Reply-To: <CAGCTLNTSwV=ozB7gCX+G4QqTyiR8aVC=kPHvLL0J2VZGPDwJuQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Aug 2018 08:04:31 -0700
Message-ID: <CAMKF1sonVk1mM3990_ZcHTsVfeZc+ZNaL+8TMu-doGX4q0BALA@mail.gmail.com>
To: Mohamed Dawod <mhm.dawod@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [qt5]: qt5 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2018 15:04:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 7:37 AM Mohamed Dawod <mhm.dawod@gmail.com> wrote:
>
> where i should use -platform wayland ?
> did you mean when i run the application, i need to add this suffix to the app name ?
>

yes
application -platform wayland

> On Thu, Aug 16, 2018 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Aug 16, 2018 at 6:26 AM Mohamed Dawod <mhm.dawod@gmail.com> wrote:
>> >
>> > can i run qt5 apps on image that support wayland weston without x11 ?
>> > and how ?
>> >
>>
>> add qtwayland to IMAGE_INSTALL and use '-platform wayland'
>>
>> >
>> > --
>> >
>> > Mohamed Dawod
>> > Computer Engineering Department
>> > Faculty of Engineering
>> > Cairo University
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
>
> Mohamed Dawod
> Computer Engineering Department
> Faculty of Engineering
> Cairo University

