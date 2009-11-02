Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N4tCP-0001Eo-Hr
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 10:27:44 +0100
Received: by bwz9 with SMTP id 9so5956891bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=isIYylpA195dgqqXUjbPZge1HmqwqFfeN5my/hIi+XI=;
	b=u2P4lsXcmlw0oEAVoRqCGHTLfgReiN5rNiK8UirFsYaRxwKQthuYCDFNeyFFCjyzGe
	qOEEh10N/FYETEUoll0xOtDEQ9x9NJ+F6+fWwskR3qqgeSquxj0sPuFkKPtpRTXYeJVb
	0EXSi+LolQlS5exlMAA+Qvp7l4XZLcs5BOG4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=upvzpye3mccRVzm3dKRRBtZNadDpHcUQIgDfPSsGVeGR1HfM1ilP45YHAC57YTViRe
	RGIppbr/LKpg076rhMMdlFz84A2lCqg8UG6MrU1HUd6AVgTvhmXhgrv5kev5IriXjlAF
	PCwaeiz9OcMeEIrGzeHvWBUVymjUtb1rqd8SE=
MIME-Version: 1.0
Received: by 10.239.142.145 with SMTP id g17mr510666hba.55.1257153990740; Mon, 
	02 Nov 2009 01:26:30 -0800 (PST)
In-Reply-To: <200911021007.03089.holger+oe@freyther.de>
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
	<200911020306.33189.holger+oe@freyther.de>
	<hcm606$u90$2@ger.gmane.org>
	<200911021007.03089.holger+oe@freyther.de>
Date: Mon, 2 Nov 2009 10:26:30 +0100
Message-ID: <c384c5ea0911020126n1ea45a51u822dec38f171ec6f@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Mon, 02 Nov 2009 09:27:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Mon, Nov 2, 2009 at 10:07 AM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Monday 02 November 2009 09:41:42 Koen Kooi wrote:
>
> No, it means we have another bug somewhere else. :)
>
We must define a key for finding the correct entry. I think the
package name should be that key value and has always been?

(Or did we use the full original URL as the lookup key for the package
in the checksum file?)

BTW, googling for the MD5/SHA256 is a very good cheat for finding
alternative locations, as I have learned during development of
'witpa'.

Regards,
-- 
Leon


