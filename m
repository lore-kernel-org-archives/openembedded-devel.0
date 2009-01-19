Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LOtLj-0007YL-6E
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jan 2009 13:35:27 +0100
Received: by bwz8 with SMTP id 8so7035080bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2009 04:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XRS/FIdbSUxdkgveTgfm2x+6zXi7v0x5a/HHykYARKo=;
	b=HvOgdnmXrBBJ7FSTKeqIAF5HhvBMXq5fMDkMTxjqXoTTpSYJp/GyhRRY52N6+rno8E
	qsmM1ny2NNmiTdd+k2pajPh/+ZA+7R8wxF5JMxbzsgDm0Ano//zFI5/tNc67Dq4LObdx
	1jqH8oykURPznvW6Ei8Z5UMd7wu1bDHpNzKH8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tdC/K3pXuTa6pRt2Yvfj9MtEmznZeA+TEHH+sJ9LAH4lOWH8rlxl6JSYR3yNcKoKX2
	05vr7/m6D5GXAe+kXDPpT4U15OlFgm1+EpLs0hsG/lNMTsMUrjG3wagpuMBxZUf6uSaZ
	pdJbvlUuR+q9Z+2E3n4yB/qiVBwf0Qjmyh+VQ=
MIME-Version: 1.0
Received: by 10.180.250.7 with SMTP id x7mr900462bkh.175.1232368045522; Mon, 
	19 Jan 2009 04:27:25 -0800 (PST)
In-Reply-To: <d1b08f940901190236y132993ffn6a7586b1e37b18b1@mail.gmail.com>
References: <d1b08f940901150928h56ede408u2d070606fbe6b7bc@mail.gmail.com>
	<d1b08f940901160534n2d204a36r43494e1a6ed855c5@mail.gmail.com>
	<1232121627.4988.2795.camel@hammer.suse.cz>
	<200901162008.03815.jay4mail@gmail.com>
	<20090117233309.192da673@zaurus.utx.cz>
	<d1b08f940901190236y132993ffn6a7586b1e37b18b1@mail.gmail.com>
Date: Mon, 19 Jan 2009 13:27:25 +0100
Message-ID: <d1b08f940901190427o779f9073m87ba1669b4f85e64@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: ARM bootloaders (Zaurus) and CMDLINE
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
X-List-Received-Date: Mon, 19 Jan 2009 12:35:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> Note: current OE update.sh does not flash correct checksum after
>flashing the kernel

We are going OT but I add here another couple of links...this thread
is summing up all Zaurus 'peculiarities':

http://www.h5.dion.ne.jp/~rimemoon/zaurus/memo_006.htm
-> Wal Wiki
- -> http://digit.que.ne.jp/visit/index.cgi?59414d41 (checksums?)

Regards

Andrea


