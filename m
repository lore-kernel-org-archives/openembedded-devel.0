Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ferrario.f@gmail.com>) id 1NF3GG-0005nw-U2
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 11:13:43 +0100
Received: by ewy4 with SMTP id 4so3892595ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=dGGsSbn93Qwqrd69OXoQ9RGL0ZBCs6qqTpOh/fUgeoQ=;
	b=YTiDQFFIpnSXArC7chPmYPQkinpWf/Z9km6gX/Z9njYTdW0Vzs9msWe3FwclzbnPfv
	nRO/vmuqP0THihpCKMvJBHqOCGZisJREscww9HVWgqOq8rek95U9ZYjUluxduEm5ZsZN
	muTuHlaQhBBQzRQnyEZ2MaPWVghRbDNfMYOA0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ffz8wpb95F4FbJ5I5BhBEIPJMnqyOerSLJ2HjJqvVXG0VhoTCW65HsIS+lpkLreivQ
	yHwgOCNNGdL/clCC1MDReNdkksSbvwb78pfBX+Y1rQmR+BcMTFl0LMkFXssP1A5lRyJi
	YFibO9FIiGaXMReHEJ2DkiO4z/4fxioRJ2Czk=
MIME-Version: 1.0
Received: by 10.216.87.75 with SMTP id x53mr1376479wee.13.1259575927242; Mon, 
	30 Nov 2009 02:12:07 -0800 (PST)
Date: Mon, 30 Nov 2009 11:12:07 +0100
Message-ID: <dc530dbf0911300212i2f8567c5leec880e91ec2ac84@mail.gmail.com>
From: fabio ferrario <ferrario.f@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: ferrario.f@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: kubuntu and opemembedded
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
X-List-Received-Date: Mon, 30 Nov 2009 10:13:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm pretty much a newby in using both bitbake and openembedded but thing is
that I cannot get bitbake working my recipe out.

I followed the 'official' guide
http://wiki.openembedded.net/index.php/Getting_started and eventually, after
sourcing the environment and adding bitbake to my path I see bitbake being
called properly (bitbake --help for instance) I see the recipe being read
(some fake statements are detected) but any time I try to bitbake something
(bitbake nano, bitbake console-image..) I am bounched back with

NO RULE TO MAKE TARGET whatever my target is..

any hint?

Thanks

Fabio

