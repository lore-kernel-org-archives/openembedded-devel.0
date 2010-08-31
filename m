Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OqOkL-00075z-Lt
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 13:11:36 +0200
Received: by wyg36 with SMTP id 36so7165505wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yti8jGcm8MVFl2YaVPx0gB4/3xESB5PcOkhMaUXy720=;
	b=CDVVDlyTtvxABN8o7FgMK6LaKxngMy4IJWmDksiHuVjwTtF1580JlefcN0+teOM0zp
	VFNJwwQhYm2XwPaT2+/9zukcHdAjj7A/SWbVuUdU9huaJU00xtGY7cw0o0NwZJL2j4d9
	sCdeT0JSFLlo543Z0VhN9TJI25l5yA1ce1Jco=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Yo+M0rejN45OErgWVH9R70iqevxj+BZZFl4gY2BIXNnipofUkTPN999gpCJVnrQin2
	U++iHgU4sWDdWliLcqD6L/0HafQPs3VXn05iZaxb+/TMQ0lRP0AemmpRtiZ0zFvFwlHA
	OEFmqTzeE7d9oZdD/ET9eOBQ6Eym/4HtxLcBI=
MIME-Version: 1.0
Received: by 10.216.7.78 with SMTP id 56mr1492739weo.96.1283252702489; Tue, 31
	Aug 2010 04:05:02 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Tue, 31 Aug 2010 04:05:02 -0700 (PDT)
In-Reply-To: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
References: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
Date: Tue, 31 Aug 2010 07:05:02 -0400
Message-ID: <AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
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
Subject: testing branch 2010-08-30
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
X-List-Received-Date: Tue, 31 Aug 2010 11:11:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

sending again as it appears the last email did not make it ...


---------- Forwarded message ----------
From: Cliff Brake <cliff.brake@gmail.com>
Date: Mon, Aug 30, 2010 at 11:51 AM
Subject: testing branch 2010-08-30
To: openembedded-devel@lists.openembedded.org


Hello,

Last weeks testing cycle was a good success I think -- thanks to all
who participated.

http://wiki.openembedded.net/index.php/Testing

I have tagged the branch with an annotated tag that includes what built:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtesting_2010-0=
8-23

It seems like we are getting good coverage of target machines,
distros, and host machines. =A0I would like to add a target to get some
coverage of Qt x11 and Qt embedded.

Ideas on how to make this better are appreciated.

One change from last week -- I renamed the testing-testing branch to
testing-next as I think that is a little more descriptive.

The testing-next branch has been updated for the next testing cycle,
and is ready for builds. =A0Please see
http://wiki.openembedded.net/index.php/Testing if you would like to
contribute tested combinations.

Thanks,
Cliff

--
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


