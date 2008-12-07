Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L9Prw-00046G-Eb
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 21:04:44 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L9PoE-0008ML-OF
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 20:00:54 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 07 Dec 2008 20:00:54 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 07 Dec 2008 20:00:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 07 Dec 2008 21:00:47 +0100
Message-ID: <ghha1f$ugd$1@ger.gmane.org>
References: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>	<d2b9ea600810211323y1dd1fc11i585f26f044696de9@mail.gmail.com>	<20081202174141.GB16628@smtp.west.cox.net>	<1228250322.5456.70.camel@dax.rpnet.com>	<20081202212155.GG16628@smtp.west.cox.net>	<20081206214525.GJ16628@smtp.west.cox.net>
	<20081207193340.GC15204@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <20081207193340.GC15204@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Canadian SDK support
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
X-List-Received-Date: Sun, 07 Dec 2008 20:04:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-12-08 20:33, Tom Rini wrote:

> As an aside, gcc-cross-sdk on arm(v6 only?) is blowing up in fortran,
> but I've got a git bisect narrowing that down now (30 revs left).

gcc-cross-sdk picks the wrong patch (from files/gfortran.patch) instead 
of the correct one from gcc-4.2.4/gfortran.patch. gcc-cross *does* pick 
the right patch.

regards,

Koen





