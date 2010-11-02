Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDAFF-0005dI-J6
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 07:21:22 +0100
Received: by iwn42 with SMTP id 42so7631411iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 23:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uF5GoKryTvvwgkCY/EA9xbvAjd7KSjQJE0WApw8/uMk=;
	b=Fkj/n0OdKyVa6xVKMV9dNU5psIOU2jyzkmUatDQq6CFtNusDeE8vjkuYo2s9edjnBf
	4pUzHJaSHHTWZsh6ga0IVYR/90LpYa9bNhxaiMG2aF1nym9tmkHcFqW9Q/YkLqUODRPx
	WkvxUeDMxhKb+wHP4WlTbTQ2TCsMAZdNedGEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rQ5wbOm5Q2bqhX6MIA11kWSbP08dwCAMtdNxPbB4Khk7vhBzN26gHSS8ZB+mbgzQQt
	1mCuDAeOo+lIgbZX1ta7LGGOuc6sE2Q065kaP6d2AqSqJOO4VpI64UACGIVWYmWsRbmD
	jRV00TJa3bAQTfIOIAo1HHVDSZ0vvQaZybeho=
MIME-Version: 1.0
Received: by 10.42.230.65 with SMTP id jl1mr1824956icb.134.1288678832825; Mon,
	01 Nov 2010 23:20:32 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 23:20:32 -0700 (PDT)
In-Reply-To: <AANLkTinSGLG=xGCdEvebwRERu7SKgbvAz=K7VP--d1YZ@mail.gmail.com>
References: <AANLkTinSGLG=xGCdEvebwRERu7SKgbvAz=K7VP--d1YZ@mail.gmail.com>
Date: Tue, 2 Nov 2010 07:20:32 +0100
Message-ID: <AANLkTinUfimZaMA_3O_t5g98bV0jho7GrKT2o=Uo-jBP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2: move old recipes to obsolete.
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
X-List-Received-Date: Tue, 02 Nov 2010 06:21:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/2 Graham Gower <graham.gower@gmail.com>:
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0.../gphoto2/files/10-camera-libgphoto2-device.fdi =A0| 4883 ----------
> =A0recipes/gphoto2/files/10-camera-libgphoto2.fdi =A0 =A0 | 9308 --------=
------------
> =A0recipes/gphoto2/files/90-libgphoto2.rules =A0 =A0 =A0 =A0 =A0| 1000 --=
-
> =A0recipes/gphoto2/gphoto2_2.4.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 17 -
> =A0recipes/gphoto2/gphoto2_2.4.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 18 -
> =A0recipes/gphoto2/gphoto2_2.4.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 18 -
> =A0recipes/gphoto2/gphoto2_2.4.7.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 18 -
> =A0recipes/gphoto2/libgphoto2_2.4.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 28 -
> =A0recipes/gphoto2/libgphoto2_2.4.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 27 -
> =A0recipes/gphoto2/libgphoto2_2.4.7.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 55 -
> =A0.../gphoto2/files/10-camera-libgphoto2-device.fdi =A0| 4883 ++++++++++
> =A0.../gphoto2/files/10-camera-libgphoto2.fdi =A0 =A0 =A0 =A0 | 9308 ++++=
++++++++++++++++
> =A0recipes/obsolete/gphoto2/files/90-libgphoto2.rules | 1000 +++
> =A0recipes/obsolete/gphoto2/gphoto2_2.4.0.bb =A0 =A0 =A0 =A0 =A0| =A0 17 =
+
> =A0recipes/obsolete/gphoto2/gphoto2_2.4.2.bb =A0 =A0 =A0 =A0 =A0| =A0 18 =
+
> =A0recipes/obsolete/gphoto2/gphoto2_2.4.4.bb =A0 =A0 =A0 =A0 =A0| =A0 18 =
+
> =A0recipes/obsolete/gphoto2/gphoto2_2.4.7.bb =A0 =A0 =A0 =A0 =A0| =A0 18 =
+
> =A0recipes/obsolete/gphoto2/libgphoto2_2.4.2.bb =A0 =A0 =A0 | =A0 28 +
> =A0recipes/obsolete/gphoto2/libgphoto2_2.4.4.bb =A0 =A0 =A0 | =A0 27 +
> =A0recipes/obsolete/gphoto2/libgphoto2_2.4.7.bb =A0 =A0 =A0 | =A0 55 +
> =A020 files changed, 15372 insertions(+), 15372 deletions(-)
> =A0delete mode 100644 recipes/gphoto2/files/10-camera-libgphoto2-device.f=
di
> =A0delete mode 100644 recipes/gphoto2/files/10-camera-libgphoto2.fdi
> =A0delete mode 100644 recipes/gphoto2/files/90-libgphoto2.rules
> =A0delete mode 100644 recipes/gphoto2/gphoto2_2.4.0.bb
> =A0delete mode 100644 recipes/gphoto2/gphoto2_2.4.2.bb
> =A0delete mode 100644 recipes/gphoto2/gphoto2_2.4.4.bb
> =A0delete mode 100644 recipes/gphoto2/gphoto2_2.4.7.bb
> =A0delete mode 100644 recipes/gphoto2/libgphoto2_2.4.2.bb
> =A0delete mode 100644 recipes/gphoto2/libgphoto2_2.4.4.bb
> =A0delete mode 100644 recipes/gphoto2/libgphoto2_2.4.7.bb
> =A0create mode 100644
> recipes/obsolete/gphoto2/files/10-camera-libgphoto2-device.fdi
> =A0create mode 100644 recipes/obsolete/gphoto2/files/10-camera-libgphoto2=
.fdi
> =A0create mode 100644 recipes/obsolete/gphoto2/files/90-libgphoto2.rules
> =A0create mode 100644 recipes/obsolete/gphoto2/gphoto2_2.4.0.bb
> =A0create mode 100644 recipes/obsolete/gphoto2/gphoto2_2.4.2.bb
> =A0create mode 100644 recipes/obsolete/gphoto2/gphoto2_2.4.4.bb
> =A0create mode 100644 recipes/obsolete/gphoto2/gphoto2_2.4.7.bb
> =A0create mode 100644 recipes/obsolete/gphoto2/libgphoto2_2.4.2.bb
> =A0create mode 100644 recipes/obsolete/gphoto2/libgphoto2_2.4.4.bb
> =A0create mode 100644 recipes/obsolete/gphoto2/libgphoto2_2.4.7.bb
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


