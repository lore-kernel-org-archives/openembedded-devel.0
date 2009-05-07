Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M2Db0-00060T-Cf
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 02:05:46 +0200
Received: by yw-out-1718.google.com with SMTP id 9so674778ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 16:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SoIyUU8N5psOlLEcmoUkNiGfjojij2wOl2JWCJ7C/nc=;
	b=RRhz4zJuEchAcQfTc3mnttdpp5KV/n685gNWEsKe8toXGoN2A34zqpDhpdpFbLotEw
	xQlHJ+wHBUnLmBPmnlNyOkqaBLnAO1tkobxb0J9mzlF7aqKvrrZu3LgT/VXV44HKf9Jt
	EMuNnCkfjOCivT/4wE684Rtl2p9oeggloI630=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r5xIyIORsNEPKUDwbUWiOcNKq4h8+oqTEvYX5Kbqez16QeT/Wj2cZUvthWMOk5pRPG
	yA6GpGnHSBlqxFetsQUngcYMG/e4+K3hMIBMO+KMwHFntRlo7nZaZ/SdAFC6E8zO1aev
	QW6ig2XptHgG5ENB9mH6LJ178iBqV0XzI81pI=
MIME-Version: 1.0
Received: by 10.150.202.8 with SMTP id z8mr5465836ybf.81.1241740776988; Thu, 
	07 May 2009 16:59:36 -0700 (PDT)
In-Reply-To: <4A0362B1.2070707@palm.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<1241720835-17998-3-git-send-email-msmith@cbnco.com>
	<b6ebd0a50905071202l6d595de3v66d2ac043a84a2af@mail.gmail.com>
	<4A035E86.6020105@cbnco.com> <4A0362B1.2070707@palm.com>
Date: Thu, 7 May 2009 19:59:36 -0400
Message-ID: <f96d234e0905071659h6f0297bcm32ba20b2f7a608e3@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: manual missing dependencies section?
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
X-List-Received-Date: Fri, 08 May 2009 00:05:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rich,

I've put a current copy of the bitbake documentation on the OE server
(http://docs.openembedded.org/bitbake/html/), and pointed the link on
the following page to it:
http://wiki.openembedded.net/index.php/Documentation

I'll include bitbake documentation in the OE documentation generation
script so it gets automatically updated from now on.

Thanks for pointing this out.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


On Thu, May 7, 2009 at 6:37 PM, Rich Pixley <rich.pixley@palm.com> wrote:
> The version of the bitbake manual currently on berlios,
> (http://bitbake.berlios.de), appears to be missing the section on
> dependencies.
>
> http://openmoko.opendevice.org/build/bitbake/doc/manual/usermanual.xml
> (search for "recrdeptask") still has it.
>
> Is this intentional?
>
> --rich
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


