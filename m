Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SfWCn-0002Dq-Ep
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jun 2012 15:04:49 +0200
Received: by vbbfr13 with SMTP id fr13so1741792vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2012 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7/gkGs5tZKHJyJ/RTewr/UClLyzQ3m6YkdBkhLPzhGw=;
	b=MFAVjxbjQXjP1ym1Bf3d0JQtr3EV4L6EL5LF3RUEgT0vPbTTQSXnPTe+7D19g9VQyV
	V8A8rbifMyCrBJxDNyDC0vt6xC2QC/33LmUioJwPFZrs+kYzqlHneN/vMmeL0bfWbvON
	5bg0qEa7/STsB0vo5R8G31g8QFybupWegNZpBcKBYT24ZOJwHe503Hf+Y1GoYZ7lGwrn
	/cGbU8YDDhHyrHUH8Totg4swYdGpOy/bwDyEizSaN0HoF+/svgpwTtWiG7wLCgFh6fWq
	n44EYGjaOgFPkL/II0iJhDG9km8hQkK63Phj1Sho7he9c0+HVfXnbplu1Lftw7iXeyaM
	jHpw==
MIME-Version: 1.0
Received: by 10.52.33.100 with SMTP id q4mr2487374vdi.59.1339764849624; Fri,
	15 Jun 2012 05:54:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.155.130 with HTTP; Fri, 15 Jun 2012 05:54:09 -0700 (PDT)
In-Reply-To: <1339759019-3272-1-git-send-email-sbabic@denx.de>
References: <1339759019-3272-1-git-send-email-sbabic@denx.de>
Date: Fri, 15 Jun 2012 09:54:09 -0300
X-Google-Sender-Auth: gfiVnkZY2GYuvG9833HBtdF6L5k
Message-ID: <CAP9ODKoZckSSRfDT4DQUfgj8UC6BsEgOzmV88GXyRpEB_9o1Qw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2] Added recipe for libconfig
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
X-List-Received-Date: Fri, 15 Jun 2012 13:04:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2012 at 8:16 AM, Stefano Babic <sbabic@denx.de> wrote:
> libconfig can be used to parse a configuration file
> in a structured language, but still compact and more
> suitable for embedded devices compared to XML.
>
> Signed-off-by: Stefano Babic <sbabic@denx.de>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


