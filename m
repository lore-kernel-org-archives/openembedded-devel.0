Received: from smtp-out21.han.skanova.net ([195.67.226.208])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RDNSt-0007Be-43
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 23:32:51 +0200
Received: from [10.175.196.247] (83.227.57.13) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 4E79D85B0076AA20 for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 23:24:19 +0200
Message-ID: <4E936282.3030505@telia.com>
Date: Mon, 10 Oct 2011 23:24:18 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: psyco-dist not supported on 64 bit Linux
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
X-List-Received-Date: Mon, 10 Oct 2011 21:32:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

psyco-dist will not run on a 64 bit linux.
The guys behind psyco-dist recommends the use of PyPy

What is the recommendation for 64 bit linux?

Just run without JIT?
Don't run on a 64 bit linux?
Anything else?

-- 
Best Regards
Ulf Samuelsson



