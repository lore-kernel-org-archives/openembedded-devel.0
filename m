Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N78SV-000597-6m
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 15:09:38 +0100
Received: by ywh7 with SMTP id 7so2081193ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 06:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=NFLsToid0ZCEAiAcbLBkwQ6QACqS+/XTfGixeNF2BLo=;
	b=RjM0QXHeQA3LRYlJLR0ufLH0t9bU0w+pqTqDmvvV+jjyA0ok5YPLFh4a69RunjAu2M
	vTSBrOG/7zM4nNGmetVT4KDFijtWHxF6QkX5YR2/vURs4I/0JOMXLhWDrSBO4RRIaKEH
	ojA6nocxMJT62F3u2xViiJLx3YN90mpuHAyEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Stg+TiSFoxDwqGIQlV0UaSy0l6FrtpblSuzv0OA8qhvPpuOWY0KU/XPcYf7/KHEzoX
	g6oSMv+M0ZzEVClO1RekmEAIOw1HWY9zDmV/hCmgnzhq+i2RXOPKAAR/D9KylyykVuy/
	dI/kQi4HzNT1KwrEhqOY9qqxuZqqV1tNnKss0=
MIME-Version: 1.0
Received: by 10.101.29.11 with SMTP id g11mr2545305anj.125.1257689293683; Sun, 
	08 Nov 2009 06:08:13 -0800 (PST)
In-Reply-To: <hd6ggj$tf3$1@ger.gmane.org>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<hd4qpq$ee0$1@ger.gmane.org> <1257682982.26962.14.camel@opal>
	<hd6ggj$tf3$1@ger.gmane.org>
Date: Sun, 8 Nov 2009 15:08:13 +0100
Message-ID: <ac9c93b10911080608y6db44dache5b521eb64fafe2d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sun, 08 Nov 2009 14:09:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Without making a comment on the commit message:

As stated before the 3.33 version is clearly mentioned as "latest
development version" on http://xmltwig.com/xmltwig/
The last stable version is 3.32
This project decided to provide snapshots (or whatever you want to
call it) of the new version. In this case 3.33. Their choice.

IMHO OE should have used the latest stable version.

Frans


