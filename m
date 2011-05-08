Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QItvt-0007cD-54
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 04:41:21 +0200
Received: by bwz5 with SMTP id 5so3725867bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 19:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zIyBbHSP3nB0yxEUr/QjJo5uG+Z9cA9JDDxAALQNChg=;
	b=GN5e0H4bA7OtbKWJKw2uyAPFdvMq80zPL6ORyUvyKvibarrj44RqDtLLdS+nMBG97F
	EdDz3f7v1WdilSkCtHldOx4mJjYUce2v31aaebf2ALWv327Me6UQPOsagVpr1pHE4E4a
	cbMFPIeFFvc1sHH3FZFdjK6IMb+F3RjnHZB8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=AcgH/0E3d0iwBOcznZZjacnUoNRFoFh+/rqkB9tWEYit8snm0khGWassuZnl8vJI+r
	Db4OMmgK84ZJyi/VIW/Zvk+ZMgvKGaFy1ECLwBARMt16ETuouunQGnnX70GxAzW9JcVB
	qTRaobCnr6+epgVz/dzLlDosb4lAu68HkTZ2Y=
MIME-Version: 1.0
Received: by 10.204.178.65 with SMTP id bl1mr3978045bkb.189.1304822318632;
	Sat, 07 May 2011 19:38:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sat, 7 May 2011 19:38:38 -0700 (PDT)
In-Reply-To: <iq4q32$e40$3@dough.gmane.org>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-5-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-6-git-send-email-otavio@ossystems.com.br>
	<iq4q32$e40$3@dough.gmane.org>
Date: Sat, 7 May 2011 23:38:38 -0300
X-Google-Sender-Auth: Fjs10pzBPFY3GgOCnf_0nJ5Jqt8
Message-ID: <BANLkTikHrZ6YaASMM2bmbnFkoEF8ZA7kJg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 6/8] p910nd: add 0.95 version
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
X-List-Received-Date: Sun, 08 May 2011 02:41:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, May 7, 2011 at 22:02, Koen Kooi <koen@dominion.thruhere.net> wrote:
...
>> diff --git a/meta-oe/recipes-support/p910nd/files/avahi b/meta-oe/recipe=
s-support/p910nd/files/avahi
>
>> + =A0 =A0<txt-record>product=3Dfoonas network printer</txt-record>
>
> That's oddly distro specific

Agreed. I have dropped it from the recipe since I don't use it now. So
let's add it if/when it is needed.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


