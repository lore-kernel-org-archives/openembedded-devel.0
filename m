Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pp5oB-0006j9-Gc
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 22:18:11 +0100
Received: by bwz10 with SMTP id 10so5641273bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 13:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KcxoSvYCAjTFyxSgXND3csFkyvb5CEXsECMpDxiBfAE=;
	b=vv50ANXYUopc7mhQGVvv5KRp59LaFFg/z/QT2jQH7Hr/eHl9f3oPLGVbRbZYe81JcS
	HMo8XApnq4MVtu85y0R63kJ4cMCzmP7oeKn/C4E12BDI196aGupPd2hMvJQTq2ugRDeY
	P4ZPMFuZxius23mwH8zdrHTB9obQthtgKrUAw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Mq1IqzIyxmBS/DOKZ7kX7DyFMTnpIkL/YdQiTlB4mSl/g34g00R7ePTaJOojhILAA+
	tStxkdmMf/X20b7ugT7UGZrmgZHOJFzd9oB8BkqFLnHKVqShU9JDubVkgJ9b4VK4ztW8
	tCcyWd80jbbqjL9ZqIWR02MrT3FrZupri+OYE=
MIME-Version: 1.0
Received: by 10.204.51.145 with SMTP id d17mr3736721bkg.24.1297718219233; Mon,
	14 Feb 2011 13:16:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 14 Feb 2011 13:16:59 -0800 (PST)
In-Reply-To: <1297717608-30480-1-git-send-email-schnitzeltony@gmx.de>
References: <1297717608-30480-1-git-send-email-schnitzeltony@gmx.de>
Date: Mon, 14 Feb 2011 21:16:59 +0000
X-Google-Sender-Auth: HbgntJEfOBc4ByBrazE2GOaKiUc
Message-ID: <AANLkTinUqQGpAaHsM3H1k2CiNb4mx0iLj_E8i_YFNeqX@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add a small helper script listing all recipes with QA errors.
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
X-List-Received-Date: Mon, 14 Feb 2011 21:18:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2011 at 21:06, Andreas Mueller <schnitzeltony@gmx.de> wrote=
:
>
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
> =A0contrib/qa/collect-qa-errors.sh | =A0 26 ++++++++++++++++++++++++++
> =A01 files changed, 26 insertions(+), 0 deletions(-)
> =A0create mode 100755 contrib/qa/collect-qa-errors.sh

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Quite nice :-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


