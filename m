Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1Jisat-0001U5-Vd
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Apr 2008 16:45:12 +0200
Received: by fg-out-1718.google.com with SMTP id 13so1171617fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2008 07:45:09 -0700 (PDT)
Received: by 10.82.185.12 with SMTP id i12mr1131138buf.56.1207579508359;
	Mon, 07 Apr 2008 07:45:08 -0700 (PDT)
Received: by 10.82.119.15 with HTTP; Mon, 7 Apr 2008 07:45:07 -0700 (PDT)
Message-ID: <74d0deb30804070745s3f55564fo7f8f2112cfa5f1f2@mail.gmail.com>
Date: Mon, 7 Apr 2008 16:45:07 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0804010333i4c63c490n2f5f48db5dcf9bec@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0803311500r15a7b84fp2515f3b54ad747a4@mail.gmail.com>
	<fssll5$uhe$1@ger.gmane.org>
	<c384c5ea0804010333i4c63c490n2f5f48db5dcf9bec@mail.gmail.com>
Subject: Re: [Review] Remove /xorg-lib/pixman_* in favor of /libpixman/libpixman_*
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
X-List-Received-Date: Mon, 07 Apr 2008 14:45:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Apr 1, 2008 at 12:33 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello Koen,
>
>
>  On Tue, Apr 1, 2008 at 8:44 AM, Koen Kooi
>  <koen@dominion.kabel.utwente.nl> wrote:
>  >  How about dropping the xorg-lib one and renaming libpixman to pixman?
>  >
>  +1 on both. I'll commit tomorrow if nobody beat me to it.

Sorry I'm late, but I kind of maybe disagree a bit. I might be
confused about the cairo/xorg source locations, but as I understand
it, xorg.freedesktop.org/releases/individual/lib is the canonical
upstream version. So why not put it in xorg-lib and make use of
xorg-lib-common.inc?

+1 on the libpixman -> pixman part though.

regards
Philipp


