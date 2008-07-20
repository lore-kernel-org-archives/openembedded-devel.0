Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shanevolpe@gmail.com>) id 1KKbYR-0004DM-HH
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jul 2008 18:14:35 +0200
Received: by wa-out-1112.google.com with SMTP id j37so558245waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2008 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=yCez+iWLFzsIrS56ZHXugOyjwW2oOa6mCL/YoB9iVO4=;
	b=oyLMakLFXTjm7/rdUUHUS3+vx3PyFoePJ3iJK60pz7Cg044ylI5veVjFilvx91bRSi
	EmWFOt8P1qeZqV+s2gs+af0PEC9A0kbPn1H3TYbrwVdcIkwVgNm+EbSJfGegoER9avu8
	4jIEHtB/BxSX8c2eYLqm64qF1TbKhPJvZck9U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=qfWp6mEm6ry2HaLEJD0jv96iqhWfSR1cS0vxJYYOq0hUaV8XmbwQ6Km/ReXWXg/rfu
	K/gR3FnDDtPoDMrRkR/o9I9IW+snNmZCPM/O4/8EWowoOgq2CaLfguWFKOT/HitYvihg
	ovGTaPpoDwKucZ5t+QEwQvrcKyUxskAzpEywY=
Received: by 10.114.109.1 with SMTP id h1mr1981225wac.35.1216570416176;
	Sun, 20 Jul 2008 09:13:36 -0700 (PDT)
Received: by 10.114.24.11 with HTTP; Sun, 20 Jul 2008 09:13:36 -0700 (PDT)
Message-ID: <8c7950360807200913q20f35f91iac45d216665738d9@mail.gmail.com>
Date: Sun, 20 Jul 2008 12:13:36 -0400
From: "Shane Volpe" <shanevolpe@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: wiki development pages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 20 Jul 2008 16:14:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm going to start some wiki pages on the OE wiki that will be very
rough and under heavy development.  Should I make a wiki section
called "Pages under heavy development" or just put a disclaimer at the
top of the pages saying it is under development and probably contains
incorrect data?

The page I'm creating is detailing how I used OE in a commercial
product and my approaches in version control, build repeatability and
generally integrating into my company's design process and
productization.  I'm sure my approaches were not always optimal so I
hope after I have my approaches documented that others will give
feedback so we can make a nice wiki on how to use OE in a commercial
design process.
Regards,
Shane


