Received: from mail-bw0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsDvw-0008J8-C5
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 13:35:08 +0100
Received: by bwz2 with SMTP id 2so3654bwz.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 04:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=VtFhVULTX0U/5k91RYfnakmsZKXsBCT5QUBSPYKoeKc=;
	b=XWopPuZbulbIB8hLehYCKQgDIqTh3E8RA9PQXUlB+ZyVmEiJwZSLX1va5W77Kudacj
	Pl4ZH94QVQOCUVu6VTvFSB9nfTitKYHbxkd1kXaRqC50reyMXGNVTuHQqlVW8tNPYkER
	hxl8rYRL1eHabIxiRUdidTZg19BVA1Slr7C4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=f8QPZqmhXOI5JUAMEb/LaeWfWKGN6quo3SzpYJPKyzeA1UgZlyivvdnAqTDQiWqZre
	UYzSp3KwkXB3O+QwzQ6itYYHZsHCQvLhpMmuSw9CswF224o2E7emw/B3X/V6tGX/i1Q6
	h2KYwgyhGf7CfMKNq3AkB9INAOUMwh6rBhAiU=
MIME-Version: 1.0
Received: by 10.204.50.196 with SMTP id a4mr3559231bkg.213.1298464429234; Wed,
	23 Feb 2011 04:33:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 23 Feb 2011 04:33:49 -0800 (PST)
In-Reply-To: <20110223093217.GA28556@mi.fu-berlin.de>
References: <AANLkTimGuqfEAYzvk3+4aH=rPWHb=Q2gNY4zWLwhAuRi@mail.gmail.com>
	<20110223093217.GA28556@mi.fu-berlin.de>
Date: Wed, 23 Feb 2011 12:33:49 +0000
X-Google-Sender-Auth: CdHYtvFnYdq6Hbl6GvVY_-5hu-k
Message-ID: <AANLkTinjgb5wCLs=zgaTNcJN+7ZSdwS5rYDdK8byzNtq@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: libcap2 build failure
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
X-List-Received-Date: Wed, 23 Feb 2011 12:35:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2011 at 09:32, Henning Heinold <heinold@inf.fu-berlin.de> w=
rote:
> On Wed, Feb 23, 2011 at 02:54:02AM +0000, Otavio Salvador wrote:
...
> gnutoo hitting this too. It's a problem with the kernelheaders, because l=
ibpcap includes a kernelheader
> but some how not the types definition header. But dont know offhand if he=
 solved it.

I am looking into that, after talking to gnutoo.

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


