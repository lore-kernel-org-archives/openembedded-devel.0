Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpedR-0000mc-7x
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:29:25 +0100
Received: by bwz10 with SMTP id 10so1344366bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 02:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=r2I4RSRtbQu3d2H1rZzPN58An1NmFGJJtuSgdkTGDYE=;
	b=vstO7EJd0+X/QrTAFu+a+hUKZDFV/fOp1F1SQtLUd11k9ty/mRbUSuKDp/fgQi02wy
	hDhJF03zvc/DcjUsGoD3yTe16dF+0YfGczaNHBfn4uVpt2ErrilaiaJBMJvRZ4QRTgpq
	6S6Q+TMmoC8FEWQRPiIJ3qDZuJwkmEuvPa5Mg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=w/mvZbt/CMeYQ4AoUEgaRnB3sWgAz8O99gTii8IYYMFWhALvxBbh7YT5VWCiouV+2a
	8ZoE/KoU0ac8onyYhms8exkdzwMcsaf0ORA5sxbfKBYSFPIjx5Te/feqtgoO+UWvV0A7
	7vWOtC5wGX39e4yztKeLdB3zXzb5XUfiIqKWE=
MIME-Version: 1.0
Received: by 10.204.46.210 with SMTP id k18mr316816bkf.159.1297852090871; Wed,
	16 Feb 2011 02:28:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 02:28:10 -0800 (PST)
In-Reply-To: <AANLkTikkcjW1Rtt40Zt9+yZCQUJWh_P6Sdv5k8Dt=z=T@mail.gmail.com>
References: <AANLkTinQ9DmVt+3G3fh=-0wKKsR6Vr89dSvJUwOB8SAG@mail.gmail.com>
	<4D5ABB82.7000701@mentor.com>
	<AANLkTikkcjW1Rtt40Zt9+yZCQUJWh_P6Sdv5k8Dt=z=T@mail.gmail.com>
Date: Wed, 16 Feb 2011 10:28:10 +0000
X-Google-Sender-Auth: a0YRBpWOLJ50qDoj2_7e7IZqzDA
Message-ID: <AANLkTinUUtPptBfH+TkhrgwSTNGNB2RqDKc3cK1OQrH1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-cross-sdk: fail to build with 20110215 OE
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
X-List-Received-Date: Wed, 16 Feb 2011 10:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 18:35, Khem Raj <raj.khem@gmail.com> wrote:
...
> check why is that happening.
...

As requested I tested using minimal but it fails the same way.

Any guess about the reason?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


