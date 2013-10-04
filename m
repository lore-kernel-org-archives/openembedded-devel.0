Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id BF86761963
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 20:02:23 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id jy13so2714050veb.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 13:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=34cKDa5Dnu+BpCgnUuBlIHP3gxXz8kdl9YzDQKR4XAo=;
	b=K6u0GpzdrxacXPBcdJqYJXAKQPTdI6E+xLl7yazMHUKidjfu4lxeexD8I7ugVx1q7w
	yBSwrwrUsSjP/HBxz+zbXrz0xZVqxqFlbCVdGrtSLsz+t0dYBJgBTXrAgpZrbrEqZNvn
	T1vcToHMxxHiz3nG0mWqjL83KPTrjpo7koxbgYQ8nhZe4yDwh/jLspz9S2fGboWSqY69
	BvKGwgxkmluI53xLe/Dk5LP6fChGJjZN1xfMJJT72YsrsGwMrsFfzfUNSs5HYvuplGbG
	nnGz38V1DU/BYt49IAJVv5Dht5qnPcafXZeT8vAWkCs2f9LpubdOqQIbSPlLYjRdnsBP
	Ojuw==
MIME-Version: 1.0
X-Received: by 10.52.36.239 with SMTP id t15mr11469342vdj.11.1380916945108;
	Fri, 04 Oct 2013 13:02:25 -0700 (PDT)
Received: by 10.52.236.129 with HTTP; Fri, 4 Oct 2013 13:02:25 -0700 (PDT)
In-Reply-To: <20131004141815.GH6240@jama>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
	<1379760101-13380-8-git-send-email-schnitzeltony@googlemail.com>
	<20131004141815.GH6240@jama>
Date: Fri, 4 Oct 2013 22:02:25 +0200
Message-ID: <CALbNGRTS88LJ3usk6DWuJppXUX-y0KJ5fEQmRUUoYyVMyt0HEw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe/meta-xfce 07/10] xfce4-settings: add PACKAGECONFIG for sound-settings
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
X-List-Received-Date: Fri, 04 Oct 2013 20:02:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2013 at 4:18 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Sat, Sep 21, 2013 at 12:41:38PM +0200, Andreas M=C3=BCller wrote:
>> defaults based upon DISTRO_FEATURES for alsa and pulseaudio
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 8 +++++++=
-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb=
 b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
>> index 4b75dd7..227858a 100644
>> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
>> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
>> @@ -23,9 +23,13 @@ PV =3D "4.10.0+git${SRCPV}"
Aargh - it is definitely a 4.11+git - I have seen this warning long
time ago but did not take enough attention...
>
> Sorry that I haven't reported it on the commit which caused it :).

I will send a patch ontop of this series next week.

Nadreas

