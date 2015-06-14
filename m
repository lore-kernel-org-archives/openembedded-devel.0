Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 48D3373306
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 15:44:44 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so48940333ieb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=1AN3uvbc5kQ9S1mST9cxqEGAR1KmgtCeoo+zIwzmJY0=;
	b=rVzlynQHDTHHLIyCcUv2GV7gx5rQ5apw0jjxAWiSCf5nuocVYsu3MhoLXtrvhZF72h
	8FpnyfZFqzfX0dNNRiMZwwfFt90dsHVrABDc+Uja0as2UrtjJ4wgsGHullG9K23z843g
	9fe6rPKzQXZk7Fr3X2DLfbTRdD/KG5KmrOJNoARrgPnMS01Jt+IGsmb76X8fzV1qIMKl
	Po9uxGsYumRqDDseyLjUa9NzEHy0N/nh1ZVrvCjXzY2/eURsqLiyoje3HaWwf+W2KeDj
	y/RdFUIi71fHShAcgWIyU4Np3P9zmJCAck0xsOruQ5lAoJBlzwClwPh7ggISzdP5Agwk
	DmbQ==
X-Received: by 10.107.10.89 with SMTP id u86mr29252542ioi.79.1434296686108;
	Sun, 14 Jun 2015 08:44:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sun, 14 Jun 2015 08:44:15 -0700 (PDT)
In-Reply-To: <55765787.8020403@windriver.com>
References: <1433032319-13061-1-git-send-email-kergoth@gmail.com>
	<CAMKF1srmP=02oMEvuNMPbsdd5u3vvc6fv_QmOtL07ydUTuDC0Q@mail.gmail.com>
	<CABcZANnBy7iruPexD8Skf7zXxCHhNg0s4Nru89AniW=uvO-fhA@mail.gmail.com>
	<55765787.8020403@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jun 2015 11:44:15 -0400
Message-ID: <CAMKF1sr=1ObDdxcxoMH5XuSoXUT=1TrHZjAGxbuSJE4Z+dgLdQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] ntimed: add recipe to meta-networking (git version)
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
X-List-Received-Date: Sun, 14 Jun 2015 15:44:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2015 at 11:03 PM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
>
>
> On 06/09/2015 10:38 AM, Christopher Larson wrote:
>>
>> On Mon, Jun 1, 2015 at 1:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Sat, May 30, 2015 at 5:31 PM, Christopher Larson <kergoth@gmail.com>
>>> wrote:
>>>>
>>>> Ntimed is an unreleased ntpd replacement being sponsored by the Linux
>>>> Foundation. Currently it only includes a work-in-progress client, but
>>>> for
>>>> future use this recipe emits an ntimed-client package and an ntimed me=
ta
>>>> package which will pull in client and server.
>>>>
>>>
>>> should it have RCONFLICTS with ntp ?
>>
>>
>>
>> Probably, I=E2=80=99ll look into that as well as see about adding a serv=
ice file &
>> startup script, and re-submit after testing that. Thanks.
>
>
> FYI, it had been merged.

Still a followup would be nice if its needed.

>
> // Robert
>
>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

