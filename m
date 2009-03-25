Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LmSdF-0005c0-HT
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 13:54:57 +0100
Received: by yw-out-1718.google.com with SMTP id 9so9586ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=iIV5CK9p92ZuXCKQAOOU0faj3jjyR0fer5B9MEMI4JM=;
	b=NoPnsLo6JHTeo+YKWbWm3RPCVs9wEFo0skpKw1yTlD07cC/wuE5klCNSN0tRgJOsVV
	gdCGP0knYOBbjA3ezIvM9z4d4jAbPBoa9C4CTpIieMrhrbPll76G9ZiHjXImi22NZrxh
	SkiFS2+rSXu16GzzGDkSY1ersaBcSQEvZevbM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=wMQUlSlt4p9N6rd6kSvLKm8BZsWSXPW+QTlv+K7xUm/n2VFAZgV6jq1mu3vg8FNfMV
	ffHgS6RhV1aGH+cWQePxRDbPjlCyeSeUVAkjfw/05V8J+O+X0w6hawJa/cxePOwbZTzI
	uwd8B4TSsoqTCbxtPlqJj5WJ7NmcRYKNG2MUI=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.153.6 with SMTP id a6mr9153974ane.68.1237985602756; Wed, 
	25 Mar 2009 05:53:22 -0700 (PDT)
In-Reply-To: <49C9FEFF.2010802@bolloretelecom.eu>
References: <49C9FEFF.2010802@bolloretelecom.eu>
Date: Wed, 25 Mar 2009 09:53:22 -0300
X-Google-Sender-Auth: 167697f703cab8ce
Message-ID: <be7a9f3d0903250553j67849ed5s1b9ffe2eda570f94@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Dropping qt4-x11-free versions 4.1.2 and 4.3.3?
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
X-List-Received-Date: Wed, 25 Mar 2009 12:54:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2009 at 6:53 AM, Jeremy Lain=E9
<jeremy.laine@bolloretelecom.eu> wrote:
> As part of the general cleanup of Qt in OE which I am currently undertaki=
ng, I would be
> interested in knowing if anybody uses version 4.1.2 and 4.3.3 of the qt4-=
x11-free packages?
>
> Ideally, I would like to keep only version 4.4.3 and add 4.5.0 sometime i=
n the near
> future. This would allow us to simplify the rules used to build Qt.

+1

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


