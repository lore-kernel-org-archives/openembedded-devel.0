Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TMbBv-0004d2-8F
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2012 11:05:59 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so4476092ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2012 01:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=josTLJemmPPPBsPSF0r/FaL1C81AWfTuQ1TtEWzsHgk=;
	b=iBkp4jle9Fhp5wquBbMVm7dg5VNXJ9F6zswZrd8cWv0ZOw1rj+MkQ6S1bxkAm8++nO
	6roHmvkvDdtfTpDqEnSGYJqjz2fS5nwqceUkUF+iQc+Wbx2FGB8dmeAjfIFqLlBIYMOn
	c8wMUbJC+RxoDMJ74WyO/S0L0qYrP1glCNO24iJfpm0rECdBGh/LgpIryZmxKm4ANiCQ
	MEld2nfmCfdQh9yiSi4o2YZAxlSmzhj4P5Nx9XgAG0Cm0pxPNmBQWdZyMPb92z7FAjld
	fMhKbQOlopyHK+PNDtCnfw+HJVO7WqCcNG5RoaPx+QHCKMmB085XWaSrfyTOxNIdkSby
	Bw3Q==
MIME-Version: 1.0
Received: by 10.50.237.6 with SMTP id uy6mr359052igc.31.1350031967309; Fri, 12
	Oct 2012 01:52:47 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Fri, 12 Oct 2012 01:52:47 -0700 (PDT)
In-Reply-To: <CALbNGRQvE_qnx7cW0xk1qtYMii3E-dOnRiPxuYk1nz333+1u8A@mail.gmail.com>
References: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQUij-JZdKVW3KoNu+tgatquyA0ZBT6yDgdguJPEgpfEQ@mail.gmail.com>
	<CALbNGRQvE_qnx7cW0xk1qtYMii3E-dOnRiPxuYk1nz333+1u8A@mail.gmail.com>
Date: Fri, 12 Oct 2012 10:52:47 +0200
Message-ID: <CALbNGRQ9wfABVz3_2pCZVYMJ+3kAa3rEcxmp-GrmLY1EyYOhUw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe, meta-xfce 1/3] glade3: initial add 3.8.2
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
X-List-Received-Date: Fri, 12 Oct 2012 09:05:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 4, 2012 at 9:36 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Sep 28, 2012 at 9:49 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> Patchwork does not like the third of this series. So this series can be =
found at
>>
>> git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git
>> branch patches
>>
>> Andreas
> ping
Sorry to bug here again but is there something wrong with this series?
I have 1+2 in daily use since I am writing an xfce-panel-plugin and
the libxfce4ui-glade stuff is not available in my build machine's
distro.

If there are objections on these patches I will put 1+2 in my
meta-devel. So please let me know so I can close this.

Andreas


