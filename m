Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbIL6-0002xi-Fg
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 22:23:24 +0200
Received: by wwi18 with SMTP id 18so20474wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 13:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=i1Zcrz0kAt/VqMUPyPXoaEh2NwFklRjBPhOr7iRT7BQ=;
	b=pefers+GRQCNvCFkL813dSvmOP4gD8CedURxsGpdX6Si8pauA9xuwXuC+QuDK9YwBk
	xBOkaGUTU0O0kTo6P94ULZTS0fqkPnZxtE1D+i9KCDHkX/DmNZ9zNV7A1OV0XAZoyZDE
	8oIprSk5sf5U2QP1uQp+zxmxZkFVIRw5Tfg2c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=HIKpxM24hddcKtQu+NcilUFRkqiKixBdy1zMfzeIADADkjPZmuY1ngn7JmBEMOhNRO
	XKF4tLzz68GpaIe39fEyJ6me6bPdn9KOiQx/3A6HhM5P4Z5tkIBN0oJz+AOT/HzEvntR
	fcfjCMU/gPcfiz0U7hQaCfpMjke2YzzXX4iO4=
MIME-Version: 1.0
Received: by 10.216.142.133 with SMTP id i5mr782862wej.43.1309205983415; Mon,
	27 Jun 2011 13:19:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.89.210 with HTTP; Mon, 27 Jun 2011 13:19:43 -0700 (PDT)
In-Reply-To: <1309204699.21379.141.camel@mattotaupa>
References: <cover.1309203431.git.otavio@ossystems.com.br>
	<0a7128c3166d0729292e664918b76cf5b7074fe5.1309203431.git.otavio@ossystems.com.br>
	<1309204699.21379.141.camel@mattotaupa>
Date: Mon, 27 Jun 2011 17:19:43 -0300
X-Google-Sender-Auth: Y8yFpnRDouRMo5FrxSUtANAyrZ8
Message-ID: <BANLkTim+B0d3-E=0xVCuaYBBPBYEj5KjOg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [[meta-oe][PATCH 1/4] xf86-video-geode: add 2.11.12 version
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
X-List-Received-Date: Mon, 27 Jun 2011 20:23:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 16:58, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
...
>> +DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
>> +PE =3D "1"
>
> please remove the `PE` line as I wrote already in the last review.

Did it locally for next pull request.


--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


