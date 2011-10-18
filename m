Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RG4xs-00005n-8T
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 10:24:00 +0200
Received: from iph2.telenor.se (iph2.telenor.se [195.54.127.133])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 14B9EE9CC6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 10:18:11 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtMvAJw1nU5T4zkNPGdsb2JhbAAMN4k8kD6OfAEBAQE3gl9APRYYAwIBAgExJwgBAb48iBsEk32RWA
X-IronPort-AV: E=Sophos;i="4.69,364,1315173600"; d="scan'208";a="496399508"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph2.telenor.se with ESMTP; 18 Oct 2011 10:18:08 +0200
Message-ID: <4E9D3640.9070608@telia.com>
Date: Tue, 18 Oct 2011 10:18:08 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Use of stamps in the source directory of openembedded-core
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
X-List-Received-Date: Tue, 18 Oct 2011 08:24:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

After I have built openembedded-core, I notice that the source directory
is loaded with files: *.done.

Is this really a good idea?

I tend to use a common source directory for multiple projects.

Having stamps in the source directory, means that you let one
project affect the others.

-- 
Best Regards
Ulf Samuelsson



