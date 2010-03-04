Received: from mail-ew0-f216.google.com ([209.85.219.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1Nn8Fe-0001XY-NZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 11:25:55 +0100
Received: by ewy8 with SMTP id 8so1454011ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Mar 2010 02:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=s0UpLubaDXVW/Rkt/+9SP4TMLI7AyNhRhHJnruOnHyo=;
	b=u/4InaGuWXYdbyenW4/ES1kLE3Oy6/yVNxTfp23osuZ7D86NiwhXtf2SopY+yFNmjN
	eJk76bQIvKHYMpoD6ldpYW0iWM+gpo5NniJOmS7WdrH1ohgw3CmBDkARmlw3/0H+Woyf
	O1A/wsTXHAwXt5yaCxX49NDuHSvlpBgKdxPCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kL+rkmfGmM83H43v3SxmkE3h4UMY+eNZAeIvvKSwpJNSDysaW01nq4Kr5lsTKvs9Ta
	e9mKvu2BvGD8itno/Xwevqork6iVl/GMCrzg/sb7I6CizDpRIUm8qp+/dpZG6imfR0vI
	lepJ7s8vBFoX65q2dqIRgN46grq9tjlC7fOnw=
MIME-Version: 1.0
Received: by 10.213.109.201 with SMTP id k9mr3202880ebp.95.1267698182514; Thu, 
	04 Mar 2010 02:23:02 -0800 (PST)
In-Reply-To: <4B8F84F7.10806@fqingenieria.es>
References: <4B8F84F7.10806@fqingenieria.es>
Date: Thu, 4 Mar 2010 11:23:02 +0100
Message-ID: <bc36f8ed1003040223i5a3bf1car97ced08a4bdf8afe@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.216
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: I.MX25 and OE
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
X-List-Received-Date: Thu, 04 Mar 2010 10:25:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

> Just a question: Is somebody working in any port of OE to an I.MX25
> Freescale platform. As I can see, some people has been porting this
> processor to the kernel mainline, but don't know if any recipe/s exist or
> are under development.
>

I am about to start working on adding the mx25pdk support to
OpenEmbedded. I will start this job in a few days.

Regards,

Mickael

Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


