Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NaysW-0008P8-V4
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 22:59:52 +0100
Received: by yxe10 with SMTP id 10so2265507yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 13:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JBtKihUL9oxV0XrU5Hliq2jn4L705Woews3i0YSrwbc=;
	b=NIBbxrTXZY5lT6Rj4S+lYFwtW50Exw5AJqKO3ylfissiYITemitwfd6moRErvrR2fr
	CCHgg3lUyGxHcVFXHZPvkLORTKsVaqU3vWG/hboTtCpBFdPVPZ6gKU1d8XPiBf7BCsEV
	jsuwetEd9VLvu3jl0h3eqYA8MLxTVvasr+Xl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Q6ugc1qsrNFRXi34wbNbdRSa7qxy1sOI/9zVB4zEO7vKXqIqrrkw6rMe2fLTNYPL/t
	JK3hOgQ8BcVXcweK+w3ltEF5PHdL8P2SlC01lX8H+fl6+yL3pRhjyHj8A4cpGKimdAS7
	4gGq2kIO8tvFXocFzsp0beiXvbfQ+18thyBoQ=
MIME-Version: 1.0
Received: by 10.101.214.31 with SMTP id r31mr1940996anq.30.1264802242301; Fri, 
	29 Jan 2010 13:57:22 -0800 (PST)
In-Reply-To: <1264289812.3738.265.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1264289812.3738.265.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Fri, 29 Jan 2010 22:57:22 +0100
Message-ID: <ac9c93b11001291357qce6ea6eka4a7e3726ab041@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Perfect(?) workflow for patches.
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
X-List-Received-Date: Fri, 29 Jan 2010 21:59:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/24 Paul Menzel <paulepanter@users.sourceforge.net>:
?
>
> 4. Commit (if not go to 5.)
> =A0a) If the reviewer has commit access and accepts the patch, s/he can
> push it. A hook then changes the Patchwork state to =BBApplied=AB with th=
e
> appropriate commit id and archived(?).

What is the best way to commit a patch from patchwork?
I've peeked at pwclient, but ended up with python errors.

FM


