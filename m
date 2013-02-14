Received: from mail-wi0-f181.google.com ([209.85.212.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U5wN3-0001yw-HC
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 11:48:59 +0100
Received: by mail-wi0-f181.google.com with SMTP id hm6so2525073wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 02:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=0X4yJMOwQCUJ95PvnZiB1R4oPpfBkPWyGzpfvNLGHRw=;
	b=QUwLNBzBuSA863sCTTJwUjRO3mauwqzgMo6iDBY1PQ8Kd4jmV5tETgRz2ZPLJYl5hI
	Md/4rK5QbNFz1b1jTE/fYci1uRkkbz3h45OfstHq046J+i2TyBIdFycLzLPhuRyn0xDb
	02iDWCyoUCrw3YTMBxWzepz7czH8EuQHAHsF106nJ3iQEvpxGwVofpE/AZ3ZEkkqtvO/
	UBbhjkZjtqd6tPq/txVQV7OsSdjOAHcDpSQECNUoDCkTsZroZ3sToyv8m/+xjLCNFgXm
	aIVnNl11TT+4uLQsPcZokipF5q9S/mj6mNc1SHCJkmCca/ufcpiOzFRfrcIK5v83gtfE
	5Ltg==
MIME-Version: 1.0
X-Received: by 10.194.91.211 with SMTP id cg19mr5220552wjb.43.1360837969118;
	Thu, 14 Feb 2013 02:32:49 -0800 (PST)
Received: by 10.217.3.136 with HTTP; Thu, 14 Feb 2013 02:32:48 -0800 (PST)
X-Originating-IP: [203.193.158.21]
In-Reply-To: <511CB7DD.4080407@communistcode.co.uk>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
Date: Thu, 14 Feb 2013 16:02:48 +0530
Message-ID: <CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQk/SXV3KftKdiwEGOXKw87xw8WB+5Gpoz86lCQ2/9Va2nOh+nyo64/jYyWK2Z1MJkWnlmWi
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Thu, 14 Feb 2013 10:49:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

I dont want to use that classic thing and get extinct..

I'll go with openembedded-core as you say..

I followed the steps for oe-core given in this link
http://developer.toradex.com/software-resources/arm-family/linux/source-code/linux-%28colibri-t20%29-openembedded

And I'm getting the following errors

ERROR: There is a confusing multiline, partially commented expression on
line 45 of file /home/hc/oe-core/build/../stuff/meta-toradex/recipes/images/
angstrom-lxde-image.bb ().
Please clarify whether this is all a comment or should be parsed.
ERROR: Unable to parse
/home/hc/oe-core/build/../stuff/meta-toradex/recipes/images/
angstrom-lxde-image.bb: Exited with "1"
ERROR: Command execution failed: Exited with 1

Bare with me please.. I'm blind here..

On Thu, Feb 14, 2013 at 3:39 PM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On 14/02/13 10:01, Sankar H Malarmani wrote:
>
>> Hi Jack Mitchell,
>>
>> Thanks for your reply..
>>
>> openembedded-core is what you are referring as new openembedded. right?
>>
>
> Correct.
>
>
>
>> I'm trying to build a linux image version which could be done only using
>> openembedded-classic..
>>
>
> What processor support do you need?
>
>
>  And these errors i'm stuck on with are dealing with
>> gtk+ installation and versions.. I could figure out what I'm doing wrong..
>> Can I get your help here please ???
>>
>
> Unfortunately(?...) I have not bee here long enough to have ever used
> oe-classic.
>
>
>
>> And please refer me how to get started with new oipenembedded.. I'll have
>> a
>> go at it..
>>
>
> There are a plethora of docs available here: https://www.yoctoproject.org/
>
>
>>
>>
>> On Thu, Feb 14, 2013 at 3:05 PM, Jack Mitchell <ml@communistcode.co.uk
>> >wrote:
>>
>>  On 14/02/13 05:08, Sankar H Malarmani wrote:
>>>
>>>  Hi All,
>>>>
>>>> I'm tryin to build a linux image by using openembedded classic. On
>>>> giving
>>>> the bitbake command I'm getting the following errors.
>>>>
>>>> failed to load "./apple-red.png": Couldn't recognize the image file
>>>> format
>>>> for file './apple-red.png'
>>>>
>>>> ERROR: Function 'do_compile' failed (see
>>>> /home/hc/oe/output/work/i686-****linux/gtk+-native-2.24.8-r1/****
>>>> temp/log.do_compile.11738
>>>> for further information)
>>>> ERROR: Task 6157 (virtual:native:/home/hc/oe/**
>>>>
>>>> stuff/trdx/recipes/gtk+/gtk+_
>>>> 2.24.8.bb, do_compile) failed with exit code '1'
>>>> ERROR: '/home/hc/oe/stuff/****openembedded/recipes/eglibc/**eg**
>>>> libc_2.12.bb<http://**eglibc_2.12.bb <http://eglibc_2.12.bb>>'
>>>> failed
>>>> ERROR:
>>>> 'virtual:native:/home/hc/oe/****stuff/openembedded/recipes/**
>>>> gobject-introspection/
>>>> gobject-introspection_1.29.17.****bb<http://gobject-**
>>>> introspection_1.29.17.bb <http://gobject-introspection_1.29.17.bb>>'
>>>> failed
>>>> ERROR: 'virtual:native:/home/hc/oe/****stuff/trdx/recipes/gtk+/gtk+_**
>>>> 2**
>>>> .24.8.bb <http://2.24.8.bb>'
>>>>
>>>> failed
>>>>
>>>> I'm a newbie to this openembedded stuffs..
>>>> Please guide me to solve this issue.
>>>>
>>>>
>>>>  Is there a reason you are using OE Classic? If not, then transfer to
>>> the
>>> new OpenEmbedded, OE Classic has been EOL for a long time now.
>>>
>>> Regards,
>>>
>>> --
>>>
>>>    Jack Mitchell (jack@embed.me.uk)
>>>    Embedded Systems Engineer
>>>    http://www.embed.me.uk
>>>
>>> --
>>>
>>>
>>> ______________________________****_________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.**ope**nembedded.org <http://openembedded.org><
>>> Openembedded-**devel@lists.openembedded.org<Openembedded-devel@lists.openembedded.org>
>>> >
>>> http://lists.linuxtogo.org/****cgi-bin/mailman/listinfo/****
>>> openembedded-devel<http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel>
>>> <http://**lists.linuxtogo.org/cgi-bin/**mailman/listinfo/openembedded-**
>>> devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>> >
>>>
>>>
>>
>>
>
> --
>
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   http://www.embed.me.uk
>
> --
>
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>



-- 
Thanks & Regards
*Sankar*
*
*
*
*

