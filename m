Received: from [209.85.217.166] (helo=mail-gx0-f166.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LhpC6-0006Mj-Uv
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 18:59:47 +0100
Received: by gxk10 with SMTP id 10so2503013gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jfGMlNchm3bYyczx3/d4PS+QTLqRQPDs8wTWG24tgj8=;
	b=kMEe/4YdUa/egbbOLT4IYFNrfpx0QArAmBSvujtUMWUCCyHuLm39xuCr01sBunx25w
	UB0tgaIBwARFqa7tvnVenzZifrYqtYvqfaGlrBLgYbz0I4fns/CwDzjdF6zZf5MSuBpK
	TMw8omYK6DptwXcrWrXCUrR95U9cJ4TP7zuRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=airkiijoQgSayvyB9EIQM+zqVEAb7cwzbATmYLL7uY9ELcXJuXgdhd4t99kV9hOGuG
	bYUs0qVH7V2kDKKVM6v9NJipWxKOzwhDDILowZ08JMaHnoE1F+vwNuDXL5dn9BVWFYoV
	qz322934QW1y9oucoadf90H6njq/RCBSgmTLM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.150.97.19 with SMTP id u19mr489482ybb.243.1236880770309; Thu, 
	12 Mar 2009 10:59:30 -0700 (PDT)
In-Reply-To: <200903121728.44337.marcin@juszkiewicz.com.pl>
References: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
	<20090312085123.GD30336@ibawizard.net>
	<1236863674.6250.21.camel@northpole>
	<200903121728.44337.marcin@juszkiewicz.com.pl>
Date: Thu, 12 Mar 2009 10:59:30 -0700
X-Google-Sender-Auth: da5ae450becd6ab9
Message-ID: <b6ebd0a50903121059u3c41c5b0odb118526ab475104@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Problem building kernel - too many files open
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
X-List-Received-Date: Thu, 12 Mar 2009 17:59:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

A

On Thu, Mar 12, 2009 at 9:28 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> Dnia czwartek, 12 marca 2009 o 14:14:34 Jader napisa=C5=82(a):
>
>> There's a patch attached. As I=E1=B8=BF new to git, I don know it it was
>> created in the right way. Used command following:
>
> Thanks a lot for patch. I checked it locally and pushed into repository.

Thanks for the patch indeed, I kept getting bitten by this one last week.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


