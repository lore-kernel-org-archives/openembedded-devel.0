Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 817F76BC26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 13:28:15 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id es20so4739308lab.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 06:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ik5yUvzQWC8o4NOWSO2a6QrUa/TRcrr14hOZd57BfAE=;
	b=LIzNXBqYNgs+dSAZPxhdg52DO87GWhTzBa3so3lxq6EQUcEpP0aCR2ug5USZGqmaMD
	y+0Uwqo29sf3ni91bjsBTFlQg4aZjyFRGXxtV4pEiXZIy4rTD+EHxbPTNgxTY0wfAcS6
	JLlkQIqfgX7HR92BTW402db1WdGN38A0tujqhihKoBZY7M7tyESIW8ZLNVfHl67VLcVw
	8jlVMbrXeSPCRtBrDVSOlj19Hkc3UFDrMs+f6paBv5n0X4+CBQfHVHRPFPzNp6dTjEj4
	bK85rwHE+SNLkpKXG/rabby5szYzo/kA+Ai/FNDvpCfy0sH1LQuOdpn0Aq6u4M66fROR
	0cAA==
X-Gm-Message-State: ALoCoQneJSHRsIeQafsZ7k2/CkLBAGD3dVvWbLojjvSxEXxgTGtucGzr4XgoYVLjNQ2yeyeZErBl
MIME-Version: 1.0
X-Received: by 10.112.156.103 with SMTP id wd7mr292852lbb.48.1377696495374;
	Wed, 28 Aug 2013 06:28:15 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Wed, 28 Aug 2013 06:28:15 -0700 (PDT)
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A016C6C00@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1377589711-14948-1-git-send-email-b40290@freescale.com>
	<CAGNsrLC=F+urFnDux=ZB1RSez3jF7err6KEqV3zcBj_x6pXEqA@mail.gmail.com>
	<CA452391058F6D4E9715FB2C29D9312A016BC265@039-SN2MPN1-023.039d.mgd.msft.net>
	<CAGNsrLC9ZP5seQjwsvb=Py0QE6-fVy8FnRSV7NWxwz9bAS+EUA@mail.gmail.com>
	<CA452391058F6D4E9715FB2C29D9312A016C2499@039-SN2MPN1-023.039d.mgd.msft.net>
	<CAGNsrLCU8_+o1GPH+QwNvncNANfd-61nd+kFjnOPhGxkScUF_w@mail.gmail.com>
	<CA452391058F6D4E9715FB2C29D9312A016C6C00@039-SN2MPN1-023.039d.mgd.msft.net>
Date: Wed, 28 Aug 2013 16:28:15 +0300
Message-ID: <CAGNsrLDQXQOEnwwU6DANCnBHyU3WEHR124U7AZ6mwcJ8iYnkCQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH ] libhugetlbfs: add recipe
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
X-List-Received-Date: Wed, 28 Aug 2013 13:28:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 August 2013 15:32, Luo Zhenhua-B19537 <B19537@freescale.com> wrote:
> Sure, I can do it.

awesome! thanks.

> Best Regards,
>
> Zhenhua
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Fathi Boudra
>> Sent: Wednesday, August 28, 2013 1:39 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-oe][PATCH ] libhugetlbfs: add recipe
>>
>> On 28 August 2013 08:21, Luo Zhenhua-B19537 <B19537@freescale.com> wrote:
>> >> -----Original Message-----
>> >> From: openembedded-devel-bounces@lists.openembedded.org
>> >> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
>> >> Of Fathi Boudra
>> >>
>> >> On 28 August 2013 05:56, Luo Zhenhua-B19537 <B19537@freescale.com>
>> wrote:
>> >> > Hi,
>> >> >
>> >> > libhugetlbfs should be moved to a common layer, since it can be
>> >> > used by
>> >> other BSPs
>> >>
>> >> agreed.
>> >>
>> >> > except linaro.
>> >>
>> >> what do you mean by "except Linaro"?
>> > [Luo Zhenhua-B19537] I mean libhugetlbfs recipe is maintained in meta-
>> linaro layer.
>>
>> It make sense to get rid of if in meta-linaro and move libhugetlbfs in a
>> common layer where it can be used by everybody.
>> Now the question is who's doing this work? I suggested that you'll do it
>> since you've submitted libhugetlbfs inclusion.
>> However, if you don't want to do it, fair enough, I'll take a look to
>> make it generic and will propose patches.
>>
>> Thought?
>>
>> Cheers,
>> Fathi

