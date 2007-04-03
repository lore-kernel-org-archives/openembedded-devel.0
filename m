Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1HYcAz-0000BH-Lr
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2007 08:07:29 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id BF65E411DC6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2007 01:07:29 -0500 (CDT)
Message-ID: <151901c775b6$2c86fc10$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Apr 2007 01:06:09 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Busybox 1.5.0 available for testing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2007 06:07:29 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Busybox 1.5.0 is committed.  It is marked with preference = -1, so it should
NOT be automatically included in anyone's builds.

It's considered less-than-stable upstream, so be prepared for anything to
happen with it.  I re-did the patches that are applied, a couple of them no
longer seem pertinent at all, but since they are referenced in the
busybox.inc file, I don't know how to "un" specify them for 1.5.0 and higher
versions.

I'm sure the .bb file could use a cleanup, but that will probably take a
better bb person than I.

Regards,
Mike (mwester)




