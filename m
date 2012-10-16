Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TO5hP-0008Cv-Vt
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Oct 2012 13:52:40 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so9545326ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2012 04:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=MfcdU1BGk18U/Cs8Ep5gkEgg8hJxx5Kd19iPwOhhigM=;
	b=OopwHHjR3MBV/CbzWg7mGe9BQHI+QfM1Ke3hcuhMPszcqIMdoGAWFTzsXQKwRpiK1l
	mIT5XYRQ2u05cuTNju3Czilt7KzHn2MebpwcJ267P8fNlKv1zgSmx663Pu8zKU7XI95t
	kxoWWDW2Sc1KC53orXcZcvC1oYE8ty5oYJhmnKNhPO2b1sSB/rbXjCwonfoyzFmMzN+a
	6sBx8twGzL29sCzJblsL4XJ1jpLwWE/pfHRi4cDOnfyvraiDCmz1c/EQ7LsQENcxFxA0
	sh8+XaXDRk9vypRuD+Pf5j6TC5a1N4cm1Chktpg0hqkW0b15iZOO3AUBn5URM6KNKcp0
	MHoQ==
MIME-Version: 1.0
Received: by 10.50.236.6 with SMTP id uq6mr11688296igc.50.1350387561370; Tue,
	16 Oct 2012 04:39:21 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Tue, 16 Oct 2012 04:39:21 -0700 (PDT)
In-Reply-To: <CALbNGRQ9wfABVz3_2pCZVYMJ+3kAa3rEcxmp-GrmLY1EyYOhUw@mail.gmail.com>
References: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQUij-JZdKVW3KoNu+tgatquyA0ZBT6yDgdguJPEgpfEQ@mail.gmail.com>
	<CALbNGRQvE_qnx7cW0xk1qtYMii3E-dOnRiPxuYk1nz333+1u8A@mail.gmail.com>
	<CALbNGRQ9wfABVz3_2pCZVYMJ+3kAa3rEcxmp-GrmLY1EyYOhUw@mail.gmail.com>
Date: Tue, 16 Oct 2012 13:39:21 +0200
Message-ID: <CALbNGRQwk8Eg+nD5BWfoEKhVThzsXgNKf=WLmxruqqL3fX0y5A@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Oct 2012 11:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 12, 2012 at 10:52 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Oct 4, 2012 at 9:36 AM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> On Fri, Sep 28, 2012 at 9:49 AM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>>> Patchwork does not like the third of this series. So this series can be=
 found at
>>>
>>> git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git
>>> branch patches
>>>
>>> Andreas
>> ping
> Sorry to bug here again but is there something wrong with this series?
> I have 1+2 in daily use since I am writing an xfce-panel-plugin and
> the libxfce4ui-glade stuff is not available in my build machine's
> distro.
>
> If there are objections on these patches I will put 1+2 in my
> meta-devel. So please let me know so I can close this.
>
> Andreas
Don't we share the same README?

Andreas


