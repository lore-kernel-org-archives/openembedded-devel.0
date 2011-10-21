Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHEFG-0001Qz-A2
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 14:30:42 +0200
Received: by bkat8 with SMTP id t8so5046265bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ACN2uuuYDUHShS37gSHiAkijCVOvc0GF9L3kf/MLqsk=;
	b=JABxVbizPFhB9jxpfkJAIp6uW0f2k7Jp5z+uGHdpyhssQOxTBSHml70p5k0OGxo13z
	nvPY1XfJevON2+ftrBwLa/BfVSf2cT1dmg6eXIyM5RkzC9F/qOYHv2S09D8wPdfTUHNA
	GnjWE56HsLNwzYIqqgQsI95a+0xcPBP38KGzU=
MIME-Version: 1.0
Received: by 10.204.157.142 with SMTP id b14mr10679276bkx.44.1319199889142;
	Fri, 21 Oct 2011 05:24:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Fri, 21 Oct 2011 05:24:49 -0700 (PDT)
In-Reply-To: <j7r2bh$7jb$1@dough.gmane.org>
References: <cover.1319168013.git.otavio@ossystems.com.br>
	<b9bb7aa6a838bfad2d268907d0af7820cfd46618.1319168013.git.otavio@ossystems.com.br>
	<j7r2bh$7jb$1@dough.gmane.org>
Date: Fri, 21 Oct 2011 10:24:49 -0200
X-Google-Sender-Auth: si9nkUieM9H_KsOzfcaXfS3Lw1Y
Message-ID: <CAP9ODKo1XF-QsGa3f6K3vgnG2jf4WR1eP-Ccjmvh=W4JUXqi_Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/4] systemd-serialgetty: don't require systemd_git.bb
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
X-List-Received-Date: Fri, 21 Oct 2011 12:30:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 04:09, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
...
>> file://serial-getty@.service \ - =A0 =A0 =A0 =A0 =A0" - DESCRIPTION =3D =
"Systemd
>> serial config" -SERIAL_CONSOLE ?=3D "115200 /dev/ttyS0" +LICENSE =3D "MI=
T"
>> +LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
>
> The file is originally from systemd itself, so not MIT.

Fixed locally.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


