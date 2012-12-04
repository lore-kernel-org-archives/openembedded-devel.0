Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tfqnz-0003dW-Cf
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 12:36:51 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 03:21:21 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so16774694obq.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 03:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=S/Gcb3NhY4AmcPvQcpie+1KX76KaHafJr1h1rlfBjlM=;
	b=CZ36RYa5le/8WNdRlrT3PIAUwcyN0B9rxralCeo+ES/kCaE9Y+uk+vK8PDtKJOnO4E
	uNbtYFBdwJFNigtXaBFBaJtefUz/aR8ScAfolqyTdfKYX9Ok473SQfPI+7b+J0prapk8
	0MVlFFi7vneJRh+68Qf01bsZbyxhxFa3kEQ/vPGD0FxuqXZ1W+FQaWgdUkzRo26B5d7O
	mMGI9Fe+n7oN/QJHqJVRYchJNPaldpRziJ0Ld6eZvyKu1KbXWpZBMhLUhBfsKNTS6h2W
	Efd7DqDbMoyMRXaEuWtJupTK/HDd0J/zCYjmB944l4jpEFNBzWghCs2AAkiMkohMidaf
	mUkw==
Received: by 10.60.4.165 with SMTP id l5mr5341539oel.84.1354620080554;
	Tue, 04 Dec 2012 03:21:20 -0800 (PST)
Received: by 10.60.4.165 with SMTP id l5mr5341535oel.84.1354620080447; Tue, 04
	Dec 2012 03:21:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 4 Dec 2012 03:21:00 -0800 (PST)
In-Reply-To: <CAJTo0LZi1z7Enry_9T1VDvaOtmQgasyuwoFq6b2OUgYmf_-i6g@mail.gmail.com>
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
	<ea86ab799567bbf1f2fd02d47f9bdc775ba26f9e.1353602922.git.paul.eggleton@linux.intel.com>
	<20121204074429.GA6288@ad.chargestorm.se> <11016715.fxrlBBZh8S@helios>
	<CAJTo0LZi1z7Enry_9T1VDvaOtmQgasyuwoFq6b2OUgYmf_-i6g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2012 11:21:00 +0000
Message-ID: <CAJTo0LYBxpAbu4hZoX4rfdXTnfp6MnpLDgEaYx520TU2hr8qJg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkKSFgBsyoiI0Ow6SZx2fTDp31sw0KrabVtE1Ut2huj17HKHTzNjgwTy9Zp1AnhKviYSdHwH5WJrxzLf+Fb3vQ489HObwsh5jUIFIfFMZJtGSh1F6v7xwIz9JHSjGBDidxZaXuCvxU4s/UX5eaZcPq1gTAIEPFae/zn3VeCiEP3RjVafnEB8vlZv2eoYMV1QMohcD80
Subject: Re: [danny?] Re: [meta-networking][PATCH v2 1/2] ntp: cleanup recipes and fix SSL support
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
X-List-Received-Date: Tue, 04 Dec 2012 11:36:51 -0000
Content-Type: text/plain; charset=UTF-8

On 4 December 2012 11:20, Burton, Ross <ross.burton@intel.com> wrote:
> On 4 December 2012 09:21, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> IMO the original recipe was horribly broken, so I'd definitely support having
>> this patch applied to danny as well, assuming people have given it a
>> reasonable amount of runtime testing and everything's OK.
>
> It's horribly intrusive but if ntp wasn't usable before, I'm happy to
> merge it once it's had some testing.

Of course ntp isn't in oe-core so ignore my opinion. ;)

Ross


