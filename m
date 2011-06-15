Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWpkA-0007Hc-UN
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 15:02:51 +0200
Received: by bwz5 with SMTP id 5so494965bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MA/n8FY1S1DIlVVMeEN45sf2gBG3emwU/vabvEl79yQ=;
	b=ekmPuUpz7H++kNvT/GjFHek8FmHpThmL8nPbTKnHxb4vYOsrRvtfDWoBqWjemkXP35
	Xt3vjs8BxSERybJjfS1CfahNz6ShwI+76XlXiGykiJzFXf7sIv/2qK3lRJhP51laX0jo
	5trX1oA98Py6NUMzZHtiHCtC4p/e5Ufzgt7eU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=PzOFW6HUbpzSeCLjIkcj4WkucvnY2xijOYhlQxECKBIS8VlYeJnz6Xjh4FLfnHaSfK
	UKtzumaxJBQPyaqs549a/H10EVF8Zu8o5YGLhNSdYeGz7cixulaTg2RqY9cS9vyXfLeT
	S5qHM+V0KBFXlNKkWOfSvqWomkcPF/XIzog3s=
MIME-Version: 1.0
Received: by 10.204.65.19 with SMTP id g19mr497829bki.49.1308142764365; Wed,
	15 Jun 2011 05:59:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Wed, 15 Jun 2011 05:59:24 -0700 (PDT)
In-Reply-To: <1308141294.7961.8.camel@mattotaupa>
References: <cover.1308070134.git.otavio@ossystems.com.br>
	<c8746f02a08b8529448e09e7d2e2f28b2ae05bf2.1308070134.git.otavio@ossystems.com.br>
	<1308131824.4304.6.camel@mattotaupa>
	<BANLkTikKOpSeLzch8VZ5DjQnmBbspKRhxw@mail.gmail.com>
	<1308141294.7961.8.camel@mattotaupa>
Date: Wed, 15 Jun 2011 12:59:24 +0000
X-Google-Sender-Auth: w44nZVU_MeKKO7AAFwY_HH_NCHk
Message-ID: <BANLkTinEFGs7ChX+3bpQcbCBuUjG3Pfzuw@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Jun 2011 13:02:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2011 at 12:34, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
>> In fact no ... it is based on an old version from OE that I changes to
>> look like we're using today.
>
> So you just changed the checksums and added the `LICENSE` field?

I don't recall exactly what I did but I guess so.

> Could also please answer why setting `PE` is needed.

It had it already IIRC.

>> But AFAIK it is on Koen queue already so too late to change.
>
> Koen has not pushed them yet so it is not too late in my opinion.

I asked him to drop it and wait for a new version.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


