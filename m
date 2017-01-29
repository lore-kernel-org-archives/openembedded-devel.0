Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9496FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2017 01:14:24 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id f2so27775011uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 17:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=HI4uL146W3oo+0xcbjExQOxaBhPZw32nGS3ROSKmLq0=;
	b=M4xymGXdhuottPaeWgQ8bIhIx8+kM+365RemVALCZIDrnveLT7LS4d7YMCvM+rA63B
	1rtUsFb5rVWgcO2RcCxDez7ZvDDN/66xzLyeKd2IpVaislLU+4zh9njE41pb+1N+zfxF
	WmKt0C+/tgBiUBs4s2S0sfGrlN1BvsBSuC3wE2AHEwrlsvLw4Qfy93oEvcjVG8JSrEpd
	q/1aqtMQfh3g/AAVtcVtXbQAyeb4xXmMYTW9cK2ubtjSBWZJuxJpXAADuy9pnpqCEXGw
	ALK425LUZqZUliFjSgJQ7newtYAkiuIJwj0c9cQ3PJqTluabCU2ppnyVYyoxHyNx0nWW
	U53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=HI4uL146W3oo+0xcbjExQOxaBhPZw32nGS3ROSKmLq0=;
	b=HXU7oucTMKinaxcw/mQT6B7wnFm6pWKJZbHqCYfg3AqDQRivjlkLM/WsodlUfGir3v
	v6Ib/LbuE+eeweJrThOjtKtmlESlssgJ0fvlWqJn4c+UBrdlhL87OgbzuFLN6ucSTWLv
	RXJrEmT7QoTIIb24yU0SuI/3rBvHqmPrE3GUWY/XQk9ReczSS5ZW71GBSJ8pZY6OcfN2
	ig6B9ZX452xhPN0N0VbLzWKtUVktyphiW4TWeYDQduAxRuuHvnL1p/y0r3WaNVPkeqsg
	NnHYb7r1EkFpFnok0DH+V4cXUqXkKQVXvlvnOTy/m73veigwatuSyiMxVqpvazB0yFVK
	IBFw==
X-Gm-Message-State: AIkVDXJ1VaZ4xrjww1Cm+GiVBFGCM6rp/srNBtlQIxhLzDAWg6H/Auweb6CFYB/HooycczoD5bXIawgBpcezXw==
X-Received: by 10.176.83.218 with SMTP id l26mr6787728uaa.69.1485652461128;
	Sat, 28 Jan 2017 17:14:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Sat, 28 Jan 2017 17:13:50 -0800 (PST)
In-Reply-To: <1F119876-0AF6-4918-AE7A-0C2809A0C5C9@neuf.fr>
References: <1485356812-8436-1-git-send-email-jaragunde@igalia.com>
	<008601d27798$272e3640$758aa2c0$@neuf.fr>
	<8c7129f5-43e3-3b2d-f4e9-9dfbad7e6ebc@gmail.com>
	<a5a24703cc0a4dd6be923dac9cc6e129@XCH-ALN-008.cisco.com>
	<529a997b-8ebf-28c7-5dad-1411de15dcf7@gmail.com>
	<1F119876-0AF6-4918-AE7A-0C2809A0C5C9@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jan 2017 17:13:50 -0800
Message-ID: <CAMKF1srK12QsoH0Xw_68U5EgJ37B2fTMPWK_SKPQ-Cwy=mh5NQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: ***SPAM*** Re: [meta-browser][PATCH v2] chromium-wayland: update to 53.0.2785.14
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
X-List-Received-Date: Sun, 29 Jan 2017 01:14:25 -0000
Content-Type: text/plain; charset=UTF-8

Hi Herve

Yes please send a V2 with suggested changes.

On Sat, Jan 28, 2017 at 7:05 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
> Hi Khem,
>
> Shall I generate a proper patch with the proper header? Or should Jacobo add that to his patch?
> I'm not even sure the patch is accepted on master yet.
>
> Cheers,
> Herve
>
>> On 28 Jan 2017, at 01:51, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 1/27/17 6:06 AM, Julien Brianceau (jbriance) wrote:
>>>> -----Original Message-----
>>>> From: openembedded-devel-bounces@lists.openembedded.org
>>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>>> Khem Raj
>>>> Sent: vendredi 27 janvier 2017 02:47
>>>> To: openembedded-devel@lists.openembedded.org
>>>> Subject: Re: [oe] [meta-browser][PATCH v2] chromium-wayland: update to
>>>> 53.0.2785.14
>>>>
>>>>
>>>>
>>>>> On 1/25/17 9:50 PM, Herve Jourdain wrote:
>>>>> Hi Jacob,
>>>>>
>>>>> I've been able to compile chromium-wayland 53.0.2785.14 on
>>>> RaspberryPi, with Wayland only (no X11), BUT I had to add an additional
>>>> patch for it to work, or else I get an error in
>>>> ui/events/keycodes/keyboard_code_conversion_xkb.cc.
>>>>> I'm using VC4, which has a DRM/KMS interface (it seems that DRM
>>>> interface is required by ozone-wayland), but this patch seems to not be
>>>> related to RaspberryPi itself.
>>>>> Basically, it seems that USE_XKBCOMMON is not defined when compiling
>>>> keycodes.
>>>>>
>>>>> Is it something that you saw as well? Or do you have a different
>>>> setting/experience?
>>>>>
>>>>> Just for reference, here is the patch I need (right now, I'm
>>>> triggering it from meta-raspberrypi, but I believe it may be needed in
>>>> meta-browser).
>>>>>
>>>>> --- a/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>> 19:12:01.767271256 +0800
>>>>> +++ b/ui/events/keycodes/events_keycodes.gyp    2017-01-23
>>>> 19:12:11.503048216 +0800
>>>>> @@ -21,6 +21,9 @@
>>>>>         'scoped_xkb.h',
>>>>>         'xkb_keysym.h',
>>>>>       ],
>>>>> +      'defines': [
>>>>> +        'USE_XKBCOMMON',
>>>>
>>>> This seems fine to me. It should also be proposed upstream as well I
>>>> think.
>>>>
>>>
>>> For the record, I've already tried to upstream a similar change (see Patch Set 1 of review https://codereview.chromium.org/2239833003/), but only the GN part has been accepted as gyp support has been removed in Chromium 54.
>>>
>>
>> thats we should make a note of this in patch header. We will have to
>> remove it or replace it as well when we upgrade chromium.
>>> Julien
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

