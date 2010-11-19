Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PJNWc-0001Ir-CI
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 10:44:59 +0100
Received: by gyf3 with SMTP id 3so2651025gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 01:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ViApx+V6TFR9FHOm2t8RPYKFg2iALZ2DKjL/JPn5bdI=;
	b=XOAE8CJ4DV50RspRzpK0MtxijnVHcsHCa5bt9MLhgDX1EPt5c052Fru6bBntfPi6tU
	Be+zLz1cVjObk93BVUWANN6qkKnPbZexcLqq34fBz4345cT0u0je6WS9TZlgfdsM3Bt0
	Fbw63p7528CdiX1lSawd6QMRmSiSRZbYqwEoo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aG8KzHbe0wvu/XHDKMIT7lIWg9yUK9Mvue+veTKS4I2tk3e6M2AajVaGEP/CgSla4r
	cckRNyE0TZ+J577ZqkkvFMWaJFJ3xEalCtTj+U86gLwqhtRcRPaGgBAwO6QQGBHnCQ6b
	1lzBzEDSmY2jsdjWQ3Z93MtTPbbZzs9c1WRqg=
MIME-Version: 1.0
Received: by 10.42.226.7 with SMTP id iu7mr1378120icb.67.1290159825502; Fri,
	19 Nov 2010 01:43:45 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Fri, 19 Nov 2010 01:43:45 -0800 (PST)
In-Reply-To: <20101119091100.GJ15069@ibawizard.net>
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
	<AANLkTimHjCR5N8WDd5kz4qPqZE=-XCyzz-xqYiE6VeaJ@mail.gmail.com>
	<20101119091100.GJ15069@ibawizard.net>
Date: Fri, 19 Nov 2010 10:43:45 +0100
Message-ID: <AANLkTi=myrWXNaBuManJ2NL4x9ikvqJTsGBhB6gtRuo9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Fri, 19 Nov 2010 09:44:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/11/19 Petr =C5=A0tetiar <ynezz@true.cz>:
> Cliff Brake <cliff.brake@gmail.com> [2010-11-18 17:13:17]:
>
>> Last week's test run was a success with 38 combinations passing. =C2=A0T=
hanks to
>> all running tests:
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_2010=
-11-12
>>
>> Due to the OE 2010.12 release effort, we are going to give the testing-n=
ext
>> effort a break for a couple weeks and ask people doing testing to focus =
on
>> the release-2010.12 branch that Khem is working on.
>
> Hi Cliff,
>
> it looks like, you've included my failed builds also :-) I don't know if =
it's
> intention, but I think, that only successful builds should be in the comm=
it
> message, right? Is it my mistake, to report failed builds on the Testing =
page?
>
> I'm really sorry, that I can only report my build results without fixing =
them,
> but I don't have any spare time now...
>
> -- ynezz

Failure should be reported as it is also an indicator of quality.
That's why the remarks column is there.
Preferably also indicate failure cause and tinderbox link.

Frans


