Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K8Ac1-00033R-Rr
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 11:03:00 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K8AbM-0001he-Vb
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 09:02:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 09:02:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 09:02:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Jun 2008 11:01:59 +0200
Message-ID: <g35a67$r1a$1@ger.gmane.org>
References: <48561735.5030700@compulab.co.il>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008061003)
In-Reply-To: <48561735.5030700@compulab.co.il>
Sender: news <news@ger.gmane.org>
Subject: Re: Different EXTRA_INSTALL for different machines
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 16 Jun 2008 09:03:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Mike Rapoport wrote:
> Hi,
>
> I'm building Angstrom images for different machines and I need to include
> different sets of extra packages in the images. Is it possible to make
> EXTRA_INSTALL dependent on the machine in the same local.conf?

EXTRA_INSTALL_machine1 = "foo"
EXTRA_INSTALL_machine2 = "bar"
EXTRA_INSTALL_machine3 = "qux"

regards,

Koen




