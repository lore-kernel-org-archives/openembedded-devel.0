Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LmkOg-0006MK-St
	for openembedded-devel@openembedded.org; Thu, 26 Mar 2009 08:53:07 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LmkN3-0008Et-8w
	for openembedded-devel@openembedded.org; Thu, 26 Mar 2009 07:51:25 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 26 Mar 2009 07:51:25 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Mar 2009 07:51:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 26 Mar 2009 08:51:12 +0100
Message-ID: <gqfc5g$411$1@ger.gmane.org>
References: <cover.1238025789.git.andrea.adami@gmail.com>
	<eaff36cccf868e5b367b402fb61451bf8f681bd8.1238025789.git.andrea.adami@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090316 Shredder/3.0b3pre
In-Reply-To: <eaff36cccf868e5b367b402fb61451bf8f681bd8.1238025789.git.andrea.adami@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 1/1] angstrom-2008.1.conf: add PREFERRED_PROVIDER_virtual/psplash -silence warning during parsing
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
X-List-Received-Date: Thu, 26 Mar 2009 07:53:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-03-09 01:10, Andrea Adami wrote:

> +#Silence warning during parsing
> +PREFERRED_PROVIDER_virtual/psplash ?= "psplash-angstrom"

NACK, the 'psplash' package should get deleted and replaced with 
'psplash-oe' or something. It was left in place to give people time to 
switch to the new way of installing branded psplash images.

regards,

Koen



