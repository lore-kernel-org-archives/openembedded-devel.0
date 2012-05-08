Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SRlkm-0003IB-9x
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2012 16:51:04 +0200
Received: by eekc1 with SMTP id c1so1574728eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2012 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=74CK0NB9PAWgmAIu07Qqj5i3VcTW2vte2KrDkbouwwQ=;
	b=HRzZBwjqpUk0pa+ovzgyp4VpuHfEz9CjTuZrjsScw5ZA9JPBUfM/kszkr8zyZJ2C2x
	nfCirFYmj7w0XBnBdzDQdj7zta6ahTCG1jL0yYJ7/UK8F0gh/OVhITGr8odma1MHKvjr
	zkJ09ttjz5azqsQrkSrk/WMANAy8xY92BnztkwqrHadEhrEGEJjq++186/UlwCKaT5EK
	Y0t/xMDJ2Y3elNBerBOHCEwaJPqusQFbO/710OTyHCdNk/PTCyd1lns1lF8z1UgS5bl0
	StHm0FMbeMSUOcNbohIzN2K6Zu5k2r2fb7zLnAPwHMp0AQJfK60xEigo2wGK22UT/MUT
	3CIQ==
MIME-Version: 1.0
Received: by 10.50.194.163 with SMTP id hx3mr10666928igc.49.1336488072457;
	Tue, 08 May 2012 07:41:12 -0700 (PDT)
Received: by 10.231.49.134 with HTTP; Tue, 8 May 2012 07:41:12 -0700 (PDT)
Date: Tue, 8 May 2012 16:41:12 +0200
Message-ID: <CAOHjBZud0iQwc+FUQSkzxkVVWhZwgbCowNw8KSscOxtHmFcE0g@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe-core] How to produce toolchain sdk
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
X-List-Received-Date: Tue, 08 May 2012 14:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

as you have understood from my previous requests, I'm a newbe of OE-Core
and I'm wondering
which is the better way to build a toolchain sdk.
I'm understanding it's different respect the classic openembedded tree
(where I was able to build it).
Please can you help me?

Thanks,
Giuseppe

