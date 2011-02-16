Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ppp6g-0000J0-1F
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 22:40:18 +0100
Received: by bwz10 with SMTP id 10so1915192bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 13:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=BuH6xFipLuLWdKWWn9Apn9dX69m+TYhzjswleLpdDic=;
	b=aDuIYk3TRXtqY+kaU+RRbbdo0CxGQyd1pbVlzkNDLs1aFWx3BI0nqxDxT+0uOnen8f
	ny6JfSgixoWQxVth1AELEUc/5n870ddHYnVnBd4CySJDfI6UAdFjAYjGbNxOJC5ptHJ7
	uKk9CxVqdVQsI5zv2F68+YDb9HYDUsUSPG8Zk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=trMx0e5ugQUbpP+ZpDLZCTS/4tQC3afULuxh6mG0NYWurVTG5VrFF1qZTE7brpvq2R
	C6dhg1Zr7PQjnRqAp1ZUykpinUH/995nx4m6Lzyqc1hp9YyO6b6XsmSZPtlFpu9Y7Oj9
	+LqgcDpsxA8Hihihvjo+6bBJREWep+4yUEFIQ=
MIME-Version: 1.0
Received: by 10.204.77.18 with SMTP id e18mr909598bkk.78.1297892346252; Wed,
	16 Feb 2011 13:39:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 13:39:06 -0800 (PST)
In-Reply-To: <AANLkTinUUtPptBfH+TkhrgwSTNGNB2RqDKc3cK1OQrH1@mail.gmail.com>
References: <AANLkTinQ9DmVt+3G3fh=-0wKKsR6Vr89dSvJUwOB8SAG@mail.gmail.com>
	<4D5ABB82.7000701@mentor.com>
	<AANLkTikkcjW1Rtt40Zt9+yZCQUJWh_P6Sdv5k8Dt=z=T@mail.gmail.com>
	<AANLkTinUUtPptBfH+TkhrgwSTNGNB2RqDKc3cK1OQrH1@mail.gmail.com>
Date: Wed, 16 Feb 2011 21:39:06 +0000
X-Google-Sender-Auth: whopQ7svdmcBTManlXm9zq6KWw8
Message-ID: <AANLkTinTTJfyA7yFKF61OiWYmCnFye25w1_2L0Ln3Z-Z@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 Feb 2011 21:40:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 10:28, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
...
> As requested I tested using minimal but it fails the same way.
...

I did some further test:

 minimal/qemuarm - OK
 minimal/i586-generic - FAIL

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


