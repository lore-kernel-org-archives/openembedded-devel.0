Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pb7FY-000776-Cr
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 09:00:40 +0100
Received: by iyj18 with SMTP id 18so16348857iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 00:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZMVMb/NZoNu9BuKeDgvbzGK9SSfEtTXCFC289+RncVg=;
	b=xGipK8RPfvA7rOsphqrZLJHaFZPi9wUZVCwH2+m8dV1o1EPGe2Ui3j4/zV5ciNCJ1E
	+imnhp6iV5RC2vYNQbQQXp2OBFSnmlQ5qYOlCnUSjKXOQX8d2qeZNvVSIoMO7bBRqE0F
	qCXZOnvJR8J7u6G0Xje5cc3xJ5CVzULY4KGcU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ttnWlePobGTRa3Bto4Hy/fEfBD9AZoZeArV8MzyseOrcy48FlPnMTA3Ou94TdJbyxS
	Cjz+rJf8Tm45zgO+zK148V8IYjaKJIBa60yAxxtMsAVAsNbBMzn/D1cW/4lrZopkpWFq
	xc7wKmEPMSVNhxsQpLVC79FDonfu+rdF50i/M=
MIME-Version: 1.0
Received: by 10.231.20.68 with SMTP id e4mr25135280ibb.194.1294387210692; Fri,
	07 Jan 2011 00:00:10 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Fri, 7 Jan 2011 00:00:10 -0800 (PST)
In-Reply-To: <4D266CA1.4060306@mentor.com>
References: <AANLkTimqbQNtFt6NUi5D03nSnfRMyPxqrLYsN=PB4v+C@mail.gmail.com>
	<4D266CA1.4060306@mentor.com>
Date: Fri, 7 Jan 2011 09:00:10 +0100
Message-ID: <AANLkTimRs2Cb=-TgmJxoKu8c-SxAA8PS0RquRQsvDGRE@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2011-01-06
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
X-List-Received-Date: Fri, 07 Jan 2011 08:00:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/7 Tom Rini <tom_rini@mentor.com>:
> On 01/06/2011 04:22 PM, Cliff Brake wrote:
>>
>> master has been merged to testing-next and is ready for clean builds.
>>
>> There are only 7 combinations listed as passing. =A0If anyone has data
>> that is not entered, I'll check back tomorrow morning before I create
>> the tag.
>>
>> For more information on OpenEmbedded testing, see:
>>
>> http://www.openembedded.org/index.php/Testing
>>
>> We have lost some momentum with testing, so it would be nice to pick
>> up this effort again (speaking to myself first). =A0I just ordered a 2TB
>> drive, so hopefully that will give me the capacity to do some more
>> builds.

My results have been added and my new tests will automatically kick off ton=
ight.
Will report results after the weekend.

It might be convenient so move some of the less-active testers to the
end. Quite some entries have been added for the release, but those are
apparently not part of the weekly test.

Frans


