Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N23BP-0002CX-R5 for openembedded-devel@lists.openembedded.org;
	Sun, 25 Oct 2009 14:30:58 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N23AP-0007dQ-Ab
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Oct 2009 14:29:53 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2009 14:29:53 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2009 14:29:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 25 Oct 2009 14:29:33 +0100
Message-ID: <hc1jrt$ki8$1@ger.gmane.org>
References: <44440.3488342234$1256472302@news.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <44440.3488342234$1256472302@news.gmane.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC/PATCH] Add support for XFCE 4.6.1.
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
X-List-Received-Date: Sun, 25 Oct 2009 13:30:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-10-09 13:02, John Willis wrote:

> For now it adds an xfce46.bbclass to support the builds and lives alongside
> of XFCE 4.4 but in fairness I would like to propose dropping XFCE 4.4.* from
> dev (and leaving it in stable/2009 for now).

What would be the big advantage of deleting them? I'm generally not a 
fan of deleting recipes "because we can". OE has lots of users that 
don't read this mailinglist (which they should...) and generally start 
bitching (but not to oe mailinglists, as they should) when we drop 
stuff. That's of course largely their own fault for trying to live in 
their own insulated bubble, but it would be nice if OE can make their 
lives easier.

You're point that stable/2009 would still have them is a valid point :)

regards,

Koen



