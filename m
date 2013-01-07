Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsAja-00064q-9K
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 12:19:25 +0100
Received: by mail-oa0-f51.google.com with SMTP id n12so17395698oag.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/sik42K3rCVjowz2CZ91GP68A/24rQuR6ixBtD59zI0=;
	b=c6dk0xAzZougvkVDFaxA4M+DcHqcbIfmpFGOB2r+jleoBc4VvSFYO35gs7HfZC0uJm
	bh+Gpuny+hytFIkevkMnFCPID10y6ZiPzQBr7wPPg4GELtRY4Ync7faf21Trnhpf2HDI
	exvgQpNBc+zD6JclHvcCByz8FZs7+pVc5X7Qfj15UjCK48aNJUO7c+dsgcen97JZK3yN
	WrqNSbLulUg9bsXTO2fg0qDLsZD4FAqassqbTSMwPQO09tSXHlzdziWv8yIzoEM9dITi
	OfFSacXDPVf+wNG9FISF3oWZj4Rbp+rB3Ur4X4Se2jypOmM43IpPRay9zjciWvyx9+A7
	n8yA==
MIME-Version: 1.0
Received: by 10.60.171.133 with SMTP id au5mr33408928oec.90.1357556644683;
	Mon, 07 Jan 2013 03:04:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Mon, 7 Jan 2013 03:04:04 -0800 (PST)
In-Reply-To: <20130107120129.352ae897@e6520eb>
References: <CAP9ODKr_NPX9kgu1jFWkrvhzM=0qFdHv4S9cZs0cGr=7z-iGZg@mail.gmail.com>
	<CAP9ODKp=wXUgCTgVVJQ_C9BAa5in+=ufWoyCNq-73aR6CsTcGA@mail.gmail.com>
	<20130107120129.352ae897@e6520eb>
Date: Mon, 7 Jan 2013 09:04:04 -0200
X-Google-Sender-Auth: 3CAcD_E2LPicFP8AS8CIOuf3rR8
Message-ID: <CAP9ODKr-z4WC6zVOoy0K-TMvXKESOo6vM-n4WxJw_3U9hJ1a_Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [for-danny] Patches for backport
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
X-List-Received-Date: Mon, 07 Jan 2013 11:19:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 7, 2013 at 9:01 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Le Tue, 1 Jan 2013 16:21:51 -0200,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>
>> On Fri, Dec 21, 2012 at 4:22 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>> > Hello Eric,
>> >
>> > So we did a new set of changes in master, which we'd like to backport.
>> > The changes are, in order:
>> >
>> > 2ac0acc2753f9853928a081cbc80c3daacbe7e08 xf86-video-geode: Add
>> > rdepends on EXA Xorg module
>> >
>> > ade2d4d35e1efdd83bb555949bcfb8c7a1970ff0 xinput-calibrator: Fix
>> > service file to require display-manag
>> >
>> > 43c2d4d3ca9889e54646e02d110d8155da96772c openmotif: Update SRC_URI and
>> > add libxft in depends
>> >
>> > 1db0dbf9a8bf2f09ddbc09a4ccde227fdf9a866a openmotif: Disable printing s=
upport
>> >
>> > 38daf64fb87bbc34caad050e7295b910c9b80e7c openmotif: Avoid use os Xos.h=
 from host
>>
>> Ping?
>>
> merged into danny-next. Test build in progress.

Thanks a lot.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


