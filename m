Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LSwQw-0006ot-FR
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jan 2009 17:41:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 4EE652C8F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 16:33:19 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRkfyh6CVEeA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 16:33:17 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id E7CB22C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 16:33:16 +0000 (UTC)
Message-ID: <49832BE7.6090801@gmail.com>
Date: Fri, 30 Jan 2009 17:33:43 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1233059140.7818.4.camel@ubuntu2>
	<497F0D92.4040904@gmail.com>	<1233136141.7444.3.camel@ubuntu2>
	<49802D8A.6020208@gmail.com> <1233227644.6517.5.camel@ubuntu2>
In-Reply-To: <1233227644.6517.5.camel@ubuntu2>
Subject: Re: Build problems
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
X-List-Received-Date: Fri, 30 Jan 2009 16:41:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> On mer, 2009-01-28 at 11:03 +0100, Marco Cavallini wrote:
>> Paolo Cremonese ha scritto:
>>> OK, I have built the image wihout errors, thank you.
>>>
>>> Now, what I have to do to create a bootable compact flash with the
>>> image?
>>>
>>> Thanks in advance,
>>> Paolo
>> Paolo,
>> I'm just working on a system like your, but with i486.
>>
>> 1. prtition your CF
>> 2. format CF ext3
>> 3. load (untar) yourimage.tar into CF
>> 4. install bootloader (GRUB)[1]
>>
>> [1] GRUB build in OE is broken at the moment, I'm patching it ;-)
>>

GRUB patch is ready and should be pushed soon by hrw.

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


