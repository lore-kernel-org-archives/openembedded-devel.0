Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N6wJM-00013Q-IJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 02:11:23 +0100
Received: by bwz9 with SMTP id 9so2245836bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 17:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=RYyx8LlQCE7w0nBrjQZeArAs+8IIeOE7B5199Z0pI8Q=;
	b=sC51SoenQkm9FlKnJEygYpTiQG34a9yEbKnPQUnlYQzNVG/KUGeg+AVYYLcVvbNVWS
	UyXxY8mgaS/8/G6Jl1czHaYL0A8biBqXMVnqa/GNK92s+oh4A+mzSwnmzFFXvjtETOjn
	eM6HHfZ5aWEuJtcPggJXh2SE1EpPHHAIJ93DY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PDvaPoPq/bYuc0ERRT7CYy/NYg4wqYuv6E5TQeXbPY4YcMSotNlbFumPWRNArMRAzP
	nxo3AnKrZErvTXuGs9ArFdqt/sgPEhyR9Wpuggh2tl7d2ffkv4H4vUZfPKHCCKdkWVYz
	WyNORbAouqIZ2XzTdPexVZBFF4JSe00W1yOJQ=
MIME-Version: 1.0
Received: by 10.239.182.158 with SMTP id q30mr646095hbg.23.1257642238053; Sat, 
	07 Nov 2009 17:03:58 -0800 (PST)
Date: Sun, 8 Nov 2009 02:03:58 +0100
Message-ID: <c384c5ea0911071703o4aec5583w140a128328b5bdcc@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Machines/users of squashfs 4.0 with lzma?
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
X-List-Received-Date: Sun, 08 Nov 2009 01:11:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Otavio, all,

I saw you as the committer/author for the current bitbake for squash
4.0 stuff with lzma patches, thanks for that.

As lzma support is now (almost!) landed upstream, I would like to see
what the impact is of moving to the upcoming 4.x release.

I have a patch on standby that moves from 4.0+patches to the current
SVN where lzma is built-in.

However, first, who is using this??

Regards,
-- 
Leon


