Received: from mail-gx0-f213.google.com ([209.85.217.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NmRJJ-000640-SS
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 13:34:50 +0100
Received: by gxk5 with SMTP id 5so84067gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 04:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=wa3IYqk86EpQThLCRzOEvcavdWrngDh2bisnAhTv8J8=;
	b=C4f1yYHcbScNTYxwZx2xB1LeY8JaHZWh3gl6q6/mbOKytxXGp/u/Z7O5qOz1VqRD3O
	bsTesYr6cEojAnW6pl+rSOuGa2kVzbQyF89E7ovuTERhr3ASnz5Gp07YbCxYpBQr7ubc
	I3BPXVZFgopHiJSTLYIL3EdH34YUs0OHHqFw0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SSaY+ZMbr0N89+CRO6BCZ+nclzkHhZNq13mGWy+rr5gTeE8aKroMMebBFgQVaxnfRm
	tFv1TKFYFR5Dh1AfHPLOvgJheu8jkVSuC7Ncboa2E7t3UZ8wtIp0qfF/gpAMGkrz7U+2
	PrdQeLIBR4qp0daKRS7+lCmsPBW+HivvHyc8o=
MIME-Version: 1.0
Received: by 10.100.54.5 with SMTP id c5mr475923ana.81.1267533118699; Tue, 02 
	Mar 2010 04:31:58 -0800 (PST)
In-Reply-To: <hmivei$h8j$2@dough.gmane.org>
References: <E1Nm0HI-0004Qt-Pn@melo.openembedded.org>
	<d1b08f941003011337i15e21dcx340cef502c2ea151@mail.gmail.com>
	<201003012255.35738.holger+oe@freyther.de>
	<hmivei$h8j$2@dough.gmane.org>
Date: Tue, 2 Mar 2010 13:31:58 +0100
Message-ID: <ac9c93b11003020431r7b571732ycadb9f6a897f471f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.213
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : angstrom: sync pango and pango-native versions
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
X-List-Received-Date: Tue, 02 Mar 2010 12:34:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/2 Koen Kooi <k.kooi@student.utwente.nl>:

> This commit also shows that using BBCLASSEXTEND isn't so hard, more
> people should try to convert their recipes to it instead of deleting them :)

The recipes I feel responsible for all use BBCLASSEXTEND and new
staging, thank you.
It are the orphaned recipes that are not converted.

And personally I don't think bashing people will motivate them to
spend time on those issues.

Frans (who thinks that having 26 variants of a recipe most of which
are unused and unmaintained is not quite to be considered
"professional" either).

Frans

> regards,
>
> Koen


