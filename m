Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q23TC-0003lb-I2
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 16:26:06 +0100
Received: by bwz10 with SMTP id 10so5732327bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=YjJtV/yHXSLFBXCEcwrq5auVQ5wvr9/mOJO2aoNY8Xw=;
	b=fqQopVpf2uxd3opdg1pZQstHPm8/e4Vfref4i3MbMTi/Kr9zV70OpY6aA6GLBuT6t2
	eGFOpaOPBIF6s9/th8QxnGxzIdp7g17/YkTmtRtwvVftPPp//oeMXNYWw/b9KPuknmdU
	4BIrG2k9Bm9Tx/z8cqc++4LhSixQEeqXJZKbA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=F442CjsJyrfLgXmyhaYX9XrOouw+QqZatJSbu2ndwg0gJnb+VU6hBGe66Agxz5yWyJ
	nJBHYP6NPc3jDZr7RdnyZwNxhq2XH9ZoRR1SA8Rjtx1Wi5vajkcLtHSpwXb+SUeb7g7r
	POGXE+WCacJKher5nw/sp7QKoVsYnwi34yMcw=
MIME-Version: 1.0
Received: by 10.204.17.1 with SMTP id q1mr5148576bka.131.1300807400075; Tue,
	22 Mar 2011 08:23:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.8.15 with HTTP; Tue, 22 Mar 2011 08:23:19 -0700 (PDT)
In-Reply-To: <1299958038-25216-6-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
	<1299958038-25216-6-git-send-email-otavio@ossystems.com.br>
Date: Tue, 22 Mar 2011 12:23:19 -0300
X-Google-Sender-Auth: i7FVaZ82pSKUsZnNSLajjMEwHR0
Message-ID: <AANLkTin-pkyxw6choohuEDdSHSjXtfZ-J+DVNAYg1g0q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 05/11] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Tue, 22 Mar 2011 15:26:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 12, 2011 at 16:27, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

ping?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


