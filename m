Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PgF8d-0002q3-Ep
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 12:26:44 +0100
Received: by bwz10 with SMTP id 10so1560152bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 03:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HKfduiIbC3TSsbNJQi59Ttykm3vgvKOLsyJpBCmgPgw=;
	b=XTu1tUm3InLa7xCjTLTYrhrRhh/KiLDHRWPV5T1yAwYM0Vs3Ji4oEgNrYCe6PjUpGv
	X13qtRZUQ5PsiTKVdC+V2Ivg3wMP4l6a2aljw46TuLI0MaxaPNQVGC2QIkrrES+kT5W1
	XtyuEhF2vBqygK0bOUn+ybn71ilVwMejRFl7E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=f98bSLVVztxQfTU24wI12lWswg0UGNRh8CB0p0PZDlAeHfGmxQh36VjHbIkVxpCd7x
	+l6ceIhb+22jWWfglwgjBYnRuAQ7aBZfXsfTnD0frAK/TERNKMa/dD4P762Gax89FWW7
	GNBIdiy1DPZtf8aWlXmyY5FoD+pAex+dGSBxE=
MIME-Version: 1.0
Received: by 10.204.68.69 with SMTP id u5mr441463bki.99.1295609162963; Fri, 21
	Jan 2011 03:26:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Fri, 21 Jan 2011 03:26:02 -0800 (PST)
In-Reply-To: <1295606449.12720.38.camel@mattotaupa>
References: <1295606449.12720.38.camel@mattotaupa>
Date: Fri, 21 Jan 2011 09:26:02 -0200
X-Google-Sender-Auth: OGKjHVgDfaBX8hfcUHPpHZ_wdfs
Message-ID: <AANLkTi=MHys=ShhSnVt0C8kyhescObNdormVScOvacN1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: problems with Git server: `fatal: unable to connect a socket (Connection refused)`
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
X-List-Received-Date: Fri, 21 Jan 2011 11:26:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 21, 2011 at 08:40, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> =A0 =A0 =A0 =A0$ git remote update
> =A0 =A0 =A0 =A0Fetching origin
> =A0 =A0 =A0 =A0git.openembedded.org[0: 140.211.169.165]: errno=3DConnecti=
on
> =A0 =A0 =A0 =A0refused
> =A0 =A0 =A0 =A0fatal: unable to connect a socket (Connection refused)
> =A0 =A0 =A0 =A0error: Could not fetch origin

Same here.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


