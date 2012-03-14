Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S7vjY-0006En-V7
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 22:27:49 +0100
Received: from cpc9-live20-0-0-cust612.know.cable.virginmedia.com
	([82.42.142.101] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S7vam-0007Cp-2z
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 21:18:44 +0000
Message-ID: <4F610B38.5060309@dynamicdevices.co.uk>
Date: Wed, 14 Mar 2012 21:18:48 +0000
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: oe-core layer including support for i.MX28
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
X-List-Received-Date: Wed, 14 Mar 2012 21:27:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to begin the migration from oe-classic to oe-core, focussing 
on Freescale's
i.MX28 and i.MX51. I recall there was i.MX28 kit being demo'd at FOSDEM 
but I can't
seem to find support anywhere for the i.MX28, which I thought might be 
in meta-fsl-arm?

Can anybody point me in the right direction? (I've half a mind to try 
adding the support
into meta-fsl-arm myself but that would seem somewhat wasteful if it's 
already been
done)

Thanks,

Alex/



