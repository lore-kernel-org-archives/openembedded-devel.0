Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1Lc2Bx-0006oL-Hm
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 19:39:41 +0100
Received: by bwz9 with SMTP id 9so5656886bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 10:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HdwyFlei5EGxLC24R9P/Xp2TAtN7/BXfaoeWtG78iqY=;
	b=DavCyCqlk6j2HXArzuONI4ZzQ4X26VXmKxskf04PJZLmO1BiBKT8Bjnu/HaPBOx2bR
	sttGccW8XX6D9Qo22xEjvNclEp3vccUudAMaWSI9PDTCoyfvlahy6lRbWLQ2KTMeooET
	8bw7HyOvO9rHrzmHIqBerNo99FMTSxmn1uR+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZfUlHvNEa8BmQIGmMM78pV0fTRVGN+a7PnKmCEIF6FF2YcVbMMA4RG0nAm0BFHNKZK
	hOQso1OHQ1X63JRIw9thKE0Jq9hADuDcT47BJnCbU6UBuvaifwLjWZc/nXfHuQrCV310
	Rg1TV6MrblCRDqJ/a6PLP4JQvv5ilnElrBeVw=
MIME-Version: 1.0
Received: by 10.223.113.199 with SMTP id b7mr1290faq.82.1235500595821; Tue, 24 
	Feb 2009 10:36:35 -0800 (PST)
In-Reply-To: <8763izyarp.fsf@neumann.lab.ossystems.com.br>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<8763izyarp.fsf@neumann.lab.ossystems.com.br>
Date: Tue, 24 Feb 2009 20:36:35 +0200
Message-ID: <fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 18:39:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2009 at 8:01 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Michael 'Mickey' Lauer <mlauer@vanille-media.de> writes:
>
>> Am Montag, den 23.02.2009, 23:46 -0700 schrieb Tom Rini:
>>> I'm going to make a different suggestion. =C2=A0Lets just drop it.
>>
>> I'm in favour of this. I don't think they give us the safety we want and
>> they introduce more inconvenience.
>
> After reading the thread I'm also in favour of this.

If you guys don't need it then just disable this checksum feature. No probl=
em.

>
> --
> Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br =C2=A0http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://projetos.ossy=
stems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


