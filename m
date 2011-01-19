Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PfWIi-0001RO-8M
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 12:34:08 +0100
Received: by bwz10 with SMTP id 10so675651bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 03:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZWxlJaUE2KuvHK7yYIvw6cBpHHHnqYxBu4ERaxCUxFw=;
	b=wTQ7AgKd10GJMNRurVqioZ13PeMX0IRhcNv5Jm92HV1nNO80W2q3a+AvINnl4A8+km
	l1xqxZVSqm5k2US1tO0NURxTM4u8SRsKo/A5hpxQf/JSZG0qPyQfRvqpPUW0gC2Bbc85
	grajXWKDeolSHdbuAXCHZhLWW/Ioyswq9ktWA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=kvLz0K4NVX5w8F+BNhhlYMiFXVmg/x1o/p3787q5fctuQDrpVmmqI08Y43r+lP2wyI
	pMrUsPtubD8qVvEx2HV+k7FdGyLvJ7DRaRnWjhiaDWo6XtrDDYieu7NAzo6t5Tw1500h
	fXPoUmHoEjLsjr55LGQUtE09O/hfX/UkU5CjM=
MIME-Version: 1.0
Received: by 10.204.129.83 with SMTP id n19mr459176bks.207.1295436810334; Wed,
	19 Jan 2011 03:33:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Wed, 19 Jan 2011 03:33:30 -0800 (PST)
In-Reply-To: <1295432257-12844-1-git-send-email-Martin.Jansa@gmail.com>
References: <1295432257-12844-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 19 Jan 2011 09:33:30 -0200
X-Google-Sender-Auth: uYh1qig1nKt7Oas0deA-eagN_Ig
Message-ID: <AANLkTi=_4cQVcenS5XooK98bePPhP1jV71_5nBLk==YN@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gnutls: remove old unpinned versions
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
X-List-Received-Date: Wed, 19 Jan 2011 11:34:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2011 at 08:17, Martin Jansa <martin.jansa@gmail.com> wrote:
> * move LICENSE_${PN}-extra from recipe to .inc file

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


