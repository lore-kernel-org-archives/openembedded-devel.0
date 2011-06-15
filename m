Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWqJ6-0008FX-0y
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 15:38:56 +0200
Received: by bwz5 with SMTP id 5so528785bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0F5gvpsqpt4bWPEdvr/MRDG15Fb6iQUYuzgM9hX08bA=;
	b=vGpxtaHCpOdzsMaVBQ3G0RSKIIfjvIsh4YjQqzMkysrljig4bZOgERgdBr63nmbFBm
	za7hX9gUd8K0wixNoli4Rg8eN0xqbiRXRLcKXJyuc2yswgBCyWsnOwfP3KpO3fq/4hZy
	eLtsRKaPMnc6porHA99vihHY5aa8S5bnEkL1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=JCd/EkSml/x02PRDIr7D1dB0w9Ux5PNHx+mcp4in6YlwAHAwM9zF3RXK8EFNz3OtXo
	q242KYEHeseIJpBYb2FQwOsSaSEdWz2eX733WPN6txb0NPshEZbNzNQQRfDGuV8UGqZd
	2KsiAszNkD3S+aHBhTyAnM8z4h7qjRS2aggIQ=
MIME-Version: 1.0
Received: by 10.204.84.36 with SMTP id h36mr555721bkl.76.1308144928237; Wed,
	15 Jun 2011 06:35:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Wed, 15 Jun 2011 06:35:28 -0700 (PDT)
In-Reply-To: <itaauj$jjj$1@dough.gmane.org>
References: <cover.1308070134.git.otavio@ossystems.com.br>
	<c8746f02a08b8529448e09e7d2e2f28b2ae05bf2.1308070134.git.otavio@ossystems.com.br>
	<1308131824.4304.6.camel@mattotaupa>
	<BANLkTikKOpSeLzch8VZ5DjQnmBbspKRhxw@mail.gmail.com>
	<1308141294.7961.8.camel@mattotaupa>
	<BANLkTinEFGs7ChX+3bpQcbCBuUjG3Pfzuw@mail.gmail.com>
	<itaauj$jjj$1@dough.gmane.org>
Date: Wed, 15 Jun 2011 13:35:28 +0000
X-Google-Sender-Auth: grwdrQq89mYUo3UUYf-fztx80Kc
Message-ID: <BANLkTimp6YL24OkFXmJjL63nX6DsUNG_eA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [[meta-oe][PATCH 1/3] xf86-video-geode: add 2.11.12 version recipe
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
X-List-Received-Date: Wed, 15 Jun 2011 13:38:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2011 at 13:09, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>>> Could also please answer why setting `PE` is needed.
>>
>> It had it already IIRC.
>
> Historical reasons, it's from the x11r6 -> x11r7 -> 1.0 transitions.
> I've been silently dropping them when adding X recipes to meta-oe

Ok; I will drop it here then.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


