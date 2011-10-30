Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lamiaposta71@gmail.com>) id 1RKdQG-0002ID-6l
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 23:00:08 +0100
Received: by qyk35 with SMTP id 35so3709338qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ioPfWsWY/Vm5rAAN5Uf6JuomoD2PYNQPRY7uPsHjwKg=;
	b=MQd6AkaQsOh7wK+wd7EmDE8ZoeLvlyfmdeAJlqswZWrU5woZnP7fCxynk5K/LqIfck
	oJjnYAfc1bY9HRQ0a4k0RhxAyemhybMUlnawkwWn4Bwbr+xwzSIrOd0m7UC9OHF87Ehw
	4v22n75NEb/+qfHHcRgTb2Xi6hAQZcyIhiFEI=
MIME-Version: 1.0
Received: by 10.229.214.11 with SMTP id gy11mr2561621qcb.156.1320011642717;
	Sun, 30 Oct 2011 14:54:02 -0700 (PDT)
Received: by 10.229.169.73 with HTTP; Sun, 30 Oct 2011 14:54:02 -0700 (PDT)
In-Reply-To: <CA+M6bXk_1OLfQ0p4Ziq+Y-5KWOfwS9JXMsLo62U19VByNyFOYw@mail.gmail.com>
References: <CAFU7RzOnmbu=dxsM7MZ2DXLrOUMYSN4hoVfAL4W=vJ+Y0vH-Kg@mail.gmail.com>
	<CA+M6bXk_1OLfQ0p4Ziq+Y-5KWOfwS9JXMsLo62U19VByNyFOYw@mail.gmail.com>
Date: Sun, 30 Oct 2011 22:54:02 +0100
Message-ID: <CAFU7RzPAco1-2OspAPmebWpyUvh7HjCpw7bs9X7_MYsacNC-og@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: from narcissus to compilation
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
X-List-Received-Date: Sun, 30 Oct 2011 22:00:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 30, 2011 at 6:56 PM, Tom Rini <tom.rini@gmail.com> wrote:
> On Sun, Oct 30, 2011 at 10:23 AM, Raffaele Recalcati
> <lamiaposta71@gmail.com> wrote:
>> Can anybody tell me, as =C2=A0I got a succesfull compilation on narcissu=
s
>> for dm3730-am3715-evm, which is
>> the right branch to reproduce the same compilation in order to port
>> the kernel to my board?
>
> Well, if you didn't select 'advanced' under build options, it's
> probably from the 2011.03-maintenance branch. =C2=A0The rest of it depend=
s
> on what image you selected and options and so forth. =C2=A0And since this
> is an angstrom image, it's best to ask on their MLs.

thank you very much.
I was in advanced way and I'll check on angstrom ml.

Bye,
Raffaele

> --
> Tom
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
www.opensurf.it


