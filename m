Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P7JY9-00035Z-IZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 05:04:42 +0200
Received: by wwd20 with SMTP id 20so2494256wwd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 20:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=h5LOyueWeBwXkIagvK4ePnf6q7gdy058JN/oBtqAP1A=;
	b=KWLPi4hl7HVgVUdCmPzhPAEyu8ihv4OgLx9H9U7dXMnsl9HNBYsWnm6vNJ/81EqSQD
	NfTjQawSxNp6jL70KGzQKF2/NqVNdZA+XQiAHaMqmkqBlRFGZKGu9Rn0WVlhoK8nAcnR
	zNrU2qF3831ht04FMbLEsSzPBMTL6YWS3ZpL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=r8Cd9QhUgIbRFSv5Z6NycBfKvCTqY+XrnJnmXr/30yYWurRxAgQCv1LNGqv/heN/aI
	amopdhKThqlwlu2j5WGJVbl/e6xn6PKISY0uUeII9w/HaeVTVoNwONFOTOs76LaPeSDd
	VFwAY7UNz9BAz/6hXXlUYZ5+yElLpbsC6TIQQ=
Received: by 10.216.8.14 with SMTP id 14mr2885475weq.7.1287284183170; Sat, 16
	Oct 2010 19:56:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Sat, 16 Oct 2010 19:56:02 -0700 (PDT)
In-Reply-To: <AANLkTikvPnJupAjwCps+3Zc73jVNyd7Mm-X1PP307a-D@mail.gmail.com>
References: <AANLkTikvPnJupAjwCps+3Zc73jVNyd7Mm-X1PP307a-D@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 16 Oct 2010 19:56:02 -0700
X-Google-Sender-Auth: ez0hVyAkvIIo4mScBPcmNX5C2SE
Message-ID: <AANLkTi=eMntWJyN0SkNED8p-kFxGpxPsfTY7=jMe_gzr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: LICENSE, LICENSE and LICENSE
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
X-List-Received-Date: Sun, 17 Oct 2010 03:04:42 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 16, 2010 at 12:15 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> BTW: I've no plans to clean this up. I've been there in another world,
> and it is boring like hell (and in that world I was at least paid for
> it)
> Just want to pass the results.
>

This may be a good task to add to the OE janitors page, ideally gathering
together more detailed instructions on the process in a wiki page for the
janitor task.  It would be another way someone could contribute who doesn't
know where to begin.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

