Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P9IwG-0005aI-Bb
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 16:49:48 +0200
Received: by wwb39 with SMTP id 39so355513wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=YKzcmt5g3JrWIyjBXv0haPNgkYqwveLVrvEQZYd4Gck=;
	b=FUHdiRpR8FMWvQBNtiOvp4xD7i64qsx5KSL8FRQ7qVr0E4LPWq5Zj8sc9/BPzvOBCL
	7JbKzpXGoqrECuTZ2kqqTb4OaIN3EHf/qqqpeRJK2mi3Q1JYaFbE6mNtvmcCHG//squD
	5vhdJvbh8cJPBTS2mBUxGyddV6f9cchfUuCN4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Q1PsCCXaH6AIcYQ9tbwo0/1S142f7Uh83RzuZ8mM4WzHnJ0T7VQJ4g9ofq0jzEZXQ7
	twbUGfE2N6BZmED7Ea505u2qAU3sdA0iwLwQlcmLNycW0VGrlec5SC9xLM84Qcc/k3YC
	e45rr41VFsP/3YbaF/CZ55WiULqgfFRZZIhls=
Received: by 10.227.145.135 with SMTP id d7mr2957313wbv.96.1287758933273; Fri,
	22 Oct 2010 07:48:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Fri, 22 Oct 2010 07:48:33 -0700 (PDT)
In-Reply-To: <AANLkTimPLjpHi7Xt=NsnQRxHOR+9ZWEPoTE7PjssdzN1@mail.gmail.com>
References: <AANLkTikq1TNg1Y=f7tVjpkZR8Hre1FoGyK1gUGTKNDKB@mail.gmail.com>
	<AANLkTimPLjpHi7Xt=NsnQRxHOR+9ZWEPoTE7PjssdzN1@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 22 Oct 2010 07:48:33 -0700
X-Google-Sender-Auth: uO6Iv79DTx4cy6wkzHbqDbhbgp8
Message-ID: <AANLkTikpZZ-k7sOiFP1yZhR8N8hqp5TKUxVhLddgLh1W@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: empty strings
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
X-List-Received-Date: Fri, 22 Oct 2010 14:49:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 22, 2010 at 2:00 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> ping.
>
> people don't care?
> I feel there are some issues in the examples below (and some easy
> cleanup actions).
>

Feel free to use my ack for the series, the ones you've sent patches for
seem pretty obviously correct to me.  The other empty strings may need more
review.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

