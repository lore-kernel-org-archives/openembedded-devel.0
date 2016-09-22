Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 31C2260778
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 10:47:08 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id a63so18808588vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=NHd35xC7xklWBVAO4etW+UimsJyBkD3vqD1QapxPfsQ=;
	b=WZS2eT5M0+HVNatreYz5DEx/Bigs3Wj99xnp4aAaD4Zu7FuFTzfl5T1HfpGlPql1v8
	vYL6H3dAn8C1rW5kgLblrpzYoPNuq/J6wUXN1YF7B+z82qupQ13yNdsiyPwVG31azime
	3YfflobAMxRkMAWrXzjVpiG4QqStZBLZXMoi4YjWyqfOQ12j3LMENKS9hwmvDavv056T
	j+3H3VnZ/MplEuLIX8xW57SbgakRSXx5a3UHqE3N5EmMsffrhcMc6O5VJlUlGO/K7SHD
	KdRll7lHDMt10rjVkzOVi5+rJ3EuZFYM1OtYuqn7xBa8GZwJ3IvRl/9kA69pyPv3DfXw
	nmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=NHd35xC7xklWBVAO4etW+UimsJyBkD3vqD1QapxPfsQ=;
	b=Tpb6S+L19t46M+hUTAvR/TPRi04rnMpPwMhrRHExDUssptxYl6ZC51iRKFWcW+Otp1
	5mYw8Twu5SbGRisHCCqKnp0X5sCgxNsPJO2BzWbXloJ7cajWq28wUc9MG11H0F5xW5cF
	jw/rhT9YP0tHJ50ZzFcJHzTtD/+sSU97gFa9o0KF1ObQUo2I1ldqSbkfPON8VOG/Vdgk
	I0q8jn8YWtg3/ih9wSZZkNGPQNgLysE3G2KBCH+cJVAyR5G74kRHFtqvzQw5BDWmW/OC
	MhFRDX6/WRsYSiCuny9XtSUqXEPG7tJw632WyyOJ6KbsGmbsoMkhRVwWSTUuYqDINBj6
	GW8g==
X-Gm-Message-State: AE9vXwOGU4Th/FKggruOHSwZbunvxeXk4RMNb12287lvu/rHgzJLaS/nTxtuGmr7rKO60lFBm8Ox9H0IHxrLBQ==
X-Received: by 10.31.141.19 with SMTP id p19mr832430vkd.67.1474541229824; Thu,
	22 Sep 2016 03:47:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Thu, 22 Sep 2016 03:47:09 -0700 (PDT)
In-Reply-To: <CAJTo0Lbfvn2UbvYU8vH6WZEzJTv0JLsKMT5H9bjZqjCH02zP9g@mail.gmail.com>
References: <1474490283-1332-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lbfvn2UbvYU8vH6WZEzJTv0JLsKMT5H9bjZqjCH02zP9g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 22 Sep 2016 12:47:09 +0200
Message-ID: <CALbNGRTXgVgGKzPzB9-8FoN5nJN+CSsGMnoocRAahXWH0Ss5tA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] portaudio: has MIT license
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
X-List-Received-Date: Thu, 22 Sep 2016 10:47:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 12:19 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
> On 21 September 2016 at 21:38, Andreas M=C3=BCller <schnitzeltony@googlem=
ail.com>
> wrote:
>
>> -LICENSE =3D "PortAudio"
>> +LICENSE =3D "MIT"
>>
>
> FWIW my upgrade patch last week incorporates this change.
>
I did not notice - sorry

Andreas

