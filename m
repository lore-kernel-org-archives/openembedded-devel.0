Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1OFAxp-0005NJ-JC
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 20:59:26 +0200
Received: by ywh26 with SMTP id 26so88794ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 11:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=+MExAfgzAVUVAkxOoXVWNuMKkmGhYUqDCGJwf+qNkTM=;
	b=OBpzVhyC4nFPbYPXxKXCMvpC9pT8z8U+6eW4h50yHr0R32zBtB1fAMBvmkpppS3qXC
	C5H5FYSWxsAX0tmOAuDKtPmxQofKmPP/a06+kPmEDOLjyROsKtM4AXo8F3hc+bm1ZkYu
	lllQYynV7L2ccakOXoLHXJkzrLM7EvnuoQLgw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=rABSrE7OsVriVfglT6cQ8WqHVRQ1pIoZ49z2EIaMockgskW3VJIYe1dT5K2tCcKqZL
	pLnWCMJuNizes9cD7D5FJnXD5zdhH9dz5Co2AkqPl+GHogXahmneV+GBIh5qklKwbIWU
	XUdxy4KjZPacJmQCsYJzblhcew1qMr+6Fr2Xc=
MIME-Version: 1.0
Received: by 10.231.174.130 with SMTP id t2mr456738ibz.50.1274381720749; Thu, 
	20 May 2010 11:55:20 -0700 (PDT)
Received: by 10.231.171.85 with HTTP; Thu, 20 May 2010 11:55:20 -0700 (PDT)
In-Reply-To: <20100520031142.GD25484@denix.org>
References: <q2vade1bdc1004260340j4881a020t22a79b4e1279ade3@mail.gmail.com>
	<20100426174411.GA22763@denix.org>
	<x2rade1bdc1004261848k1f9cfc01yc64057689a22fbb1@mail.gmail.com>
	<20100427025702.GC10320@denix.org>
	<t2gade1bdc1005052310je365713at72a3997b449e46a1@mail.gmail.com>
	<20100520031142.GD25484@denix.org>
Date: Thu, 20 May 2010 20:55:20 +0200
Message-ID: <AANLkTilHKP1aHn04n2y-YN1QCRgNGHERFZ51FcFSBk9E@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: arago-devel@gforge.ti.com
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [arago-devel] dm365 and OE
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
X-List-Received-Date: Thu, 20 May 2010 18:59:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Sorry for the mess - this is still not resolved the way we had hoped. While
> the combined DVSDK is now available in beta, some of the individual
> components, like codecs, are still not available for download separately.
> Looks like we may need to write a recipe to extract necessary pieces from
> DVSDK release... Please be patient, hopefully we'll have the solution soon.
>
>
Ok,
I know you are mantaining many cpus.
My real problem in this moments is to be sure that your DVSDK recipe will be
tested, for dm365, against 2.6.34-rc7 or later Kevin Hilman git tree.
I really prefer not to go back to 2.6.31+2.6.32 arago kernel...
Can I focus to 2.6.34 development and have an approximative idea
(june,july,august,september,october, ...) in which I'll have a release DVSDK
?
The important point is anyway not to develop the kernel twice.

Thank you very much for your help,
Raffaele

