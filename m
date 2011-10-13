Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1REFib-0004Hw-0O
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 09:28:41 +0200
Received: by gyc15 with SMTP id 15so157193gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=MU6a2ks/pR8UND7fLoMb76mVSfr37nwNeZNhp2bje4E=;
	b=WA8Ylusjh+3v6koPT7mcjEfA2n+agNOu4Xuut13Xjd0VoRxW0dBt93LPOirPP4zsiW
	/tXVnPs5YTCRDBfAi3pmRK7+TOKFj9NqBAUnJaJi9yDGyu6emP6/UxoXSLN0ZHmf77at
	LVauZJkj6Ll2PaT2rQ6OsWv0x/VxUnWk8BU1o=
MIME-Version: 1.0
Received: by 10.236.182.233 with SMTP id o69mr3100905yhm.60.1318490572037;
	Thu, 13 Oct 2011 00:22:52 -0700 (PDT)
Sender: mgargela@gmail.com
Received: by 10.236.103.146 with HTTP; Thu, 13 Oct 2011 00:22:52 -0700 (PDT)
In-Reply-To: <4E9632B7.2010901@telia.com>
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
	<4E9632B7.2010901@telia.com>
Date: Thu, 13 Oct 2011 10:22:52 +0300
X-Google-Sender-Auth: j7IL4E-ztQk6W1cOGSUW3UBBPrs
Message-ID: <CAObi9r9qc5qwdph5QyvYw0t8+=b0+y7=W8rrfNXqLpr6djnDUQ@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Thu, 13 Oct 2011 07:28:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2011 at 3:37 AM, Ulf Samuelsson <ulf_samuelsson@telia.com>wrote:

> On 2011-10-12 14:22, mgundes wrote:
>
>>    Hi,
>>
>>    I think one of the big issue with OE is build time. It does everything
>> for you, so that it takes too much times. I want to minimize build time
>> and
>> realized that OE creates ipkgs for almost every package. If there is a way
>> to prevent creation of ipkgs it would be really good for me. In my
>> opinion,
>> it would be fine for other people too since usually rootfs directory is
>> enough and ipkgs are not frequently used directly by developers.
>>
>>    I have asked in freenode oe room but friends said there no way to do
>> that
>> in OE system. If there is no way to do that in current OE, do you plan to
>> add as a feature?
>>
>>    Thanks,
>>
>> Regards
>>
>>
> Question: What do youj mean by long build time.
>                Building everything takes 1.5-2 hours.
>                Doing an incremental build is much less.
>
> When I started, my laptop would take 42 hours to complete the build
> (Calculated, I gave up way before), but then I got a decent machine.
> If you consider 1.5 hours for the first build long, then you still have a
> problem
>
>
     If you can make it 30 minutes shorter, why wouldn't you try, it worths
I think. I wondered and asked what can I do about it, that's it.


> --
> Best Regards
> Ulf Samuelsson
>
>
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>
>


-- 
MahmutG

