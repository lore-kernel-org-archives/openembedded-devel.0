Received: from rs69.luxsci.com ([64.49.254.154])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchiii@mtiemail.com>) id 1QhQ3R-0001yR-4l
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 19:50:29 +0200
Received: from [192.168.0.165] (adsl-76-255-12-150.dsl.mrdnct.sbcglobal.net
	[76.255.12.150]) (authenticated bits=0)
	by rs69.luxsci.com (8.13.8/8.13.8) with ESMTP id p6EHeP0E028332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 12:40:25 -0500
Message-ID: <4E1F2A08.1020009@mtiemail.com>
Date: Thu, 14 Jul 2011 13:40:24 -0400
From: "George C. Huntington III" <gchiii@mtiemail.com>
Organization: MicroTools, Inc.
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0.1
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: SDK / external toolchain
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
X-List-Received-Date: Thu, 14 Jul 2011 17:50:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Is there a guide to building an SDK then using it as an external
toolchain?  I'm not "getting it" when i read the /fine/ manual. 
also if I want to build and sdk for both x86_64 and x86_32 is that
possible, or is that 2 separate toolchains? 
how would I build an sdk for 32 bit from my 64 bit machine? ( i suspect
that it would involve canadian cross, but don't speak canadian so
step-by-step for dummies approach would be greatly appreciated!)


