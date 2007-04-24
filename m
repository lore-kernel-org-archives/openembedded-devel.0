Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HgRDc-0006za-6O
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2007 22:02:37 +0200
Received: by wx-out-0506.google.com with SMTP id t14so2272808wxc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2007 13:02:29 -0700 (PDT)
Received: by 10.90.63.16 with SMTP id l16mr2130918aga.1177417608508;
	Tue, 24 Apr 2007 05:26:48 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id j7sm10990492nzd.2007.04.24.05.26.46;
	Tue, 24 Apr 2007 05:26:47 -0700 (PDT)
Date: Tue, 24 Apr 2007 15:26:46 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <2510684605.20070424152646@gmail.com>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <462C676C.3070305@dominion.kabel.utwente.nl>
References: <1597775703.20070405182752@gmail.com>
	<46156BCD.6060407@whitby.id.au> <02429232.20070410152736@gmail.com>
	<461C85D6.1010105@whitby.id.au>
	<1363913311.20070423101551@gmail.com>
	<462C676C.3070305@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] Adding sanity to OE startup process
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2007 20:02:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Monday, April 23, 2007, 10:59:40 AM, you wrote:

> Paul Sokolovsky schreef:

>>         Also, confirmed that file log rotation works at least with
>> busybox 1.2.1. Cleaned up syslogd.conf fixed to not contain confusing
>> statements this is not supported, committed. Koen, what do you think
>> about switching Angstrom's default setting to /var/log/messages after
>> this, to make it easier for non-busybox people? After all, main
>> trouble with file logging is now fixed - it cannot grow unlimited in
>> size.

> Sounds ok to me.

        Patch posted at http://bugs.openembedded.org/show_bug.cgi?id=2135

> regards,

> Koen

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



