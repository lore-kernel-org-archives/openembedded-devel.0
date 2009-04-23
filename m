Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Lwvj7-0000gy-AE
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 12:00:17 +0200
Received: by ewy20 with SMTP id 20so393210ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 02:55:38 -0700 (PDT)
Received: by 10.210.87.19 with SMTP id k19mr7380025ebb.39.1240480538521;
	Thu, 23 Apr 2009 02:55:38 -0700 (PDT)
Received: from xora-eee.xora-domain (93-97-174-2.zone5.bethere.co.uk
	[93.97.174.2])
	by mx.google.com with ESMTPS id 7sm1590450eyb.45.2009.04.23.02.55.37
	(version=SSLv3 cipher=RC4-MD5); Thu, 23 Apr 2009 02:55:38 -0700 (PDT)
Message-ID: <49F03B0C.70306@xora.org.uk>
Date: Thu, 23 Apr 2009 10:55:24 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1b3pre) Gecko/20090324 Fedora/3.0-2.1.beta2.fc11
	Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF76D@hiob.intern.dresearch.de>
	<gspddj$ctn$1@ger.gmane.org>
In-Reply-To: <gspddj$ctn$1@ger.gmane.org>
Subject: Re: deploy multiple kernel image types
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
X-List-Received-Date: Thu, 23 Apr 2009 10:00:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/23/2009 10:46 AM, Koen Kooi wrote:
> On 23-04-09 09:31, Sledz, Steffen wrote:
>> Is it possible to deploy multiple kernel image types (e.g. zImage and 
>> uImage) at the same time? As i understand it right KERNEL_IMAGETYPE 
>> allows just one argument.
>
> At the moment: no, but I would be interested in such functionality for 
> boards using kexecboot initramfs inside a uImage that will load a 
> zImage from disk.
>
The deploy part is easy, its the deciding how to handle the packaging 
that needs some thought!

Graeme



