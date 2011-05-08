Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ8Dt-0005Sw-9D
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 19:56:53 +0200
Received: by bwz5 with SMTP id 5so3952942bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 10:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TThP+vTZ25HCbj+4Mffn06ZnFcMPo4D6OH9yox0dcSU=;
	b=fZSv2vi9b+cSCF5Pm2qabJIwYw8O+komAIoQdD4SFXVESJg0xVe4dRtm2SkYnFhpqG
	Lp07Y67pKUmt0/9xxqty8SieAHJLIpC+4IWo90ZwgkfnGgGcl8O3lbiLCbeE7fmYFnuO
	xi3T1VTExCwCSqwHegFQQoDX+sKCP8P4V5bw4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Et7gDC/8JQiRfmYLG0Az5eim0A7JMrxH7imCL8VZ+9at9ddZ9rHY/njExEgEshmjch
	2/MaE0hH7rqRT1g6t87oTn55RE0AgfduQtkjWdmfCs1VUjrKWpxzAYu8ibRLi1fKrP0V
	U3Kr5bW12viaOuQmTEtVGYqUp0NI1JxtZ33nA=
MIME-Version: 1.0
Received: by 10.204.40.70 with SMTP id j6mr2662672bke.81.1304877249936; Sun,
	08 May 2011 10:54:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 8 May 2011 10:54:09 -0700 (PDT)
In-Reply-To: <4DC6D765.8060706@gravedo.de>
References: <4DC6CA02.1000009@gravedo.de>
	<1304873759-20379-1-git-send-email-morphis@gravedo.de>
	<BANLkTinj7NmL9h8R3EVC78YgPUaiBGqyFg@mail.gmail.com>
	<4DC6D765.8060706@gravedo.de>
Date: Sun, 8 May 2011 14:54:09 -0300
X-Google-Sender-Auth: BghLebFkidTe3JSgf8eWvGVuHYI
Message-ID: <BANLkTin_n8bs3cwNxjU7HrnjBEr+rh4j-Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt4-native: introduce the native version of qt4
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
X-List-Received-Date: Sun, 08 May 2011 17:56:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 14:48, Simon Busch <morphis@gravedo.de> wrote:
> On 08.05.2011 19:18, Otavio Salvador wrote:
>> Please remove the tools recipe too.
>
> Yes, I will provide a patch for this too. But first I want to know if
> you are fine with this patch?

For me it seems fine however I'd prefer if you drop the tools one at
same commit so it is easier to revert if required.

BTW, it would be nice if you could do the same for oe-core :-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


