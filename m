Received: from [72.167.82.86] (helo=p3plsmtpa01-06.prod.phx3.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1N8zLu-0007fE-HC
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 17:50:29 +0100
Received: (qmail 32030 invoked from network); 13 Nov 2009 16:42:26 -0000
Received: from unknown (75.49.209.68)
	by p3plsmtpa01-06.prod.phx3.secureserver.net (72.167.82.86) with ESMTP;
	13 Nov 2009 16:42:25 -0000
Message-ID: <4AFD8C6C.4090606@mwester.net>
Date: Fri, 13 Nov 2009 10:42:20 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911130443520.1157@localhost>	<4AFD4DD6.70509@balister.org>	<alpine.LFD.2.00.0911130732220.17745@localhost>
	<4AFD5440.6080202@balister.org>
In-Reply-To: <4AFD5440.6080202@balister.org>
X-SA-Exim-Connect-IP: 72.167.82.86
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Fri, 13 Nov 2009 16:50:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> On 11/13/2009 07:34 AM, Robert P. J. Day wrote:
>>    i'm not on F11 anymore, i'm effectively on F12 (fully-updated f12
>> beta).  i made the upgrade a couple days ago and that's when those
>> other packages broke.  hmmmm ... i really should have made that
>> chronological connection.
>>
>>    but after the upgrade, i did a full rebuild of everything and those
>> were the only packages to fail.  so, percentage-wise, that's not bad.
> 
> I'm on F11 fwiw.
> 
> I got this from gsb and a core file:
> 
> http://pastebin.ca/1669812
> 
> Philip
> 
>>
>> rday

Same python-native failure.

Fedora 10, the host hasn't been updated in many many weeks (so host
changes are ruled out).  CCACHE is disabled.  xterm is not installed on
the host.  It is a 64-bit install.

-Mike (mwester)


