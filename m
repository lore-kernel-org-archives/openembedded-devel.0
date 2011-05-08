Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ8OW-0006TK-Un
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 20:07:53 +0200
Received: by bwz5 with SMTP id 5so3956574bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 11:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IqoweSCp41h6d5QHG3YEo5gB6lJm4aPn9rpJwAtOFbY=;
	b=onCey6iHSl7YBh6B0/arlwwCV/QlHNZA+MIDYRoyKvhvCGy34aa7GMibWCgvW5x/84
	3WPlgQHWl+jvGsjYp+ujFlsJZsqHCPvnax1d4u6vvqpwHWgaYG66k+UHsOdBliMmDWEW
	gu5jESHl+ACIXLC7zgnZEjK5fMNSOY3Vx3iEo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=K8yO0wPxYW/ZDrOPzu6iI6t3RPVxj6qETrFYaZzqo7xRKKr9MNA2Nav0O1l/ZeWFIk
	GtGROqSYqcT/L014H6WQiGdXzBO+yM1bZXl8tYDn3MIne31M5L4TjAnLqcPjgea/BdQs
	FirhtF4GJOCUYGZeRreG/INJXZypl6OjRp0WI=
MIME-Version: 1.0
Received: by 10.204.178.65 with SMTP id bl1mr490097bkb.189.1304877909704; Sun,
	08 May 2011 11:05:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 8 May 2011 11:05:09 -0700 (PDT)
In-Reply-To: <4DC6DA66.8090609@gravedo.de>
References: <4DC6CA02.1000009@gravedo.de>
	<1304873759-20379-1-git-send-email-morphis@gravedo.de>
	<BANLkTinj7NmL9h8R3EVC78YgPUaiBGqyFg@mail.gmail.com>
	<4DC6D765.8060706@gravedo.de>
	<BANLkTin_n8bs3cwNxjU7HrnjBEr+rh4j-Q@mail.gmail.com>
	<4DC6DA66.8090609@gravedo.de>
Date: Sun, 8 May 2011 15:05:09 -0300
X-Google-Sender-Auth: jkhr9Bq3xHICYvPAIIvnLMiWCuY
Message-ID: <BANLkTinnB_HpwHux9QabAgYOA3FD_J-HLg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt4-native: introduce the native version of qt4
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
X-List-Received-Date: Sun, 08 May 2011 18:07:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 15:01, Simon Busch <morphis@gravedo.de> wrote:
...
>> BTW, it would be nice if you could do the same for oe-core :-)
>
> I can but I have to setup the environment first to test everything. So
> this will need some time.

That would be nice to avoid more missing stuff between both.

I am just porting your rpath and my qt fixes for cmake and avoiding
divertion when possible seems the better.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


