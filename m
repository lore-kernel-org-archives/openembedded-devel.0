Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6tdT-0003B3-7D
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 23:19:58 +0100
Received: by bwz9 with SMTP id 9so2191739bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 14:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=hNxc8KUdum2NqpJ4Jyva32ovXhq3/jDfisAr5qfLTno=;
	b=Xb0K+UnwUnutLGpqg/D8mUfjj0WsQ7veLy71A93tZMD4My5Lod6CX4sJmTVgRTrgm5
	aNc7p4Y+gppwzwy9v1yW1u3t86ZOFmfX63xyW0vcarSTmTke8jojNeAAg2VbzAaAe/UN
	gAOcm4S2mCGxNFg/0hJO3hSJEjwh1uZfHNfWk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=V4bdXoVeFgUNtStfrG3otyWY++CJWBLqoSSRFMnO8a2smsA6IxkbgDbgl45vQWKCQ4
	QR0f+PfCtiSXVyqRdm/Wf5N/qdprf7lbO0ybtA6XyH6YiZwykLrmspvoVGRi7J7zXYD6
	SZPGAXhOofyaevYNIg0MOMdKRkxqyQiq/3gTg=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.182.137 with SMTP id q9mr660912hbg.72.1257631906162; Sat, 
	07 Nov 2009 14:11:46 -0800 (PST)
In-Reply-To: <hd4qpq$ee0$1@ger.gmane.org>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<hd4qpq$ee0$1@ger.gmane.org>
Date: Sat, 7 Nov 2009 20:11:46 -0200
X-Google-Sender-Auth: 9237e98eb2a3539b
Message-ID: <be7a9f3d0911071411nedae15eq1156df0a313d0575@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 22:19:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Koen,

On Sat, Nov 7, 2009 at 8:02 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> I implemented option 'd':
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=7e8f2afa6fb064aaa3b477456c60f64b20caedeb
>
> And I have to repeat that the twig upstream are idiots for behaving like
> this. May the fleas of a thousand camels infest their sensitive regions!

Simple and fast :-)

BTW, please, use a shorter first line commit message since it is
easier to read and also shows properly in the week log.

Cheers,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


