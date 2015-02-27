Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9751773772
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:36:22 +0000 (UTC)
Received: by pablj1 with SMTP id lj1so18629534pab.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ssUmMVdn7xGGq02L9Sbylbe3G4hd4qV+SFITjZlyMmU=;
	b=xcbSA//y8GdrINl01jPt9N/mtmusci447pW8Dj7wJy9SJnGrxdesvFdTIbTObB2CqL
	9Fitg+jSvA9RWSLP6Rttpf1DthV2w/vj7HEE0b3G59Mpev7G58Io0VeDK+mVGdObUYdU
	aBrqkedKB7E6tb/rhLblKEniMWbkhvG/tvsXC/1If659c/j/rIBXVxfTXFgXicqVeXih
	k9XrBPpocZrHsMR6bhZFMBPlyOG5v9y5wJ+9LOP6UibRu9MXTa4VtFJ+nSiSP1IJoVrl
	GGgUyEoRdJJzXA+yP0NrWjZvbOakeRXJke/pXbAR+Xil+y/bYUZbndJ6HynTri1KW1yG
	z4mQ==
MIME-Version: 1.0
X-Received: by 10.67.7.102 with SMTP id db6mr22308165pad.14.1425026183617;
	Fri, 27 Feb 2015 00:36:23 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Fri, 27 Feb 2015 00:36:23 -0800 (PST)
In-Reply-To: <20150227083409.GG2309@jama>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
	<20150227065054.GB2309@jama> <20150227083409.GG2309@jama>
Date: Fri, 27 Feb 2015 09:36:23 +0100
Message-ID: <CALbNGRTZRhp9KFj6Cw281UzO3vms7BSObFJejXKWYcjooMmiBw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
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
X-List-Received-Date: Fri, 27 Feb 2015 08:36:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 9:34 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Feb 27, 2015 at 07:50:54AM +0100, Martin Jansa wrote:
>> On Tue, Jan 27, 2015 at 06:53:52AM +0100, Andreas M=C3=BCller wrote:
>> > * this is the first version which dropped qt4 support
>> > * rename recipe to avoid conflicts with meta-oe's qt-creator
>>
>> It still conflicts with qt-creator in sysroot on couple files, please tr=
y to
>> change it to use different datadir or don't stage datadir in sysroot at =
all (if
>> it works without it).
>
> I'm going to merge this together with 5.4.1 but please look into this
> issue possibly together with 3.3.1 upgrade.
>
> Thanks
>
OK

Andreas

