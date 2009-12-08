Received: from mail-ew0-f210.google.com ([209.85.219.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <niko84embedded@googlemail.com>) id 1NI776-0006D6-6W
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 21:56:55 +0100
Received: by ewy2 with SMTP id 2so4517405ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 12:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=/Mxo356Y7NAosaYcpERnNRE5RCqrCUfu3nsaPwafXSQ=;
	b=t7mXevsLAImDKdnRSZcBsUG4Zln8Bf1xAnMXFnGzlxaaqpJBDG8/X1q6IlKESO1yEd
	HZGWZCHluvCiHSfH0AqFRSGGrelC9TikoyQzyzLNvt6a7TpRNz8T/gGVa5eQOr7E65VB
	8W2ZvicEe9eagdBMn4HRcZTpgkPX31oNWxX1g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=gH2j0qlxwArjvSJeM+73tdrso+X6UjaAoBphqVmbseDVRw5X2hPW1Y7k8BXaxztuMk
	gnfqx2JCyXuvrpxgKBzPvKhFV6Wa47BGmOEWC+rmP/RMABwVsvsgwlA2MZIpjbDhkOIG
	SL4gClVEugaNnVornibjqDpdqC1Ii8gv/qIWE=
MIME-Version: 1.0
Received: by 10.216.89.11 with SMTP id b11mr759820wef.171.1260305711469; Tue, 
	08 Dec 2009 12:55:11 -0800 (PST)
Date: Tue, 8 Dec 2009 21:55:11 +0100
Message-ID: <c1c0c07e0912081255r2bcb06c9mcf5485d478bad1dc@mail.gmail.com>
From: Niko Lau <niko84embedded@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.210
X-SA-Exim-Mail-From: niko84embedded@googlemail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: =?UTF-8?B?Li9nbnVwbG90OiBjYW7CtHQgcmVzb2x2ZSBzeW1ib2wgJ3BuZ19wYXNzX3lzdGFydCc=?=
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
X-List-Received-Date: Tue, 08 Dec 2009 20:56:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I have a custom board based on the at91sam9260 with a handmade linux system.
I'm now trying to switch to a oe system.
I went throught the getting started and made the helloworld program (with
uclib), which worked fine on my board.
After that I built gnuplot. When I try to start it on my board I get the
above error.
Sounds for me like a missing lib, but libpng and libgd is on the target.
Has someone a idea what the problem is?

THX

