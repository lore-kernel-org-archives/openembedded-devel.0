Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NtFEX-0000Lr-Hn
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 08:06:06 +0100
Received: by gye5 with SMTP id 5so2061815gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Mar 2010 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4vYmexhlTSu80tD8ZzrYYr6M0YGz1J9OJvi44r2I/AU=;
	b=qX3CY4QUCk5+smG78L0zazd9lz032v1xQqFoKHbL00QgI2BGHIE1uafOBAsqM/D6qV
	KypH8vxx3wv15xL0NaazikPYFSlRYo7qreuqomhtJDdqQ1Zojk8ZGa2ZBvJB+4i+SBfR
	nDMSiq2LjuRmRd0IBkU8/2stqxVd45nGZ8rf4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cjvxiQcHtFFTVdq53q76gatPNI2Uxnhm4G2Fji1nNKw2Jrzg6Yvv8N8+7E9Kg2x6s0
	IcCM8V8P3dMz+f3188fZ0vMLU9tT/fkO3ApX5RWd2M/BvmuRsVq+uTSQfTty6QPW/FcE
	Jv+QtOkRSOmzgkNQCP+iXDaK2fPzPod95DrVQ=
MIME-Version: 1.0
Received: by 10.151.86.14 with SMTP id o14mr4910721ybl.43.1269154973668; Sun, 
	21 Mar 2010 00:02:53 -0700 (PDT)
In-Reply-To: <201003200008.19821.roman@khimov.ru>
References: <1269004282-10732-1-git-send-email-khimov@altell.ru>
	<201003200008.19821.roman@khimov.ru>
Date: Sun, 21 Mar 2010 00:02:53 -0700
Message-ID: <19c1b8a91003210002y23da07e8q345cc0304190caaa@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] squid: move potentially reusable in other versions parts to .inc files
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
X-List-Received-Date: Sun, 21 Mar 2010 07:06:06 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2010 at 2:08 PM, Roman I Khimov <roman@khimov.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=D1=D4=CE=C9=C3=C1 19 =CD=C1=D2=
=D4=C1 2010 16:11:15 =C1=D7=D4=CF=D2 Roman I Khimov =CE=C1=D0=C9=D3=C1=CC:
>> Signed-off-by: Roman I Khimov <khimov@altell.ru>
>
> If there are no objections, I'm pushing the series tomorrow.

you could also move it to using BBCLASSEXTEND when you are at it.

>
> --
> =9Ahttp://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


