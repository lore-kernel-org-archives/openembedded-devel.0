Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S8Dlg-0008AC-Uy
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 17:43:12 +0100
Received: from cpc9-live20-0-0-cust612.know.cable.virginmedia.com
	([82.42.142.101] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S8Dcs-0007mq-1x
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 16:34:06 +0000
Message-ID: <4F6219FC.7010506@dynamicdevices.co.uk>
Date: Thu, 15 Mar 2012 16:34:04 +0000
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F610B38.5060309@dynamicdevices.co.uk>
	<CAP9ODKo_RMjJ1BsP9QQHJY8xwmRzBie3L0DuB1e7jr=N_kuekQ@mail.gmail.com>
In-Reply-To: <CAP9ODKo_RMjJ1BsP9QQHJY8xwmRzBie3L0DuB1e7jr=N_kuekQ@mail.gmail.com>
Subject: Re: oe-core layer including support for i.MX28
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
X-List-Received-Date: Thu, 15 Mar 2012 16:43:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Otavio,

 >I am working on that; my current work in progress can be seen at 
https://github.com/OSSystems/meta-fsl-arm

Thanks for that. I had a quick go ad building and as you say I saw 
bitbake fails as it's trying to build up a patched linux-imx kernel.

"include/linux/pagemap.h: In function 'fault_in_pages_readable':"

Maybe the best way for me to proceed would be to put in a pull request 
on your wip-imx28 branch and see if I can add my oe-classic imx28 
specifics into the copy?

Best Regards,

Alex



