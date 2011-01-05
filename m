Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PaRaO-0002WT-31
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 12:31:24 +0100
Received: by bwz10 with SMTP id 10so14769569bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 03:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=8aYpk+xy4axE9Ae39OXgtoy9T/36GrOGh5L4LJioLaE=;
	b=DOTb+HLkE+7SRz1fRK8l17EWq9VqKG1SBqWdFjPI3sGU/Lkwm5vuXFKaP8woDb+J0s
	s3PkmNZ/vAWr3GtjBmkSUDxnEo3vHLeTmxN0PYoNWKN+2QZMNbZ+OLcjv7mFhXnNYeEi
	KQnDwDBnxd9HDHzKUAoT+0hSRHgYpGBfUcSuI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=LgtV4O5iQyS63ojM8Xx1joRXtQAMqKTBovBgJUmvPv/nfTWpoCyRbQyMIaURpAWlqv
	8wMsFpo0FR0jURXVzyXrNNw3tdA8LFkJl6AEU4n/1iFyu/pU96uVm4yySlL+l0/Bifgl
	YxErcTSP0Fd+Qcp4mE0gkXiYx3sZAZRls029g=
MIME-Version: 1.0
Received: by 10.204.71.141 with SMTP id h13mr5401254bkj.180.1294227059873;
	Wed, 05 Jan 2011 03:30:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Wed, 5 Jan 2011 03:30:59 -0800 (PST)
In-Reply-To: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
References: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
Date: Wed, 5 Jan 2011 09:30:59 -0200
X-Google-Sender-Auth: d-jh6LQLFNNrg22aapc0X_uQEiM
Message-ID: <AANLkTin_4KLFT9FADfeN=MN6RaDNH-ssueOK2w=sVbxh@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] linux 2.6.36: upgrade to 2.6.36.2
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
X-List-Received-Date: Wed, 05 Jan 2011 11:31:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 4, 2011 at 19:12, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Seems Petr, Eric and Robert are involved in these two machines.
> Care to comment on moving to 2.6.36.2 (or give it a stab)?

I am using 2.6.36 and I support the update.

You might do it and post the patch for testing so the affected people
could comment on it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


