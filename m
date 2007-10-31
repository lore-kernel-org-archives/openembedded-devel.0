Received: from [194.158.229.90] (helo=smtp-auth-be-05.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1InGb6-0001P0-6X
	for openembedded-devel@openembedded.org; Wed, 31 Oct 2007 17:39:16 +0100
Received: from [192.168.26.12] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140]) (authenticated bits=0)
	by smtp-auth-be-05.sunrise.ch (8.13.1/8.13.5) with ESMTP id
	l9VCP7pD000303; Wed, 31 Oct 2007 13:25:07 +0100
Message-ID: <4728747B.6020805@vollmann.ch>
Date: Wed, 31 Oct 2007 13:26:35 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.7.8) Gecko/20070113 Debian/1.7.8-1sarge10
X-Accept-Language: en
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <471FC1C0.4010103@linux.it>
	<20071025001926.GA14645@lenovo>	<472047C3.20208@student.utwente.nl>
	<20071025121153.GA8231@lenovo>	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>	<20071026134528.GA6182@lenovo>
	<1193483219.6376.100.camel@toontown> <20071027153928.GA6118@lenovo>
In-Reply-To: <20071027153928.GA6118@lenovo>
Subject: Re: getting started - docbook
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2007 16:39:16 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

David Farning wrote:
> 1.1. Linux ................................................
>       1.1.1. Linux Overview ...................
>       1.1.2. Linux Arctoture ...................
>       1.1.3. Linux Development Model..
>       1.1.4. Linux Open Source..............
> 1.2. Embedded Device ............................
>       1.2.1. Device Architure..................
>       1.2.2. Processor..............................
>       1.2.3. Storage.................................
>       1.2.4. Device..................................
> 1.3. Linux Distribution............................
>       1.3.1. Kernel ..................................
>       1.3.2. Userspace.............................
>       1.3.3. File System ..........................
>       1.3.4. Updating ..............................
> 1.4. System startup ..................................
>       ...
> 1.5. Host/Target .......................................
>       ...
> 1.6. Overview ..........................................
> 1.7. History..............................................

This looks like a (more or less general) introduction to
"Embedded Linux".
No problems with that, but make sure not to confuse this with
documentation on how to use OpenEmbedded.

I think there are two different targets for documentation:
  1 - How to use OpenEmbedded
  2 - What to build with OpenEmbedded

There's always a need for both, but I think it's helpful
to keep them separate (but probably reference each other).

Your TOC for an introduction looks like documentation for 2.

   Detlef


