Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1In6lX-0004Cv-TY
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2007 07:09:24 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 101CA412570
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2007 01:09:15 -0500 (CDT)
Message-ID: <003301c81b84$86889470$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <472799E6.5050007@gmx.net><10c701c81b44$549de860$6e01a8c0@twilight>
	<4727C139.1020606@gmx.net>
Date: Wed, 31 Oct 2007 01:08:58 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1914
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1914
Subject: Re: fakeroot 1.7.1 not fetchable
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
X-List-Received-Date: Wed, 31 Oct 2007 06:09:24 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Fakeroot has been upgraded to the latest version available from upstream
(1.8.3).  It seems to work here (famous last words, no?), but this package
has a history of being sensitive, so please take a moment to test.  Aside
from the standard failures you might get when building fakeroot-native, the
other typical failure mode has historically involved strange behavior such
as directories and files being mixed up in the rootfs, and extremely odd
failures when bitbake invokes mkjffs to make the image of the rootfs.

Mike (mwester)



