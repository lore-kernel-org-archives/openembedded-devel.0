Received: from mail-bw0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PrvZ9-0007EC-Qt
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 17:58:23 +0100
Received: by bwz2 with SMTP id 2so2470863bwz.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=164As6yp+DOpAZDV074FZiFL9nBy6kcIq/A6ViZZzOI=;
	b=GlG6MmtJEuWCRoftPxN/Z+PuztCwI7Hmc0Fui58WLq20TCoi8/hI5cawY+phKji5K0
	8fsBqRg8UcMaNDFoLtcy2bKyI9goBwF+/JXDXaNF862NgcdiljNQpxLgE0nkXk4BZH+/
	OK58iwDgqsMv4wTuTSMttYOaqbaYBWOza1GVA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ffCei6hP3tUXRUtXRcp2eLVEPkyKOcSqoqEyTBX//qpzaRbeAlN8bq1o0wZ8ClilM3
	bt6YhdN6zbxOa8Dmf2nMOU/jGGMwFVllR7dBWS6HaF037HnTsGNP3iXOU32UZU81fsct
	y+K8b8lBYzGQzK8TaokJ9PSWj5eYicH5aiHWU=
MIME-Version: 1.0
Received: by 10.204.51.145 with SMTP id d17mr2774970bkg.24.1298393820434; Tue,
	22 Feb 2011 08:57:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 22 Feb 2011 08:57:00 -0800 (PST)
In-Reply-To: <AANLkTik89-uYd5sOW80+ef_wL4=2HQ0XUTBZm=70Myu=@mail.gmail.com>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
	<1298051011-10445-8-git-send-email-otavio@ossystems.com.br>
	<AANLkTik89-uYd5sOW80+ef_wL4=2HQ0XUTBZm=70Myu=@mail.gmail.com>
Date: Tue, 22 Feb 2011 16:57:00 +0000
X-Google-Sender-Auth: qS5DWF5kpusFKfsX2wYh_tDgytw
Message-ID: <AANLkTi=mJRO+LNORNc=zcoc-im8M4Vjz0makUy0VzDQb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 07/16] libinih: add
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
X-List-Received-Date: Tue, 22 Feb 2011 16:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 20, 2011 at 09:37, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
...
> I pushed this recipe yesterday, but apparently it seems to break the
> build, so I reverted it.
> Guess this is the bad guy:
> SRCREV =3D "${AUTOREV}"
> anyway using autorev is not really desired (didn't realize it when pushin=
g)
>
> Otavio can you come with a better version?
...

Yes; I will address it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


