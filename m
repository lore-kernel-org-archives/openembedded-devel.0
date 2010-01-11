Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1NUS9m-0000xx-SS
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 22:50:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id A4A5261AEA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 16:48:31 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28605-10 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 11 Jan 2010 16:48:31 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 7F55F2BC98D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 16:48:31 -0500 (EST)
Message-ID: <4B4B9CAF.7030806@cbnco.com>
Date: Mon, 11 Jan 2010 16:48:31 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B4B9189.3080906@rambler.ru> <4B4B93E8.7090202@cbnco.com>
	<4B4B9718.1040204@rambler.ru>
In-Reply-To: <4B4B9718.1040204@rambler.ru>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Building x86_64 target
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
X-List-Received-Date: Mon, 11 Jan 2010 21:50:42 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Perepelica Alexander wrote:
> Sorry, for dummy question (I am new with OE) but this config I must save 
> into distro folder?

You can put it under conf/machine/, or just stuff the values into your 
local.conf:

http://wiki.openembedded.net/index.php/Getting_started#Create_local_configuration

Mike


