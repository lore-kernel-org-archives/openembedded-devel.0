Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKXq0-0000aF-QJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 18:39:10 +0100
Received: by mail-pa0-f46.google.com with SMTP id wp1so1707833pac.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=qTTO3YwC/iTbj0KG6tew5c+IBRXo6EGnbEJyhw6eNOY=;
	b=yIQPBBnMuC6e/UYpjrMIMtI7prwI2OUzP0gmUkOXDhJu6TU7JzbD8qfP73zTk3G3iC
	3HekJduKbUmtWBgUZQQWTglMVuy6pGExpd8eOULDUTUegYb7wEWz74Hyw2M9JppMMhJW
	D/KMb+PQTYOAJOVl1ZaJFgHuN28p8xSYzjaNX9Ds9B3wcLUZ/HdD8iSoB2nbtX+BvVPX
	Mz2ns84e6lCUCpVWVchdF7fafhLUIJjYq5hUwyt/EcaVS9EYSzG2mwnaa+mQnMmnz8FI
	d7ZClrM2IWAke/ImCSYCTVGsIB8t/JKZ5OP49Qh6YAuP5TO/1EpyCst1S66GVxJRH4Y8
	2Cjw==
X-Received: by 10.66.250.135 with SMTP id zc7mr24464042pac.162.1364318528344; 
	Tue, 26 Mar 2013 10:22:08 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id hu2sm18160893pbc.38.2013.03.26.10.22.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 10:22:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130326171401.4a383731@e6520eb>
Date: Tue, 26 Mar 2013 10:22:05 -0700
Message-Id: <8957F894-A80E-40A4-B6CB-6579C2EBEB13@gmail.com>
References: <20130326154020.GG7539@jama> <20130326171401.4a383731@e6520eb>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: origin/danny branch
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
X-List-Received-Date: Tue, 26 Mar 2013 17:39:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Mar 26, 2013, at 9:14 AM, Eric B=E9nard <eric@eukrea.com> wrote:

> Hi Martin,
>=20
> Le Tue, 26 Mar 2013 16:40:20 +0100,
> Martin Jansa <martin.jansa@gmail.com> a =E9crit :
>> I've noticed that there is new origin/danny branch, did you push it =
or
>> someone else?
>>=20
> I don't know as the last commit is not from me.
> In a meta-openembedded last synced on the 8th march I don't see the
> branch origin/origin/danny.
>=20
>> [new branch]      origin/danny -> origin/origin/danny
>> not sure if you have permissions to remove it.
>>=20
> it seems I can't.
>=20

Fixed. Please be careful when you push, we have intentionally made =
deleting branches hard
so we don't accidentally delete stuff. adding can be reverted :)

> Eric
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



