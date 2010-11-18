Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PJCkL-00072D-Tf
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 23:14:26 +0100
Received: by wwj40 with SMTP id 40so1183528wwj.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 14:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6/SZjMGC5k6R+8kMVc+YlsAl8aShcrF1QCD3NXL8PDg=;
	b=PiUtZ5N8FgfQC0CE5gASZXnlann82lq02lKrnl+Qg0WQZtRQEKNJKHnU4RPLUIweSU
	Mz5niRymqitzyrquZin4OYAuxalsH30VfkIyzAZw3K7ROsMHzhrwzzicaTNkeOP9hT4w
	XFI/vNCNbxzy86FhQHpwqZrPAB1EqdWhpqANE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iFQOo3OgDk5+MHOu/Bpu4ohmJz8AkheH08llF8+YUfl16j5gnQ3VUM6+QHT/B20GNZ
	oJ47AGjnSs/VAMtM+bgKbXtkQYFjrO7X1gWifIc5QV8Ey7XJUsxruQ/L+Ckks9BrTQ+u
	lfAUy4lWCW9R3hiofRZe9mnT8+IDW0njypglw=
MIME-Version: 1.0
Received: by 10.227.141.71 with SMTP id l7mr1331366wbu.68.1290118397938; Thu,
	18 Nov 2010 14:13:17 -0800 (PST)
Received: by 10.216.235.214 with HTTP; Thu, 18 Nov 2010 14:13:17 -0800 (PST)
In-Reply-To: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
Date: Thu, 18 Nov 2010 17:13:17 -0500
Message-ID: <AANLkTimHjCR5N8WDd5kz4qPqZE=-XCyzz-xqYiE6VeaJ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-11-12
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
X-List-Received-Date: Thu, 18 Nov 2010 22:14:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Last week's test run was a success with 38 combinations passing.
Thanks to all running tests:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_2010-11=
-12

Due to the OE 2010.12 release effort, we are going to give the
testing-next effort a break for a couple weeks and ask people doing
testing to focus on the
release-2010.12 branch that Khem is working on.

Thanks,
Cliff


On Fri, Nov 12, 2010 at 12:17 AM, Cliff Brake <cliff.brake@gmail.com> wrote=
:
> testing-next is ready for clean builds. =A0Not many builds succeeded
> last week--I suspect people have been busy:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_2010-=
11-04
>
> An overview of the testing process:
> http://wiki.openembedded.net/index.php/Testing
>
> Thanks,
> Cliff
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> http://bec-systems.com
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


