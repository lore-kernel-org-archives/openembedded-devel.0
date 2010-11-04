Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDvkq-0000zA-8P
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 10:05:08 +0100
Received: by ywo7 with SMTP id 7so660087ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=grnDtncF3hhAR82eCk66f8MlYmjKkMnkNX+Q6G9rPfg=;
	b=ri3Vg85bsBb4rFvcvdUH4Rj82BGWKekpL4vhwHfgiRKclrXzYkHj2bBjmMSNp670y/
	oLdO396WawlPemNuPPDxYwM35AH+1GtM0cCqZt9uI69yHfUmCcPC1rVgh6kW1585vtEr
	WN2bTgkHMGC8zJcpKFlWMeWT872K+2qDIroIY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=s7UGRfTuwhInEWOccmpOpRs3m6OT2KmYJVhQKVg9xbdmOE5/xOfrXOEpc++QMXLwx7
	P+usYEGWWXc27VtTZc1TGw1kkV01auvEoZrOv0I7/Gre+LE5y98rI6o51ITiUZTmUWMg
	YsFEeWjEdbLKTncxBr7Qj6YCDHiONe6a+CCrY=
MIME-Version: 1.0
Received: by 10.42.230.65 with SMTP id jl1mr186787icb.134.1288861455548; Thu,
	04 Nov 2010 02:04:15 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Thu, 4 Nov 2010 02:04:15 -0700 (PDT)
In-Reply-To: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
Date: Thu, 4 Nov 2010 10:04:15 +0100
Message-ID: <AANLkTik41guXnsc313d7ipwruLPSTYKOfgmO3g4gAjOd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Thu, 04 Nov 2010 09:05:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

My testing results are added.
As I will be afk next week most likely there will not be results for me.

Meanwhile I did carve a page on my testing script (as requested by some):
http://wiki.openembedded.net/index.php/TestingScript

I have also added a link to that page on the Testing page.

Feel free to improve...

Frans


