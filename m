Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OP8w5-00052y-3x
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 08:51:09 +0200
Received: by fg-out-1718.google.com with SMTP id d23so1515352fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 23:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SmvvAIFCtjJvIAe5Hw3JuaLaFEss6vASCp3WtXwgpi8=;
	b=qbki26TL1IqiA+41ZLYRwHSj3CWLz9TsIMnp0RNLPU78zlSMeozfVWGahPbBqxmDTw
	Z7v8e627WVjlzG/Ul4zD9J6sokpzHyMXA776Li0UWF3pHYieYiQCPZm54fCeqYWvgitB
	Xs5KEQEeuRr8MFKwnjvf3xZBmu2BqQcd2X23A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SDVz462XuyyMX4OjlJc/mf8zLsfi1dooBahHJHE0899syFgxRGIzssRHAsyQvOljM9
	F+p5FNSnqIKeMH0FY7DFVda/5mZtQmDxcVX3SZipMnkPLlcRxIX1BtBlkmnOcMtnUiZq
	RSl979ADtT3Fs/naM07QTugG9OA9NqVQWfIYw=
MIME-Version: 1.0
Received: by 10.204.73.205 with SMTP id r13mr7394988bkj.35.1276757180972; Wed, 
	16 Jun 2010 23:46:20 -0700 (PDT)
Received: by 10.204.119.12 with HTTP; Wed, 16 Jun 2010 23:46:20 -0700 (PDT)
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CFB0@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CFAF@KCINPUNHJCMS01.kpit.com>
	<4C19B59F.70008@freyther.de>
	<76E258664B189C4CBEF125491CA11ECC9445E0CFB0@KCINPUNHJCMS01.kpit.com>
Date: Thu, 17 Jun 2010 08:46:20 +0200
Message-ID: <AANLkTik6d7QY6uzMDZclGLC2lD8szm1iHmX4BGwwcoGI@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded SDK
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
X-List-Received-Date: Thu, 17 Jun 2010 06:51:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/17 Soumya R <Soumya.R@kpitcummins.com>:
> Hi,
>
> =A0 Thanks for the reply.. I have created our own image for mipsel in ope=
nembedded..
> I know to write own machine ,distro and kernel compilation..SDK is new to=
 me so can you
> guide how can i start with that..

What about: http://tinyurl.com/37odza9

FM


