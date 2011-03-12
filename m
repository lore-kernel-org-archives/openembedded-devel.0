Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyEP2-0003mD-Ai
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 03:18:00 +0100
Received: by bwz10 with SMTP id 10so2979397bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 18:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=4tF6Hwkq7CbtFSbTUk6QNCG1wrefZQ9VfxEAEO69Yvo=;
	b=ERpxAxx71DiVIhyvvCFWr+NaiO6GXtLUapbvWrUkjO0yCnFjwT4kK66T5L32xSb8Ui
	dWJqsL9LKTpQuD5lbJNDVFNQLYUzMO+sSMogTdT0qbtT7h8SfHEUQ/5SLvbo9PGgiICU
	O6oW7AzKp5TWuZh8Fe0A0QOm8BBHOizc2/4V4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=LxlqwBwBX7YdyC0HK12PvFik14T42E6+0y2OSA7XFC77YxfjgPS+9UiPkR0HT+UN0t
	eDItV5mrXcdLiatrvZNv/urMutkeyzWnb5BNfIQIbZoskSvT5L7GbcbNiUk3cyj7CpU/
	eNh26H2Mi1E+XnTwmFOTVeEYj2pESbMTbQAUw=
MIME-Version: 1.0
Received: by 10.204.141.14 with SMTP id k14mr4169928bku.37.1299896182149; Fri,
	11 Mar 2011 18:16:22 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.174.65 with HTTP; Fri, 11 Mar 2011 18:16:22 -0800 (PST)
In-Reply-To: <20110311235346.GB5603@sakrah.homelinux.org>
References: <AANLkTik1GhO_ZX_oP3_TB6JR_73QPmM7t3jzxd4vbOkW@mail.gmail.com>
	<20110311080427.GB2478@sakrah.homelinux.org>
	<AANLkTimLqGc2snJHw4Oymfz9q+t+GDWF+ErL46eTzJB5@mail.gmail.com>
	<AANLkTinGAS+x7q=RVynv8QVV9gCD9RC_Yd+msyzYm=_m@mail.gmail.com>
	<20110311235346.GB5603@sakrah.homelinux.org>
Date: Sat, 12 Mar 2011 02:16:22 +0000
X-Google-Sender-Auth: dnj7aIQH3ze3SKScqjA8yS2rJBA
Message-ID: <AANLkTi==S4FgcwODFWjc+Rdf+zc6H+dC2CG7tingowCd@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] cpio.lzma compression level in bitbake.conf
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
X-List-Received-Date: Sat, 12 Mar 2011 02:18:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I have fixed it in my tree and will send a new patchset tomorrow with
it included.

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


