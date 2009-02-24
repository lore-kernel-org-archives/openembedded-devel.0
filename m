Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lc0be-0001sb-D3
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 17:58:06 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lc0Yg-0004Bj-I7
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 16:55:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 16:55:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 16:55:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 24 Feb 2009 17:53:45 +0100
Message-ID: <go18mp$64n$2@ger.gmane.org>
References: <f46da1cf0902201818r3fcf3432oc14929b5f455bbe7@mail.gmail.com>	<f96d234e0902240651r7ad36677h8e828964308e2b50@mail.gmail.com>	<1235492099.27962.62.camel@andromeda>
	<f96d234e0902240837l234c10cdw443d3b4c64f81084@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <f96d234e0902240837l234c10cdw443d3b4c64f81084@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: Importing docs directory to org.oe.dev.
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
X-List-Received-Date: Tue, 24 Feb 2009 16:58:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-02-09 17:37, Cliff Brake wrote:
> On Tue, Feb 24, 2009 at 11:14 AM, Michael 'Mickey' Lauer
> <mlauer@vanille-media.de>  wrote:
>> I want to propose importing the documentation into the org.oe.dev
>> branch, notably in the docs directly.
>
> Sounds good to me.  It is a minuscule amount of data -- no reason to
> have it separate.

It was kept seperate to allow docs write access to the docs, but not to 
the main repository. If we are OK with given docs writes global access, 
please import the docs.
Personally I dislike having a 200MB git repo for a few kiB of docs, but 
then again, my 1TB disk just arrived :)

regards,

Koen



