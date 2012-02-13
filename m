Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rwz2a-00010M-3z
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 17:46:12 +0100
Received: by lahc1 with SMTP id c1so4282143lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 08:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=VaQ3M9OyBzL07m5NfrJLBW/yqZM3INNUxEfC4RsNUIs=;
	b=giHWHSEQ0lvFRn3iCfYTK2gl6i2lB609T75WgBAwLTXpddS3HINpjvNtyaRP0oLJ9I
	39bz4xxSnNhTcuedM0nnUU9Pk44sPNgFETNPRy1HYQszYmqrw6xWoO6qFYoDRYMYUnxX
	YgTJ8sBEJIRb4G1zjwZ2dAllNcNFaVHKphhT8=
MIME-Version: 1.0
Received: by 10.112.10.70 with SMTP id g6mr1583048lbb.0.1329151082505; Mon, 13
	Feb 2012 08:38:02 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Mon, 13 Feb 2012 08:38:02 -0800 (PST)
In-Reply-To: <CAP9ODKoXeBf_vctM7pcHTZd2-fMacN+kk8z9af18h9rkyDGVWQ@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
	<CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
	<CAP9ODKotC11Gh+bcOz9vgqNMacdwykydJ1G=e7rjr_HKVa6U4w@mail.gmail.com>
	<CALbNGRQDy7E4ND7amsgiBuzo12o=umbW1kokYBgqyPoTaXbTCg@mail.gmail.com>
	<CAP9ODKoXeBf_vctM7pcHTZd2-fMacN+kk8z9af18h9rkyDGVWQ@mail.gmail.com>
Date: Mon, 13 Feb 2012 17:38:02 +0100
Message-ID: <CALbNGRQ1uf__SnyW5nz1mfOh45DgKyVmjQ3oFS-VBLOyiHVZig@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 6/7] systemd.bbclass: automatically extend FILES_* for systemd packages
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
X-List-Received-Date: Mon, 13 Feb 2012 16:46:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 1:14 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Feb 13, 2012 at 10:05, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> > If for example I put two .socket files, your algorithm will break. Tha=
t's
>> > why I said you need to parse it. It is not that difficult as the logic=
 is
>> > the same as the wrapper used in rootfs generation.
>> Sorry - but which which wrapper do you mean?
>
>
> systemd-systemctl-native
Off list @Otavio: not boring but challenging...

To reuse as much as possible: Is there a piece of code showing me how
to mix up shell/python code?

Andreas


