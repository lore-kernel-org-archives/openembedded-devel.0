Received: from [65.55.90.46] (helo=snt0-omc1-s35.snt0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <huru_ukko@hotmail.com>) id 1LrFJi-0006kb-Ad
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 19:43:09 +0200
Received: from SNT105-W64 ([65.55.90.8]) by snt0-omc1-s35.snt0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 7 Apr 2009 10:39:34 -0700
Message-ID: <SNT105-W64E92C9061ABE0CC32BA6A90850@phx.gbl>
X-Originating-IP: [91.153.19.197]
From: Mauri Sandberg <huru_ukko@hotmail.com>
To: <openembedded-devel@openembedded.org>
Date: Tue, 7 Apr 2009 20:39:34 +0300
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 07 Apr 2009 17:39:34.0434 (UTC)
	FILETIME=[D0A00820:01C9B7A7]
X-SA-Exim-Connect-IP: 65.55.90.46
X-SA-Exim-Mail-From: huru_ukko@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,HTML_MESSAGE,
	RDNS_NONE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: uClibc and 2.6.12.6 linux headers
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
X-List-Received-Date: Tue, 07 Apr 2009 17:43:14 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


Hi=2C

I have let myself to be told that you need to have matcing kernel headers t=
o your kernel version when you are building uclibc.

I would need to build uclibc with 2.6.12.6 linux headers as I am trying to =
put together a system that is based on a kernel with that same version. I h=
ave tried to use PREFERRED_VERSION etc but bitbake always selects newest he=
aders and ignores me totally.

How to proceed here?

-- Mauri


_________________________________________________________________
Drag n=92 drop=97Get easy photo sharing with Windows Live=99 Photos.

http://www.microsoft.com/windows/windowslive/products/photos.aspx=

