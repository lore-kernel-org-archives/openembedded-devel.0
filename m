Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P6hQP-0002nt-TV
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 12:22:11 +0200
Received: by wyb40 with SMTP id 40so534957wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 03:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kOvNqzVXcRLzcy0Nxr63MGSJMYy99D/CChZ5vbIGz8g=;
	b=itA7+PO7FehNCutnKwNNjflo/9bv2lkDiZrhIDtM3EZRpetWxhmd99UGfFqtZBjERw
	1C8JfvUArSu/aibhEwy1taPhA69RnMAhNr1d2Lei5qotTjdQDeFAkbdMKP/VfkqdU4sB
	E6W1ZiiaJrsWFygiPGgc/reBF5Cs+9/JikdBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EdNP5yNfkWgbatvSeh6dOVbGMJjgfKm+X4eXylG0TWP3UjFoSqfsVI2I87ZTj/ljg6
	vMHg8qqEvD0XLL5FZtK+Ud48W7/0Gkzxiyd+EgNmWpNnBTw4n6C7sEi9x76Sq9DxQUFY
	mOhU6d/DH0b6zQWfid7ejjuNEiZzi2ENrRKa0=
MIME-Version: 1.0
Received: by 10.216.231.162 with SMTP id l34mr544014weq.77.1287138097743; Fri,
	15 Oct 2010 03:21:37 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Fri, 15 Oct 2010 03:21:37 -0700 (PDT)
In-Reply-To: <AANLkTini++RBtxheY+RZ2+7X-=i4NAbY39e2wcRA8mDh@mail.gmail.com>
References: <AANLkTini++RBtxheY+RZ2+7X-=i4NAbY39e2wcRA8mDh@mail.gmail.com>
Date: Fri, 15 Oct 2010 06:21:37 -0400
Message-ID: <AANLkTi=LSACiCoxqjyf9h+qhqp9tsQ+1D=j2Jk9N-H0i@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-14
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
X-List-Received-Date: Fri, 15 Oct 2010 10:22:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2010 at 5:56 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> master has been merged to the testing-next branch and is now ready for
> clean builds. =A0I'll finish tagging and updating the testing branch
> later today. =A0It looks like enough things passed to justify moving the
> testing branch to testing_2010-10-08.

tag created:
http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtesting_2010-1=
0-08

For more information on the testing effort, please see:
http://wiki.openembedded.org/index.php/Testing

The testing effort has turned up a number of issues, so I think it is
proving beneficial.  At some point we may want to consider making the
testing branch the default branch on checkout, or at least suggest
that new users start with it, and a known working build combination.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


