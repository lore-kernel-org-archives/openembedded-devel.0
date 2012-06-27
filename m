Received: from smtp-out12.han.skanova.net ([195.67.226.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1SjyjT-0000ft-FM
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 22:20:59 +0200
Received: from [10.175.196.243] (217.208.84.65) by smtp-out12.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 4FAE31D900AF8994 for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 22:07:16 +0200
Message-ID: <4FEB67F4.5030400@emagii.com>
Date: Wed, 27 Jun 2012 22:07:16 +0200
From: Ulf Samuelsson <openembedded@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FEAE2BE.9010707@emagii.com>
	<0C757E680E33864AB113392C7E83F9100198054F@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F9100198054F@GSX300A.mxchg.m.corp>
Subject: Re: Missing kernel modules in OE 2011.03
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
X-List-Received-Date: Wed, 27 Jun 2012 20:20:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-06-27 13:06, Hauser, Wolfgang (external) wrote:
> Hello,
>
>> For some reason, some kernel modules are not present in the rootfs.
>> Others are present.
> have you added the according kernel module packages to your image to be
> installed ?
No,  I made a derivative of an image, I got from a customer,
which apparently did not include "kernel-modules".
If I add that to the image, I get the stuff I want.

Wasn't aware that you need to include that in an image.
Thought this was simply bitbake magic.

Is there ever a case when you do not want to have the modules
that you so cunningly configured for your kernel build???

What I find strange  is that some modules are there, but not others.
I guess that some package, adds that outside the kernel...

BR
Ulf Samuelsson
> Regards
> Wolfgang
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




