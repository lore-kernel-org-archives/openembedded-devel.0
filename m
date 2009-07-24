Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MUTfL-00046n-LF
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 00:55:04 +0200
Received: by qyk35 with SMTP id 35so2470728qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2009 15:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=1wLR6QmO55DI9jH9IyhepWeDPPapgxRC8c3g/qeGEdY=;
	b=lSR1XJlXvkCqZIcPxWnbsTefZ2yLnaJp42N+AeIC29wfbuX0SoqfEh0snDzkp7cjlz
	4sPufhClrcUb3T5USR/l+BHdskPQx8Pav6hr/265hxUs0D7meU1/kFWUFUeduVJUKODv
	tyHI27g2nB8t8bDe3vjXUJ2aqUeiE4anW2Iow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=hlPQZzZ3x9O0oWMl+bZf++3BQXXW6aYKGdpnqWkqGIQ0ES3Yy+Y6UhO5Z4OM20FFsd
	3baOLpzRKDcPdE4xLsXJyguIWL01Si4zb+PZT18lRst6ccB64eIB84aYxF/3cA0QAJpM
	K6+lNj4CCz9XVLiK3xSqOcJB8pMJtKAFCZC4M=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.220.94.69 with SMTP id y5mr2899344vcm.6.1248475237058; Fri, 24 
	Jul 2009 15:40:37 -0700 (PDT)
In-Reply-To: <h4dcgb$lip$1@ger.gmane.org>
References: <b6ebd0a50907231059p27e821edlf3c7f92838ba4cac@mail.gmail.com> 
	<h4dcgb$lip$1@ger.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 24 Jul 2009 15:40:17 -0700
X-Google-Sender-Auth: 7f2fa25a6e4ad783
Message-ID: <b6ebd0a50907241540t251641dapb13e0aafa9822eb4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: UserVoice for feature/enhancement requests rather than bugzilla?
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
X-List-Received-Date: Fri, 24 Jul 2009 22:55:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2009 at 3:27 PM, Rolf
Leggewie<no2spam@nospam.arcornews.de> wrote:
> Chris Larson wrote:
>>
>> I set up http://openembedded.uservoice.com/ ages ago
>
> I'm kind of wary of tool profileration, especially if it means we are not
> masters of our own data anymore. =C2=A0I also never understood what kind =
of
> problems people were having with bugzilla. =C2=A0I've directly asked a fe=
w people
> and there was basically only one lesson learned; those who complain don't
> know about the features that bugzilla offers.
>
> Let me know where you think bugzilla in general and the way we use it in =
OE
> in particular falls short and I will either point out the button you've
> missed so far or work on a fix ;-) =C2=A0Seriously!
>
> OE as a community has a tendency of "Let's throw a new tool at it and
> everything will be pie". =C2=A0Will we ever learn that is not the case?

Bugzilla is lovely for tracking *bugs*.  Just as with wikis, it's
often overloaded for things it's not at all good for.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


