Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwzWv-0001uI-4b
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 18:17:33 +0100
Received: by eekd41 with SMTP id d41so1605051eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 09:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=bj0HUXaqhzNIVqjC8evS0yKuKcTRsDV2vTyBZ2KVi0Y=;
	b=eYTFAS6gVsd6FS7cpCBShAGZ4OhmY2By6hh9pSdqUyvsF1zKbGXcxA1rYXn3VEgZIk
	gG4JfSIBxF6vfPHVE1fbyp0wO4WxmqPLY7rIvCGgSWSEHygav+JaIQMNe6fw12q8RERl
	XDSgGxjmSR5C/wVihCpsQBZjm93gu0TXe0cvI=
MIME-Version: 1.0
Received: by 10.213.14.147 with SMTP id g19mr2142214eba.126.1329152962377;
	Mon, 13 Feb 2012 09:09:22 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Mon, 13 Feb 2012 09:09:22 -0800 (PST)
In-Reply-To: <CALbNGRQ1uf__SnyW5nz1mfOh45DgKyVmjQ3oFS-VBLOyiHVZig@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
	<CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
	<CAP9ODKotC11Gh+bcOz9vgqNMacdwykydJ1G=e7rjr_HKVa6U4w@mail.gmail.com>
	<CALbNGRQDy7E4ND7amsgiBuzo12o=umbW1kokYBgqyPoTaXbTCg@mail.gmail.com>
	<CAP9ODKoXeBf_vctM7pcHTZd2-fMacN+kk8z9af18h9rkyDGVWQ@mail.gmail.com>
	<CALbNGRQ1uf__SnyW5nz1mfOh45DgKyVmjQ3oFS-VBLOyiHVZig@mail.gmail.com>
Date: Mon, 13 Feb 2012 15:09:22 -0200
X-Google-Sender-Auth: pdJ7LeRQhDbc7ai6LNrjPEFK0g0
Message-ID: <CAP9ODKq=i_jLUHcB+L1marL7Ymz261LZGC26Q49Bfvm+E4tm5g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Mon, 13 Feb 2012 17:17:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 14:38, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> > systemd-systemctl-native
> Off list @Otavio: not boring but challenging...
>
> To reuse as much as possible: Is there a piece of code showing me how
> to mix up shell/python code?


Not that I am aware of but you can look at combo-layer script how to read
and parse ini files; this ought to be very simple to do.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

