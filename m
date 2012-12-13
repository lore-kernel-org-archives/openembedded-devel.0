Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1Tj8t5-000837-SO
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 14:31:45 +0100
Received: by mail-vc0-f175.google.com with SMTP id fy7so2183851vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 05:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=5EYpFeRhYj2D+VQw8v1fpUXza6WucmWMda0P3/PuTos=;
	b=e+yTDu2hptSlfVgmkCOeFB6yOhQ+nUJRfaPMkxeO1aJh1eqVsT2nEz4ZdiCXqD3hsq
	0sL1Wr/mNT/vQnbUlLXuusPa5El+GIMUPVThZNWRcAZ76zMpbbK6W2zhcazqAle+Bisk
	aKK70AWUVurb+nyGOtfjHoFWXW2Lc2in5kElvafofwsbBYBuq0DxHS5ikqvOfdlHahyX
	UE6+68wPm6gI5Qx3uliju4W5QRWPlCq/ZTqAXFeicwyDzpPyGC0qKLsZm6K0Uc3YDbSK
	QeIdGHxQflL6Ch++07nwRbatjsZGpTCh9nZ1niaQQS6Bx8akwbbbY1f3IM+prPDw3L/v
	Q7CQ==
MIME-Version: 1.0
Received: by 10.52.19.20 with SMTP id a20mr2874899vde.26.1355404628631; Thu,
	13 Dec 2012 05:17:08 -0800 (PST)
Received: by 10.58.155.199 with HTTP; Thu, 13 Dec 2012 05:17:08 -0800 (PST)
Date: Thu, 13 Dec 2012 08:17:08 -0500
Message-ID: <CAOd_LFwmq3uoDBn=i9pPvcoJKHspOsnmENKazWp9cNJ5cOm9rA@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: current bbappend issues
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
X-List-Received-Date: Thu, 13 Dec 2012 13:31:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

ERROR: No recipes available for:
  /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
  /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
  /scratch/oe/oe-build-core-3/sources/meta-ti/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
  /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
ERROR: Command execution failed: Exited with 1

I rarely can get the HEADS of meta-oe and oe-core to parse anymore.
I'm not complaining, as with a little bit of work I can usually back
up a bit and find something that matches.  But wondering if it help to
make Martin Jansa a meta-oe maintainer or something simple like that?

Thanks,
Cliff

-- 
=================
http://bec-systems.com


