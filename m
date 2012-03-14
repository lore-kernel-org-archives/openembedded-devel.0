Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7p1I-0001kH-2x
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 15:17:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id F0150315A13E;
	Wed, 14 Mar 2012 15:08:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gWNfrnJLf-JQ; Wed, 14 Mar 2012 15:08:46 +0100 (CET)
Received: from [172.22.22.61] (drms-590ecefe.pool.mediaWays.net
	[89.14.206.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0D781315A13C;
	Wed, 14 Mar 2012 15:08:46 +0100 (CET)
Message-ID: <4F60A66D.2040504@opendreambox.org>
Date: Wed, 14 Mar 2012 15:08:45 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <20120313114820.9572210335@opal>
	<20120314084016.GD3919@jama.jama.net>
	<4F60A1A6.4090204@opendreambox.org> <1451828.nMSFA2UD84@helios>
In-Reply-To: <1451828.nMSFA2UD84@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Andreas Oberritter : qt4: fix deps in libQtWebkit.la and QtWebKit.pc
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
X-List-Received-Date: Wed, 14 Mar 2012 14:17:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 14.03.2012 15:02, Paul Eggleton wrote:
> On Wednesday 14 March 2012 14:48:22 Andreas Oberritter wrote:
>> I thought that Qt 4.8 didn't use WebKit2 by default. Did you enable it
>> manually?
> 
> FYI our Qt 4.8 recipes enable QtWebkit by default.

Yes, but QtWebKit 2.2, which is included in Qt 4.8, uses WebKit, not
WebKit2, right?

Regards,
Andreas


