Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RJnwE-0003TX-QT
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Oct 2011 17:01:42 +0200
Received: by vwe42 with SMTP id 42so3506620vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2011 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-type:message-id
	:content-transfer-encoding:from:subject:date:to:x-mailer;
	bh=RIya3tZ9FEHDyyin1j4TzAZzT5mrlOhF5fItsUQnvXo=;
	b=jSnvJJ2jElor0Sk2Ws3Jyg6LJGOw9TFZ1bTlYFDa01NYKI5OaDFTaFVCsZlGiFwYhZ
	VZMHJIe2YAVspRy6DfxVSSaFWdAXjYXZAi1e7eAoz2Y1MtkYL0o6BuV/OceYKdLyLn1a
	NBVMtMMticJcUHqmlIUrK96pnh1i5/v2iz9BY=
Received: by 10.68.17.197 with SMTP id q5mr4616063pbd.25.1319813740415;
	Fri, 28 Oct 2011 07:55:40 -0700 (PDT)
Received: from [192.168.0.5] (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id w8sm24312481pbn.11.2011.10.28.07.55.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Oct 2011 07:55:37 -0700 (PDT)
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DCF6@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4013DCF6@post.tritech.se>
Mime-Version: 1.0 (Apple Message framework v1084)
Message-Id: <29E6EB36-4280-484A-A9FA-45DD784FE6A5@gmail.com>
From: Tom Rini <tom.rini@gmail.com>
Date: Fri, 28 Oct 2011 07:55:33 -0700
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1084)
Subject: Re: [2011.03-maintenance] New pull request for binutils
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
X-List-Received-Date: Fri, 28 Oct 2011 15:01:43 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Oct 27, 2011, at 2:48 AM, Mats K=E4rrman wrote:

> Hello Tom,
>=20
> A new, hopefully conformant attempt at a pull request (I also sent a =
pull request from github but I don't know where that ended up...).
> Please pull these two commits from here:
>=20
> git://github.com/mkarrman/openembedded
> Branch: maintenance
>=20
> Paul Menzel (1):
>      e5832d65b8  binutils-{canadian,cross}-sdk_2.18: Remove checksums =
and implicitly update them
>=20
> Mats K=E4rrman (1):
>      656bed267a  binutils_2.18: update SRC_URI to avoid manual delete


Applied, pushing as soon as I can get ahold of someone to see if =
something is broken with the server...  Thanks!

--=20
Tom=


