Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id E7A3C6FE1D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 20:50:29 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id 29so2063651yhl.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 13:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=2GWlKTM60hT3v0jj+evney7tfWVWAY6hEvDXHzoVag0=;
	b=MKLkblP27ahwJ+PdDSzDBxPcYIVSUvxpw5SBFwvxON62dNqq/3xaiWlojXsfpskYPI
	pwce1KmGHgL+DnvqYqWVTHTEB7kbVXog1sq6c4felTjaGSadWB2n+MYCguJcSj21nTKb
	LbLxCgJNyl86Uj7BTjkgg7gAXoaZCFJN99UlBXaUX66Zv70lrUHG2RylVBrpAaaPTQmv
	70e4sapIBWetJPeWN0D/vrVbIasYJmkfW6ZjiV8X64pK+tC5bMgbsP+c/Y2ItUhP/rZs
	SGjkmG/C0OPNbISY+nj48BlNK+VZV96MAzDrPhNayH9HdsxonTo37/nwQzBbsVY4IMac
	O+Lg==
MIME-Version: 1.0
X-Received: by 10.236.35.4 with SMTP id t4mr24261908yha.155.1401483030220;
	Fri, 30 May 2014 13:50:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Fri, 30 May 2014 13:50:30 -0700 (PDT)
In-Reply-To: <CAAPegz09QsB8utLQyStZgVyb7ZttbcvNbfMqMDJvLzjar9Hkwg@mail.gmail.com>
References: <CAAPegz1HGg34=2kp7DUj8hOR3dmc1QtVe+hFvQPVoNhz5ptTeg@mail.gmail.com>
	<CAP9ODKppar=6rRFF0Vb+TQL3e+XZgirCfdMWXSN7cviQVBAFSg@mail.gmail.com>
	<5388EB65.5000305@mlbassoc.com>
	<CAAPegz09QsB8utLQyStZgVyb7ZttbcvNbfMqMDJvLzjar9Hkwg@mail.gmail.com>
Date: Fri, 30 May 2014 17:50:30 -0300
X-Google-Sender-Auth: xoI-MpQgkHKrpVMIxIefRvWZ6mk
Message-ID: <CAP9ODKqbpcqaCNCuK-67dLiqt63kgDqGq4Gq0UM8Wrfkuh4fnA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/2] dfu-util cleanup
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
X-List-Received-Date: Fri, 30 May 2014 20:50:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 30, 2014 at 5:44 PM, Chris Morgan <chmorgan@gmail.com> wrote:
> On Fri, May 30, 2014 at 4:34 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> On 2014-05-30 14:29, Otavio Salvador wrote:
>>>
>>> On Fri, May 30, 2014 at 2:14 PM, Chris Morgan <chmorgan@gmail.com> wrote:
>>>>
>>>> Add a recipe for building 0.7, remove old 0.1 recipe.
>>>
>>>
>>> I'd prefer this in a single commit.
>>>
>>
>> I think he did it this way because of the [slightly confusing]
>> version 0.4 that is still left in place.
>>
>> --
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> Correct.
>
> I'm not introducing 0.7 to replace 0.1, I'm introducing 0.7 so I'm at
> the same rev as my Fedora box. Just happened to notice that 0.1, which
> is super old, was still present so thought we might remove that.

Great; makes sense.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

