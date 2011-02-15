Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpLVz-0004ad-Ai
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 15:04:27 +0100
Received: by bwz10 with SMTP id 10so438778bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 06:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZjSU0hszlCk+J+OO9QVIgsBD6NcVH0/PT0G/YIr16wk=;
	b=RIJf+ENMJE+M9tmOyxwuoK3CZEvuAt3Xu4VU1y3DSUDOMjhyS0t/Cu/JaIA1G/QyP4
	aXBPjrd8+xvpZ9A1EyoLVjBCPzZ/kjBTm/YDpjxKsDo6r6ElLrZQ/YY3fymM3cGoHjfT
	wcWLbJevPamvdQuBA+ZUEBkH5r3eoGsb935AA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=cT/RzhSo+pGrrLK6dAMSYzdEoj0x+G+V3E3bzQm+CZkiCv3I1daNAV0EaY3dqQUyI4
	vNCQ0SIRC8oKNLvQOGW9NFdfmR2YsFBdAKHWGV+/GWtsh0diF7P63cQWOR9XRY9B2sRZ
	zBJJaLAcVPqr5aPTcKIITfxXjiBs7WkWRdQ68=
MIME-Version: 1.0
Received: by 10.204.77.18 with SMTP id e18mr4462417bkk.78.1297778596670; Tue,
	15 Feb 2011 06:03:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 15 Feb 2011 06:03:16 -0800 (PST)
In-Reply-To: <AANLkTi=+ydSoGjJHkzO1FWNCDhUY0UZZ3PZZn60VqEj=@mail.gmail.com>
References: <AANLkTinN1b=egyKPv6N3rHq1HODKDyK15B22=1qBZcMZ@mail.gmail.com>
	<4D5A4E56.7040209@eukrea.com>
	<AANLkTinHw3SXsx89qis6NeYSxjhKjK278-VgKHXpbw7j@mail.gmail.com>
	<AANLkTi=OFf7JB6bYsEXCNG1MVNWTP6mFwdj+EhFHLMvb@mail.gmail.com>
	<AANLkTi=+ydSoGjJHkzO1FWNCDhUY0UZZ3PZZn60VqEj=@mail.gmail.com>
Date: Tue, 15 Feb 2011 14:03:16 +0000
X-Google-Sender-Auth: KxgLOy1iiM3yC_GfmPFZgNamXHY
Message-ID: <AANLkTi=KPnoFAUKqUud0m0zyt3vg5h4Z15U61kGudu1O@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFH] qt4-tools-sdk not providing right values
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
X-List-Received-Date: Tue, 15 Feb 2011 14:04:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 12:49, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> Now it fails to find the X11 libs. Looking at it.

All works fine now. It was a mistake in my cmake toolchain that made
it fail to find the X11 libraries.

All done :-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


