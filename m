Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pnsfj-000540-OL
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:04:29 +0100
Received: by bwz10 with SMTP id 10so2988116bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 05:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=fRsH4jez4YY3QwCfOrVFGChu4b7mvfJmW2+/n1VkTLU=;
	b=aBQOQz4zFqPvTytH0xu12TuO1gdYKaNgx1dFDNVElRwSXPnQBykqKjfIvc/ZFJxT+k
	XrGn83zWd5cb5HSExo08Tv89BtVfsYUhOfEzDaS/YsADvUZIA/eGmXRQDeSTurv9H1Yn
	U7mrqXUkemkL4wHpVMGF2T1yseOTpheEp3RK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=hAmSUx83ittG4JhDz1TZqrjByRVSUIj66mpFwYT0y5omqxuaM8x9gjWj7jKPdxNkMc
	m5+BnG3AGZuDdiHVulg5FNYGvO7inXVoihk9AjEsF8WUTF7F+ZlDvg1o672O8ReDVJe/
	8IPwtMMhYtdX2U1vhZNsYNa2hABh9TPiUC0lg=
MIME-Version: 1.0
Received: by 10.204.60.17 with SMTP id n17mr1021886bkh.190.1297429386705; Fri,
	11 Feb 2011 05:03:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.56.135 with HTTP; Fri, 11 Feb 2011 05:03:06 -0800 (PST)
In-Reply-To: <1297428703-2330-4-git-send-email-obi@opendreambox.org>
References: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
	<1297428703-2330-4-git-send-email-obi@opendreambox.org>
Date: Fri, 11 Feb 2011 13:03:06 +0000
X-Google-Sender-Auth: 6CjTfrDbwekX3631hemeMbYqnBI
Message-ID: <AANLkTi=NyuTs44uL5G0xytxM=m9nqvdccoG1Nuv_kGUb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] gitpkgv.bbclass: rename git_drop_tag_prefix to fix conflict
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
X-List-Received-Date: Fri, 11 Feb 2011 13:04:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2011 at 12:51, Andreas Oberritter <obi@opendreambox.org> wr=
ote:
> * fixes ERROR: Error Method already seen: git_drop_tag_prefix in
> =A0'gitver.bbclass' now in 'gitpkgv.bbclass'
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


