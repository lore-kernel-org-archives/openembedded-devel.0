Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ov8hH-0002kE-Ps
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 15:03:53 +0200
Received: by gwb10 with SMTP id 10so973167gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 06:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oOFj22NwACec8xdb3b149mlBzOpuqKPC+D6OYB0RaLg=;
	b=qhnpOhNjuW3PG4nBeDiWTlXEu1fAPrOc50+ij4rXvYY1LL2XakiGWd9wERX4V3e3G8
	N5oViYoc4uXiBBnRAzPgiYM1wUa+7rCW6/ehWf69lMoVP9fr4vcD5UlS6Wr8DN7O9QO9
	bHopRVvlRCLaUCUfRKzeDpmncW8Z1SJ6Ppoo8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=c6BVDUQGT+R2yRSpzf5p3V1vWJLTFbn6zNa/r/OE2jGaDs76cXMpqgZVfZEyu51HMK
	9cDS69Y7nRG/zbVuMyQs1sTYEljfy1x4qx2nLORY+4L3y/FU8N5u4N0C0QG9JMG0Tm96
	XnQclctYRPdOQvfEU1asjiYHvzqUpt5NTBUKw=
MIME-Version: 1.0
Received: by 10.150.138.4 with SMTP id l4mr602490ybd.237.1284382979736; Mon,
	13 Sep 2010 06:02:59 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 06:02:59 -0700 (PDT)
In-Reply-To: <201009131631.58835.khimov@altell.ru>
References: <1283644814-27013-1-git-send-email-hvontres@gmail.com>
	<201009131631.58835.khimov@altell.ru>
Date: Mon, 13 Sep 2010 15:02:59 +0200
Message-ID: <AANLkTikFZv53zicF-sUF+WZJdk=WL=_pKQSc6NNBnx7C@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dnsmasq: add version 2.55 from upstream
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
X-List-Received-Date: Mon, 13 Sep 2010 13:03:54 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/9/13 Roman I Khimov <khimov@altell.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=CF=D3=CB=D2=C5=D3=C5=CE=D8=C5 =
05 =D3=C5=CE=D4=D1=C2=D2=D1 2010 04:00:14 =C1=D7=D4=CF=D2 Henry von Trescko=
w
> =CE=C1=D0=C9=D3=C1=CC:
>> Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
>> ---
>> =9Arecipes/dnsmasq/dnsmasq-dbus_2.55.bb | =9A 13 +++++++++++++
>> =9Arecipes/dnsmasq/dnsmasq_2.55.bb =9A =9A =9A| =9A =9A4 ++++
>> =9A2 files changed, 17 insertions(+), 0 deletions(-)
>> =9Acreate mode 100644 recipes/dnsmasq/dnsmasq-dbus_2.55.bb
>> =9Acreate mode 100644 recipes/dnsmasq/dnsmasq_2.55.bb
>
> Acked-by: Roman I Khimov <khimov@altell.ru>

No problem with this version, but is it useful to keep versions like 2.52.
Please avoid version clutter!

Frans


