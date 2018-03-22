Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 276737891A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 20:47:42 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id t127-v6so3409319yba.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SO7m8oCQde/gFVOP7j2DaEfYwvIc1tOXjn+c+NSc13I=;
	b=jIc7+hQSDGoI0HLMcBWOMkYrpDqQvB143h0mkLx7B4YMsCjWRi5xbr/jID0ldhBO51
	at/Wiiu8KYhUP552gvnOTQpqIODnWkwSe3xNh+ywwn6psydoNjLJXKLlcqETAM37jMd9
	C+p2Uk3OpdSmluPUbs9DE3ADXoUIuVUHQmZcfDLh71zU59DskAguWh6Xs7mERViUbQFB
	tOlLo3Cn2zItuY6r7LQRSlv50qhpaVCg1rgKPQpHbFdoS3/3ONbLQBVQy8LtURo7x2aC
	jGeBtZWmlCSxrVeKy5A3vlxyqjQ6STvu2K/Ln+wHsEGG2FM/2JZfaTpRqHjnHyTkqg0I
	BrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SO7m8oCQde/gFVOP7j2DaEfYwvIc1tOXjn+c+NSc13I=;
	b=rn3Zzk2ZThvINeavPqdeneR0porj/FDVjLeKT97bsF/KJkX2/9s4vuKmFTRG2rd7c9
	C8pYZ5UhZi9RRgVALrCgXev+xiQhh5aMF8K+j0QfYgN338paTlB9w4oGyoeOJj0G6O92
	c3K6xzc3AfB4yVrgA9u2HQmpOSbXqbrdQeyQqC2U7NF4eAj1i93NridDVKb6I+j1/iT3
	hIorAx7yn9wZ9TO7fb9Xc/0eR0bvAqpeeQ+vh70LiaSYiiBlGSDVFN5JHSuF7M2e9EWW
	SUWaRpCSZv3X8GcODxbdZ6AFCFDiD4KXDDPdSq4M6sfgCHILWHQOmmaLUVnetvciG9d2
	HTMA==
X-Gm-Message-State: AElRT7G6otw47n2VryGpsUMgE5TJuqcAJ6pDxYe8/f6/GSZ8sxkBkc/w
	1WR7l08kWX8NBqgcc8gunHNSlfDUW7S3lAUySqY=
X-Google-Smtp-Source: AG47ELtOkUTxkXLPkHN8EWExJcLi1/bujZ2BJ8U6yc8+Lgsz21XUUxauA6VUHAGQNtYnbsCgjgMr4S+toYogzCYtbYs=
X-Received: by 2002:a25:d388:: with SMTP id
	e130-v6mr3595365ybf.224.1521751663914; 
	Thu, 22 Mar 2018 13:47:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 13:47:43
	-0700 (PDT)
In-Reply-To: <6d77f84f-1808-b929-7719-7fef10bc11b4@linux.intel.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
	<6d77f84f-1808-b929-7719-7fef10bc11b4@linux.intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 22 Mar 2018 21:47:43 +0100
Message-ID: <CALbNGRTaPZ7s849dN-MMROtXpVEcE2YtoMBLsYo+YSgVzu6TpQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/17] remove gnome2 recipes for discontinued projects
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
X-List-Received-Date: Thu, 22 Mar 2018 20:47:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 11:18 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 03/19/2018 10:28 PM, Andreas M=C3=BCller wrote:
>>
>> I can't stand the low-quality/split/maintainer-spam anymore: Guys one wa=
y
>> to
>> change things is start sending patches.
>
>
> Yes, yes, yes. And yes. Even more could be removed, e.g. libunique and
> everything that wants it. I'll look when I have a bit of time.
I checked for that and have to see that this is yet another attack on
xfce4-mixer. It is a challenge not to burn into flames for this.

> You are invited :)
I was an idiot and you are definitively NOT invited.

To repeat myself: There is no replacement working that nice and mixing
without pulseaudio. It not that pulseaudio is not useful when
listening to music but when one wants to make music (MIDI/jack) it
turns machine into unusable state: Latencies are much higher and
what's even worse sometimes it seems MIDI events have to go to the
other side of planet and back to reach their target. And don't tell me
I can use alsa-mixer.

I'll send out a patch moving libunique to meta-xfce. This is a layer
with lots of old stuff (=3Dlow quality) and I am  maintaining it is pure
fun with people like you.

Andreas

On Tue, Mar 20, 2018 at 11:18 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 03/19/2018 10:28 PM, Andreas M=C3=BCller wrote:
>>
>> I can't stand the low-quality/split/maintainer-spam anymore: Guys one wa=
y
>> to
>> change things is start sending patches.
>
>
> Yes, yes, yes. And yes. Even more could be removed, e.g. libunique and
> everything that wants it. I'll look when I have a bit of time.
>
> Alex

